Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BB7B5E16
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 02:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611856.951482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT9D-0000wo-TC; Tue, 03 Oct 2023 00:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611856.951482; Tue, 03 Oct 2023 00:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnT9D-0000u5-QP; Tue, 03 Oct 2023 00:20:23 +0000
Received: by outflank-mailman (input) for mailman id 611856;
 Tue, 03 Oct 2023 00:20:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+eH=FR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qnT9D-00081p-1y
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 00:20:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3723b9c-6182-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 02:20:21 +0200 (CEST)
Received: from AM6PR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::26) by DB9PR08MB7843.eurprd08.prod.outlook.com
 (2603:10a6:10:39e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.26; Tue, 3 Oct
 2023 00:19:50 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::ae) by AM6PR01CA0049.outlook.office365.com
 (2603:10a6:20b:e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 3 Oct 2023 00:19:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.20 via Frontend Transport; Tue, 3 Oct 2023 00:19:49 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Tue, 03 Oct 2023 00:19:49 +0000
Received: from a8fd49509d93.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB2F8189-2E65-46C9-9314-E89314FBE90C.1; 
 Tue, 03 Oct 2023 00:19:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8fd49509d93.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Oct 2023 00:19:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 00:19:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 00:19:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a3723b9c-6182-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJlrGLqKDaI0TNHmKUQtQaySijm/95IRzRFM+oKkebQ=;
 b=fRAUSjyuhJDGQuNBQyLlvRNlGcoTxSE99pDlJAxa4fDlAFvAOA8dhYb+SaEB08SzHqeUcUWrOvpJl4wiREcbLDCCjyAKZ/zKmfsRw91VUtZ5ZvyPSIPm00fl1TYq/Fg0wahB8vf+uzW60XWZPxUHbQoQmrI+2rzq7Xec6o8IBws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef506648ebca0dec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDsqvNwuRUJgqbS6HH/s6cqg43Rrf4KC7k1h/VVlJb4x5fGN2r4+vbIN7KTNEsFAFTVrHziQnKquRdYkn9Y2vXvv+MlTqfqkV5MHeuua5hUhYGlgEXPs2XS65iPc6/p3F7saH1LVfi98GWza111YG7/+pe2DhlRH4ZG2rwfJejwPLTsdIETtDII4XB9ol6ciPYKzx8yyAhcZH/NdkqRyXapErq1KJ+O0INjSKbr0P67o8Luj5mnlLwg5dQRldJQn4yovpjhJXaO4C2Fw5gkNRa9pGkBuh7ZdG/sn33kXyC710aHdhw72w19wOIzioSrYWyiw8/4NQikNg2XJtbGLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJlrGLqKDaI0TNHmKUQtQaySijm/95IRzRFM+oKkebQ=;
 b=XfaJQlCUzb+5LZ+UvkqGpi+ZVK7Hdfrb+kAF62yDWOIyGV6QaOEywe2RcIi5XwT9t3Q7wkH45tL//9xlNUWXSVApx0G4QTVhpeNaZoJClDjB9b+RNXStv7X4y1Ejj4aIKAvHzJRd0gWTfWzBaLuXHb8BRgXi5xY/Dzkxm27hrhyz4lG535zSjHDQOfYh53gXv77gxgawpwF+GV23ye3sao/HYfslPHGWUjq/nU3Wll5F+IQ3YZn3UQkrRfdWh6k7Q72JOxp3dfukxRWgKJfHzoeRYimtUhoJ5fsSCb1JlMGi43Q+seh0vioJctaTmGUcx3pHc+F6iHE4k9iZlAOYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJlrGLqKDaI0TNHmKUQtQaySijm/95IRzRFM+oKkebQ=;
 b=fRAUSjyuhJDGQuNBQyLlvRNlGcoTxSE99pDlJAxa4fDlAFvAOA8dhYb+SaEB08SzHqeUcUWrOvpJl4wiREcbLDCCjyAKZ/zKmfsRw91VUtZ5ZvyPSIPm00fl1TYq/Fg0wahB8vf+uzW60XWZPxUHbQoQmrI+2rzq7Xec6o8IBws=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Thread-Topic: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Thread-Index: AQHZ9Rx0XYZCWJoaU0iHka8JZCUjxbA3GfsAgAAaU4A=
Date: Tue, 3 Oct 2023 00:19:36 +0000
Message-ID: <F8ED4DE9-CE9B-4B51-B702-893D062EFBB7@arm.com>
References:
 <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB6065:EE_|AM7EUR03FT055:EE_|DB9PR08MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8396bd-60ad-4b8b-0462-08dbc3a67514
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZjFoMkoqZlLAs5gJAUfBVhMjeXNN1Smt9rx2htk548S6sI7/t005t7D7teJUv+0hmGLylv8IDu16IktamuYOmmXNcFc5yykgA+ejoGuaL7d2MDgS2cV9uDroxjO3mE1S+OFpE3xYfWiGU7Y9wCVGDX7paIfyqlqX0pbfDcr17sQNmTy6pw3VOFnbVikQySrQASq7Az8yS6MZZlp277t559WyQ6kmbFJaZ3gYvX9YFCHzQAst+QmBw+lVYp+cEZu2PD7Bqd1oxsSRwJgQ1yzwv+xl6XW2Gm1Ogpp8+8HOyvDfBJwfYVLdu6wJ6Xb3b7wXwGYGwZmKpEYll0fwDFcoD1hbyhtIN+8gJJt1PqRR73DMFbBj6duHUuYRuGDj0BWSXiCyK48fxLi58RPHj+naZEjGwjnQvs2rcFp2p4yiHgUK9wTlafOPlx+Q7wT67pkurx8UgjO70QwB7hHBqksC9BhGNkl6W/5Y07NvTnZP24yYM8L7nW/TpyM61DvcKs9XmwxbFEsOVZYsbrzjfZBw3ZOepzOkXYpAunVJVAiZBtE3DVeLCa31Ig1oMmwhPd7NYqMdZmn5pfdmacOoz2Hi6w9SbD8uGntldlj3T/jA6NcPp6t1rFGv5H5AqvPy5HB7uzlszZbfjPmJOu7NbY7ZcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6486002)(71200400001)(478600001)(6506007)(53546011)(91956017)(6512007)(7416002)(2616005)(26005)(36756003)(2906002)(33656002)(558084003)(64756008)(54906003)(66446008)(86362001)(76116006)(66946007)(66556008)(66476007)(41300700001)(316002)(6916009)(5660300002)(38070700005)(38100700002)(122000001)(8936002)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <06400A16A6C6DE459D0C570B8C42C970@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b01a13b-b520-47ca-ce12-08dbc3a66cea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U1E0KTgSi9YRbkzHhwzv4OHXcyiImFV00/Ah2TUZ1BHDtEyO7wLC4t71yUlnMziP1oU2ZBTFCrbU2MCR61Q94W9sI3oyKMxUe94nU5wnxJBIXkMrB2+OpE+1bo3UAXZJLag30BnYWQxPlWOK4XTlKoq9HQ+Y0Sgen6QAZ2JMCgqk5vOAmGkya0GzrAprQgePkvK3VCf60LHWGJa0VyNyeqpj3jw7+IEpxQoL0Jx6BrHh4fXEAkZ6fTxSjBX0b5I2NYfaX8JZedsEKQeOGZDruOie6ko2dCll2qo/U52hzaAbmX1NScGbrT0gTdiNsCy8CIE7L0TIX7y0QAQ20+9tYeC7WQ8f6VN5Wfu3J4wZqUNt6nKWwWBArmcmaFyyp2vYeSYUMDmtzimNFvjt5J/Dvlw+JprOMzNSB36cxc8Yd+A6PkCcBLRWS8+Qq34tsN12cqR5WElldcm/j+c17lVPB6GgxkVc2OiDJJtvIGKNHJvZCC7h56Nv1ZVoXYsf4CDNAixCQIY48SehPa45ZWBxCGpvdJX1ainIF8NMAKBpMkEmwQbCaEJRo73+xxFw0tF2rJ7NYOIknY0QkZiii9o3Poa6yaZVlpAE9m81RZTW8h9tBsG8Za3INE0XQcJ7LuMfYFC16o0DkqYvjTu1z9xZ5kyFOtd11mK/vCTT6aOqY/Gc3Y3icRd7LWv2ApoCXB6aW9vOMREQjD+EnOhGA6XcBOqBS+SKbRVaStzbu0EPywxiVigMQBG3eSM51Oy7x9DF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(2616005)(6506007)(53546011)(6512007)(40460700003)(86362001)(33656002)(40480700001)(81166007)(356005)(36860700001)(36756003)(82740400003)(26005)(336012)(47076005)(4744005)(2906002)(107886003)(478600001)(6486002)(8936002)(8676002)(6862004)(4326008)(316002)(41300700001)(5660300002)(70206006)(70586007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 00:19:49.8665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8396bd-60ad-4b8b-0462-08dbc3a67514
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843

Hi,

> On Oct 3, 2023, at 06:45, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 2 Oct 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry=

