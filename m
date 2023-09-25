Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA067AD13E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607638.945895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfry-0002td-V6; Mon, 25 Sep 2023 07:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607638.945895; Mon, 25 Sep 2023 07:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfry-0002rE-SI; Mon, 25 Sep 2023 07:19:02 +0000
Received: by outflank-mailman (input) for mailman id 607638;
 Mon, 25 Sep 2023 07:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkfrx-0002r5-BA
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:19:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc2df2fb-5b73-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 09:19:00 +0200 (CEST)
Received: from AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) by AS4PR08MB8070.eurprd08.prod.outlook.com
 (2603:10a6:20b:589::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 07:18:53 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::ac) by AS9PR0301CA0047.outlook.office365.com
 (2603:10a6:20b:469::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:18:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.18 via Frontend Transport; Mon, 25 Sep 2023 07:18:53 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 25 Sep 2023 07:18:53 +0000
Received: from c8b045ad45f8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A0D1560-8DA7-4DBB-9FD9-4D2024B6FE5E.1; 
 Mon, 25 Sep 2023 07:18:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8b045ad45f8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:18:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:18:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:18:39 +0000
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
X-Inumbo-ID: cc2df2fb-5b73-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQZdIHxrazf7PWt5eoI+kPjSJSnG/uUzb+As2SKASE4=;
 b=oRSqQQOkhRbWxCmUf678GNBEOwVUxmjnCjczGAAwG6HKgiD+GoSaVx+iX7z/+v6vRWiLyv2xUKe3qRv1A9qOrK1o5tVOnqjRdeYHjzxhPAHhcKB7RbEL0tkQnWrWV8tN68Ppi4FWUkLDzWCk7Y+j42/asIRfUgaNjn95P4mLcgE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5acb99db56d20ba6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWoXAl8VAy52ynbyPFFPq2mDmbwf/xtZ/BZlAKYT4U+rtU6+keD1XBnIhdZQGxzWg263TqfZHRzQ1Dub9bUgK0h8+KNjB0Aw7zSTqICzMPL9JAyfYngkIKjUq4Piqx1wvVnIH5C6zxw0P9L/egU24dqhAM0tJA+Ei4Q+40Eyoh5bbGjN6R1duSGsA+o6bLGxeXMFV2tSoZBsx89qXwVc0YlPQID9Z1IN8QgQ4164v0A+bxkZSgdhIVGLi/nKQzozPySF5ldD6rrGnAPndaxWebDFFJBvX/cVfNwkjcZTmeRsfeGNB4ZIbXVw0kmJh09iwS6+Bm/1LwKrtPB9gxNFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQZdIHxrazf7PWt5eoI+kPjSJSnG/uUzb+As2SKASE4=;
 b=Jwcdja1792tGYc+IpOVc5GVQfA2xc3cuTuP8VWGv6LdNHDOB2NwKBORLzB4ZPIKOCFDXyPaVrqxtGmcYqXWCs1/AVkepT1z46gy4e9HQSOL1VDkYHh4IbEo5EKEbe8onzGnNvg/WtMXHdxiPEoATNDqqXK8LjNNNzrK479h9OHBjXBEXLhsqScgZ47n9+l2wiDS3HwrhHxfmm0LZ9Ia3T5s4kLPm83r7VX7Ej5pN+dA4ggjHnU8ENwNTCIHgsf9mH9cpjnJtbSOTSyfNLAj6DJEbhCC7bgs6VUdlujEJeaG7B3ceNWSRjZ+lJbhq8EXHwYC2HuKx1AC/pl2A1swikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQZdIHxrazf7PWt5eoI+kPjSJSnG/uUzb+As2SKASE4=;
 b=oRSqQQOkhRbWxCmUf678GNBEOwVUxmjnCjczGAAwG6HKgiD+GoSaVx+iX7z/+v6vRWiLyv2xUKe3qRv1A9qOrK1o5tVOnqjRdeYHjzxhPAHhcKB7RbEL0tkQnWrWV8tN68Ppi4FWUkLDzWCk7Y+j42/asIRfUgaNjn95P4mLcgE=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/numa: address a violation of MISRA C:2012 Rule
 8.3
Thread-Topic: [XEN PATCH] xen/numa: address a violation of MISRA C:2012 Rule
 8.3
Thread-Index: AQHZ7JXAQvmPW7JUv0msOY3UtYH8n7Al3TGAgAVKmoA=
Date: Mon, 25 Sep 2023 07:18:39 +0000
Message-ID: <65F86239-6C9B-4752-ACA6-D3CC9D1F0BDC@arm.com>
References:
 <2b1c7a05a2ddd3c9f83e1a147ebf295e55ddcbe9.1695305387.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309211529550.3563@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309211529550.3563@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5972:EE_|AM7EUR03FT008:EE_|AS4PR08MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0677fe-75ac-4b88-1b1a-08dbbd97ac66
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v4RhuovWKAl7Ur6ci1RHjuzp6vv9Est7/p7kZVrGnOe0p8tLhxKqXEI/R9Nyn2hT36Sy+XrSwQUOC/NpVKphoXUFQCN4HgFOJfXpls+RvZbSSP2r3DhXNfYJrAwkj88qo8woeZsr0RwSqwuzIM1BvkgSGT8U/mph9NhKbNfY5wMrklEmSY7RXErDrLgY8fwZsKYfrcHCuu60dXx+Xm3IyXq99me7cL9iCWaFSxYqnRr/zy2mi4AOCSa86NqcIKL/VM4PlXit1ZI46KGRtCLW9NfknTDFfLWhxVvTRemJbc2/X3JstXYjzbgwUhHFbvPgPKUudjRPPL5+MeZZ4pmB+jNr/v05itqxTY4RiRTDEGV3HJ6w3YOjPtv4nvfmGcm78gmGSgt1CDPk3J3h/XkvMhGX1Q0JQZCnh19dPsLcpTMILEae7H8DstrNENcWTv/gi0mmC5tgkzui2gKHGVxd/Rf8KtF2EP+JuoM4A+878diZPn4+LakS4+DuQ1zOjSkzjLFlMQVo2qCl1YJXEIYOPshEKT7dzYSU6YEAX3Eb7Y1gU8pzgJy3rszHkNwjj1PaulzjJv21jyyGdUDbMAikkL94LXSHohssMLNttvCKOGwSXDj9TZGv4ZmSoZqnYxnnmoM9Fqlt4KnSThGc9mJHHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(54906003)(2906002)(5660300002)(316002)(41300700001)(8676002)(8936002)(36756003)(4326008)(2616005)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(86362001)(33656002)(110136005)(91956017)(558084003)(6486002)(53546011)(6512007)(6506007)(26005)(71200400001)(122000001)(38070700005)(38100700002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63F70FA2BE3D5F46A44A92BCC7837814@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2838d000-a333-4ff6-71d2-08dbbd97a44e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GxO6W921nRxBiz4kJ/aKovOr8FMn8wEnRG6Ch3IO2Xs9v2RG8ux+D6jcgfCjjpAtP5GjBxft2uZMEYNttImVp6Xl9X+b4uWP6Wf5NinYOQgewagTyuaJB+TKTszDRhCOCGXGFNCeNl+7iIEU9K4nkYTUY89CLD4w9nRmAccX8ozOlF3e42saC3Tx4wJ+Bpj8KS4h454mamHKQ4xsokYU5/ewnzk17+dutvnMYuK2omvXPRBrRGDZF4sUDL9B1mdESg0H4fKYJEUByjwHPoLQMc3IM6OzEkkdP7nHJuZ+hVCh9PvITNTIFgENqV5i4FstRjaY+FgrOtHmsny/e5EKpQ7o5qn648jLXN1TEQwRCThZT+CbN3EyVwEu0+fqSdB8SRTi4ryD/Kh68Z8SRC7EU/0qWcT7vZwuJFeoGL2TQv7JHg4AE9lqSB4QC7YsT3jqS01M3uNy+pwDOm3AbWXkMHXPjvsC1TuQmnixx8VVf0JkS1Pkj5AaCPXmE5KUggsEOcvn5RzTtDTaNnyss3OX12XpaaZ0p34SF07+X30OfmZ/EPzOEviNvd30KY1yk91LKLYOcz/xDDCrT3F0KyH/y8shrfQd92Xt9hIRmJy//RaH6JAauAeUwpsY8PzCVGnOAGpdmcw3KTR0McvtXkgjFaQYCOv88ghp9Am6XJIFGkIneIm63ccv4DIxOfquQfxoNR4D0/U9A00wS5xTxQRs7Fg5lLIYso1OH7HPh/X6Ec24F7pZhRWKViz4hAiIdNvu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(26005)(40460700003)(478600001)(2616005)(336012)(36756003)(86362001)(82740400003)(356005)(81166007)(47076005)(33656002)(36860700001)(5660300002)(6486002)(53546011)(6506007)(6512007)(40480700001)(4326008)(2906002)(8936002)(8676002)(41300700001)(316002)(54906003)(110136005)(70206006)(70586007)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:18:53.2516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0677fe-75ac-4b88-1b1a-08dbbd97ac66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8070

Hi,

> On Sep 22, 2023, at 06:30, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 21 Sep 2023, Federico Serafini wrote:
>> Make object declarations consistent. No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

