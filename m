Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FE60E369
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 16:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430624.682535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhU9-0001Cl-By; Wed, 26 Oct 2022 14:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430624.682535; Wed, 26 Oct 2022 14:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhU9-00019G-7l; Wed, 26 Oct 2022 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 430624;
 Wed, 26 Oct 2022 14:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+8N7=23=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1onhU7-000199-3C
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 14:34:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4708148f-553b-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 16:34:20 +0200 (CEST)
Received: from AS9PR06CA0151.eurprd06.prod.outlook.com (2603:10a6:20b:45c::8)
 by DB8PR08MB5531.eurprd08.prod.outlook.com (2603:10a6:10:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 14:34:17 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::6) by AS9PR06CA0151.outlook.office365.com
 (2603:10a6:20b:45c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 14:34:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Wed, 26 Oct 2022 14:34:17 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Wed, 26 Oct 2022 14:34:16 +0000
Received: from 8e4140fca469.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0793471A-D847-41E0-9F94-6E019753A093.1; 
 Wed, 26 Oct 2022 14:34:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e4140fca469.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 14:34:06 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS4PR08MB7455.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 14:33:57 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572%4]) with mapi id 15.20.5709.015; Wed, 26 Oct 2022
 14:33:56 +0000
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
X-Inumbo-ID: 4708148f-553b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hQ4FwAMKgdwZIE2jL+Zjk+8MnoUStrB0C4wdwYt0au8Wl3U0b6rX05XotzdHQyU7zGT3G2UajdBJ/gv0qOIaBnAFmekj/9thWDgweqxr64WRDzEKHihEwpaKwBVq477wLu2RPUDytVfQk/1rlC7tZd+8w0D7aCmV7N2ZYgFFwPTbeKGBMDVwthbVtjwvj0jAi1zW94SDs5FRZzJw/12IRlqYnVzimpG0wjbj6hcOF4Sp0epaYa5X/KDn5L5URXdDWv5BGVL6ovQ4QPX8xu8JzU5Qyblv6C6KH+asRuaqqmrs4C7HXePSz6rigYYqC3o1Ei6mL/K4ETsaBsVBEkJ4gA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyC1lwX16FyUJf7K1KSdYHzBhBszsmJLjcTx4sBobV8=;
 b=H0dRx3HQTuL1WrGUnhWBQpCffbTSV0nsX2Sh5ozX5QOSFiyS8RON/OT1pk5bEV1Wec4tgGp2yAmfwKClx1EFcWI9MYmR9b0IFmN1QZydZxkQEs5SZ6rB4ppqGKHbtyS0gwS2A5cVfffjo0qgx+ykmeBaentD4MAp2lBCnO1ahbRXGIsf9/kyQwG3U/zUZI0LGWRhHKs3z45KRSrnWbtKEiPTnJLs9J+MKaxBpge7s2ecWFyOZqhYZgZWa/owv3lLI8oxM1pTHxFtZ3deEgJ+SKQoW99X3nW726O+3aSYJAPnfWNknqZb5p11WzLNbUg9JwgYk75t3TX7yf9My2FGOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyC1lwX16FyUJf7K1KSdYHzBhBszsmJLjcTx4sBobV8=;
 b=PQeLc5RCQiJmk9vlTz5cZzN27RtC4O8MD0SdoCqbOgx+ulJYTbYR4srbvs/kQbSz1Baboa4B4tawZOEZqGC96LGanIem4Z6CM9vEwEaYcHoKDTC6kWoSCyMTsTACE2J18W1R3L77VImTyMyL9SbCc3eEPeQ2OgcNFjEZCt1aPm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0f2a8b3d4bc4047
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0BAW+6+VSFoHm5tgNk2nAJ5kY8NccJfFhP9cI92v8K21q2lj9Sj9wr/VhshfP7KjKOda6yltofVjLtYLizE+rFJQ+zuylI021MuAHA1yHId44BnyUX1wif9vNrlQl1tZja6EJppSzl/9P7E44ssXw8CFM3vkGN0I82dvln74wBQW1y0IO7ffwp/FNzAj7MP62EZjQtvkgZwl47pxrmKUsyRm21U/0baQpR9oXYashJSozGEyMFdEZto9utw23lvDvRnyXlnSqYD/3tEtujJv2OmCHJAONrzr19sfM94yzoIBa7gI6H1j46eZXU24BOj2uAf/nX9dtsNBIPfyZ68bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyC1lwX16FyUJf7K1KSdYHzBhBszsmJLjcTx4sBobV8=;
 b=AV07Wq9fYyIXxji8R9DGmojAzHckT2H+zGtZRVmh/v/rJeqKYynZPcWumfi+epB5Mp/L4HlxBXmyoS/VCUDDVV6bam9gOJTys8fU8a11vcJY/GF6gYre0c9oRzu+LGmKV9xF+LjeFj1dCAonzWt8Rkgxm6qkWCmgNVA3QUyQDJ+yd+zSeApH2z1F+9ZKaaYDXsnjhj72e5RHX92iJdlef6Jca3l6U2pWLgkYR3oMOCPjR0WoXgFDYIZuTmR3U0iYonFo+bPWhfhAK6awsRjAsgVKMxlt2b2sE6AfdHSMFfd6VnFpnUdPDd7vvIycfE71YdVG5HtrD8grhhZqsDkXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyC1lwX16FyUJf7K1KSdYHzBhBszsmJLjcTx4sBobV8=;
 b=PQeLc5RCQiJmk9vlTz5cZzN27RtC4O8MD0SdoCqbOgx+ulJYTbYR4srbvs/kQbSz1Baboa4B4tawZOEZqGC96LGanIem4Z6CM9vEwEaYcHoKDTC6kWoSCyMTsTACE2J18W1R3L77VImTyMyL9SbCc3eEPeQ2OgcNFjEZCt1aPm8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@arm.com>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index: AQHY6T1VjOHHQJGN7kyXeL6pAIKNMa4grXIAgAAQBQA=
Date: Wed, 26 Oct 2022 14:33:56 +0000
Message-ID: <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
In-Reply-To: <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS4PR08MB7455:EE_|AM7EUR03FT064:EE_|DB8PR08MB5531:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e11b51-4137-4fd6-2298-08dab75f297a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GPucFJhtTcEGFIsjNXiLtSRwIJiBwNkk1kniPPOZpUx/2Cq3tOr1coSiRxOWlLnXFFMFb/XNtdrnhNx3V6iyE9bi+QZ+vGR8DUXQOpgrGlThYVqmco44XtAZEtHCgfSCCzEaW4eIgtUa2qxQy7dV4EarPAs/3kdRo1tNkLCp0gHW28bkrV9g1o8t5tZi697j3jCMExAga1mXMNyXRT6Ksp1T0DpjaOcBb4WRod28KueO5NCcqsQrRUZC2Pgql10iqrLoB1Tbbf8vijWiHKYU0CIjtEmPVA/jMSI9DDlcwnIb4wI/0ZLscdFlaxHxMrm1eoBU0PdmvBfWoztA2VxfulbGSVP+y9duDbrJdHGEmD42QpPnTPc7RJW1OTJXatqNMiw6bPtzatpyytv/TdCsxzeBsv4nMA6Y0rU8KKhynFdqXz7XcN01cdDzzEIgof1oTTzCtO0dCRuI/AC758Y86ZvtWHfD1Prc7O2w7Q5phALkaOY2ZrOiuDPDQvGtm12VkEqFTwxg0LFgz0HHBssNUvW4o+GDi/FyKSDVDozP8MngBINu+gdtneaROcvkZkPlfJ+cI/cVfElmFnRhDxGunIMXU1Ey9J4cE3HCpFVqDzi3DIAcC3OXXtv/eEIUNyayhDigTZZY6QSDVKZNq9tkj7Gg++0Z8OYhvkn3U3Q3g8958kxavdaJjxRZ0ts/6gK+NuokuEvpNpvo1RoA38SyKmk/vavuEBeQeyfPK9tjVG21CGkMfoJr5B6Na46Y/jJFF9o1RjM80p+pRomEMuJ69mg3nSxCng09VmiWXSmXNbs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(186003)(38070700005)(2616005)(83380400001)(2906002)(54906003)(71200400001)(6506007)(8676002)(33656002)(6916009)(6486002)(53546011)(478600001)(64756008)(26005)(316002)(66946007)(66446008)(66556008)(6512007)(66476007)(86362001)(36756003)(76116006)(4326008)(91956017)(5660300002)(7416002)(8936002)(122000001)(38100700002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <56D7E5D0FA73F94897E8BFB007433505@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7455
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8221fe9-42e3-4219-0e7f-08dab75f1cfb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3XxMeIPNtfHt/QGSzfTpid89PL7GHSMzaKBwhL35akzxuQQ9QHdwWi0wW85YHOQZo6Zd3NTcdX53HE2d/zgOdCZd76lUUtuoWRzTacaQPGwIKZXMjQDDgmMBQ6KinpGDXX5ZWj2xR+vJLG/4U616J2TGgYM5myvIS72fbO/cLQ1W1YwoJQwPs/gXn4Z+hY3yg84LVYNpTlyYuOIVCE4WTlOqs/YNFmlUCXkjZFDV9m85Lb5fBUhF63Ie67dmHtQLqt+yluobFZASubx3CfD40hYs9s1bmCaKl8NU//TWQvQAjI2N7Zfcqr4NCIKqG4lnwcZ+QFUICGA8pbblRmRa3TmKMuPR9kxi3R9IzzyQv231hfp6xrs/gC+Kp9WlvrauyRb25aXLVdlUJ4aFfxifZcOgVS3QiMBmEk3fQ1oEZu5rVDE088Z+8hO6P9xpClF22aoZHfq2NZFdZh0L5SyYjnY+VC+CchnBX0JzthaGvW6mGgerXx/L8cy+nkbUUzCLCyxm4JJeWIB1M5YJiuyfaZm/LAgVLCIIJiIKJj8AX2+v+KW9HE707eRWZJx+RqC7wOCf1pyE2HNvrrKqkpqC2MHmSJ/0qyecY/Xqc4rcg6iTyO9c/CLsTT+sBLwMkhJO941hiG0sX+4cl5c4KF033uEI9sOs9N9LYDU/zQZg86hsJOVmjB3cRiZenlH4jwIM92OY5gsPEOAPCP1u+A2HyErFevluGcLWHFCO1snttfM0WuubaAc0/1q5c8gqrEsLGTZab2GHzaz95vthLIQ1/A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(83380400001)(6486002)(478600001)(53546011)(54906003)(70586007)(36756003)(8676002)(4326008)(6512007)(26005)(6862004)(41300700001)(8936002)(5660300002)(47076005)(33656002)(40480700001)(82310400005)(107886003)(186003)(2906002)(70206006)(36860700001)(6506007)(40460700003)(356005)(336012)(2616005)(82740400003)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 14:34:17.1367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e11b51-4137-4fd6-2298-08dab75f297a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5531

SGkgSnVsaWVuLA0KDQo+IE9uIDI2IE9jdCAyMDIyLCBhdCAyOjM2IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjYvMTAvMjAyMiAxNDox
NywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBBbGwsDQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+
PiBBdCBBcm0sIHdlIHN0YXJ0ZWQgdG8gaW1wbGVtZW50IHRoZSBQT0MgdG8gc3VwcG9ydCAyIGxl
dmVscyBvZiBwYWdlIHRhYmxlcy9uZXN0ZWQgdHJhbnNsYXRpb24gaW4gU01NVXYzLg0KPj4gVG8g
c3VwcG9ydCBuZXN0ZWQgdHJhbnNsYXRpb24gZm9yIGd1ZXN0IE9TIFhlbiBuZWVkcyB0byBleHBv
c2UgdGhlIHZpcnR1YWwgSU9NTVUuIElmIHdlIHBhc3N0aHJvdWdoIHRoZQ0KPj4gZGV2aWNlIHRv
IHRoZSBndWVzdCB0aGF0IGlzIGJlaGluZCBhbiBJT01NVSBhbmQgdmlydHVhbCBJT01NVSBpcyBl
bmFibGVkIGZvciB0aGUgZ3Vlc3QgdGhlcmUgaXMgYSBuZWVkIHRvDQo+PiBhZGQgSU9NTVUgYmlu
ZGluZyBmb3IgdGhlIGRldmljZSBpbiB0aGUgcGFzc3Rocm91Z2ggbm9kZSBhcyBwZXIgWzFdLiBU
aGlzIGVtYWlsIGlzIHRvIGdldCBhbiBhZ3JlZW1lbnQgb24NCj4+IGhvdyB0byBhZGQgdGhlIElP
TU1VIGJpbmRpbmcgZm9yIGd1ZXN0IE9TLg0KPj4gQmVmb3JlIEkgd2lsbCBleHBsYWluIGhvdyB0
byBhZGQgdGhlIElPTU1VIGJpbmRpbmcgbGV0IG1lIGdpdmUgYSBicmllZiBvdmVydmlldyBvZiBo
b3cgd2Ugd2lsbCBhZGQgc3VwcG9ydCBmb3IgdmlydHVhbA0KPj4gSU9NTVUgb24gQXJtLiBJbiBv
cmRlciB0byBpbXBsZW1lbnQgdmlydHVhbCBJT01NVSBYZW4gbmVlZCBTTU1VdjMgTmVzdGVkIHRy
YW5zbGF0aW9uIHN1cHBvcnQuIFNNTVV2MyBoYXJkd2FyZQ0KPj4gc3VwcG9ydHMgdHdvIHN0YWdl
cyBvZiB0cmFuc2xhdGlvbi4gRWFjaCBzdGFnZSBvZiB0cmFuc2xhdGlvbiBjYW4gYmUgaW5kZXBl
bmRlbnRseSBlbmFibGVkLiBBbiBpbmNvbWluZyBhZGRyZXNzIGlzIGxvZ2ljYWxseQ0KPj4gdHJh
bnNsYXRlZCBmcm9tIFZBIHRvIElQQSBpbiBzdGFnZSAxLCB0aGVuIHRoZSBJUEEgaXMgaW5wdXQg
dG8gc3RhZ2UgMiB3aGljaCB0cmFuc2xhdGVzIHRoZSBJUEEgdG8gdGhlIG91dHB1dCBQQS4gU3Rh
Z2UgMSBpcw0KPj4gaW50ZW5kZWQgdG8gYmUgdXNlZCBieSBhIHNvZnR3YXJlIGVudGl0eSggR3Vl
c3QgT1MpIHRvIHByb3ZpZGUgaXNvbGF0aW9uIG9yIHRyYW5zbGF0aW9uIHRvIGJ1ZmZlcnMgd2l0
aGluIHRoZSBlbnRpdHksIGZvciBleGFtcGxlLA0KPj4gRE1BIGlzb2xhdGlvbiB3aXRoaW4gYW4g
T1MuIFN0YWdlIDIgaXMgaW50ZW5kZWQgdG8gYmUgYXZhaWxhYmxlIGluIHN5c3RlbXMgc3VwcG9y
dGluZyB0aGUgVmlydHVhbGl6YXRpb24gRXh0ZW5zaW9ucyBhbmQgaXMNCj4+IGludGVuZGVkIHRv
IHZpcnR1YWxpemUgZGV2aWNlIERNQSB0byBndWVzdCBWTSBhZGRyZXNzIHNwYWNlcy4gV2hlbiBi
b3RoIHN0YWdlIDEgYW5kIHN0YWdlIDIgYXJlIGVuYWJsZWQsIHRoZSB0cmFuc2xhdGlvbg0KPj4g
Y29uZmlndXJhdGlvbiBpcyBjYWxsZWQgbmVzdGluZy4NCj4+IFN0YWdlIDEgdHJhbnNsYXRpb24g
c3VwcG9ydCBpcyByZXF1aXJlZCB0byBwcm92aWRlIGlzb2xhdGlvbiBiZXR3ZWVuIGRpZmZlcmVu
dCBkZXZpY2VzIHdpdGhpbiB0aGUgZ3Vlc3QgT1MuIFhFTiBhbHJlYWR5IHN1cHBvcnRzDQo+PiBT
dGFnZSAyIHRyYW5zbGF0aW9uIGJ1dCB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBTdGFnZSAxIHRy
YW5zbGF0aW9uIGZvciBndWVzdHMuIFdlIHdpbGwgYWRkIHN1cHBvcnQgZm9yIGd1ZXN0cyB0byBj
b25maWd1cmUNCj4+IHRoZSBTdGFnZSAxIHRyYW5zaXRpb24gdmlhIHZpcnR1YWwgSU9NTVUuIFhF
TiB3aWxsIGVtdWxhdGUgdGhlIFNNTVUgaGFyZHdhcmUgYW5kIGV4cG9zZXMgdGhlIHZpcnR1YWwg
U01NVSB0byB0aGUgZ3Vlc3QuDQo+PiBHdWVzdCBjYW4gdXNlIHRoZSBuYXRpdmUgU01NVSBkcml2
ZXIgdG8gY29uZmlndXJlIHRoZSBzdGFnZSAxIHRyYW5zbGF0aW9uLiBXaGVuIHRoZSBndWVzdCBj
b25maWd1cmVzIHRoZSBTTU1VIGZvciBTdGFnZSAxLA0KPj4gWEVOIHdpbGwgdHJhcCB0aGUgYWNj
ZXNzIGFuZCBjb25maWd1cmUgdGhlIGhhcmR3YXJlIGFjY29yZGluZ2x5Lg0KPj4gTm93IGJhY2sg
dG8gdGhlIHF1ZXN0aW9uIG9mIGhvdyB3ZSBjYW4gYWRkIHRoZSBJT01NVSBiaW5kaW5nIGJldHdl
ZW4gdGhlIHZpcnR1YWwgSU9NTVUgYW5kIHRoZSBtYXN0ZXIgZGV2aWNlcyBzbyB0aGF0DQo+PiBn
dWVzdHMgY2FuIGNvbmZpZ3VyZSB0aGUgSU9NTVUgY29ycmVjdGx5LiBUaGUgc29sdXRpb24gdGhh
dCBJIGFtIHN1Z2dlc3RpbmcgaXMgYXMgYmVsb3c6DQo+PiBGb3IgZG9tMCwgd2hpbGUgaGFuZGxp
bmcgdGhlIERUIG5vZGUoaGFuZGxlX25vZGUoKSkgWGVuIHdpbGwgcmVwbGFjZSB0aGUgcGhhbmRs
ZSBpbiB0aGUgImlvbW11cyIgcHJvcGVydHkgd2l0aCB0aGUgdmlydHVhbA0KPj4gSU9NTVUgbm9k
ZSBwaGFuZGxlLg0KPiBCZWxvdywgeW91IHNhaWQgdGhhdCBlYWNoIElPTU1VcyBtYXkgaGF2ZSBh
IGRpZmZlcmVudCBJRCBzcGFjZS4gU28gc2hvdWxkbid0IHdlIGV4cG9zZSBvbmUgdklPTU1VIHBl
ciBwSU9NTVU/IElmIG5vdCwgaG93IGRvIHlvdSBleHBlY3QgdGhlIHVzZXIgdG8gc3BlY2lmeSB0
aGUgbWFwcGluZz8NCg0KWWVzIHlvdSBhcmUgcmlnaHQgd2UgbmVlZCB0byBjcmVhdGUgb25lIHZJ
T01NVSBwZXIgcElPTU1VIGZvciBkb20wLiBUaGlzIGFsc28gaGVscHMgaW4gdGhlIEFDUEkgY2Fz
ZQ0Kd2hlcmUgd2UgZG9u4oCZdCBuZWVkIHRvIG1vZGlmeSB0aGUgdGFibGVzIHRvIGRlbGV0ZSB0
aGUgcElPTU1VIGVudHJpZXMgYW5kIGNyZWF0ZSBvbmUgdklPTU1VLg0KSW4gdGhpcyBjYXNlLCBu
byBuZWVkIHRvIHJlcGxhY2UgdGhlIHBoYW5kbGUgYXMgWGVuIGNyZWF0ZSB0aGUgdklPTU1VIHdp
dGggdGhlIHNhbWUgcElPTU1VDQpwaGFuZGxlIGFuZCBzYW1lIGJhc2UgYWRkcmVzcy4NCg0KRm9y
IGRvbVUgZ3Vlc3RzIG9uZSB2SU9NTVUgcGVyIGd1ZXN0IHdpbGwgYmUgY3JlYXRlZC4NCg0KPiAN
Cj4+IEZvciBkb21VIGd1ZXN0cywgd2hlbiBwYXNzdGhyb3VnaCB0aGUgZGV2aWNlIHRvIHRoZSBn
dWVzdCBhcyBwZXIgWzJdLCAgYWRkIHRoZSBiZWxvdyBwcm9wZXJ0eSBpbiB0aGUgcGFydGlhbCBk
ZXZpY2UgdHJlZQ0KPj4gbm9kZSB0aGF0IGlzIHJlcXVpcmVkIHRvIGRlc2NyaWJlIHRoZSBnZW5l
cmljIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIElPTU1VcyBhbmQgdGhlaXIgbWFzdGVyKHMpDQo+
PiAiaW9tbXVzID0gPCAmbWFnaWNfcGhhbmRsZSAweHZNYXN0ZXJJRD4NCj4+IAnigKIgbWFnaWNf
cGhhbmRsZSB3aWxsIGJlIHRoZSBwaGFuZGxlICggdklPTU1VIHBoYW5kbGUgaW4geGwpICB0aGF0
IHdpbGwgYmUgZG9jdW1lbnRlZCBzbyB0aGF0IHRoZSB1c2VyIGNhbiBzZXQgdGhhdCBpbiBwYXJ0
aWFsIERUIG5vZGUgKDB4ZmRlYSkuDQo+IA0KPiBEb2VzIHRoaXMgbWVhbiBvbmx5IG9uZSBJT01N
VSB3aWxsIGJlIHN1cHBvcnRlZCBpbiB0aGUgZ3Vlc3Q/DQoNClllcy4NCg0KPiANCj4+IAnigKIg
dk1hc3RlcklEIHdpbGwgYmUgdGhlIHZpcnR1YWwgbWFzdGVyIElEIHRoYXQgdGhlIHVzZXIgd2ls
bCBwcm92aWRlLg0KPj4gVGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgd2lsbCBsb29rIGxpa2UgdGhp
czoNCj4+IC9kdHMtdjEvOw0KPj4gIC8gew0KPj4gICAgIC8qICMqY2VsbHMgYXJlIGhlcmUgdG8g
a2VlcCBEVEMgaGFwcHkgKi8NCj4+ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+ICAgICAj
c2l6ZS1jZWxscyA9IDwyPjsNCj4+ICAgICAgIGFsaWFzZXMgew0KPj4gICAgICAgICBuZXQgPSAm
bWFjMDsNCj4+ICAgICB9Ow0KPj4gICAgICAgcGFzc3Rocm91Z2ggew0KPj4gICAgICAgICBjb21w
YXRpYmxlID0gInNpbXBsZS1idXMiOw0KPj4gICAgICAgICByYW5nZXM7DQo+PiAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4+ICAg
ICAgICAgbWFjMDogZXRoZXJuZXRAMTAwMDAwMDAgew0KPj4gICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJjYWx4ZWRhLGhiLXhnbWFjIjsNCj4+ICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTAwMDAw
MDAgMCAweDEwMDA+Ow0KPj4gICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwwIDgwIDQgIDAgODEg
NCAgMCA4MiA0PjsNCj4+ICAgICAgICAgICAgaW9tbXVzID0gPDB4ZmRlYSAweDAxPjsNCj4+ICAg
ICAgICAgfTsNCj4+ICAgICB9Ow0KPj4gfTsNCj4+ICBJbiB4bC5jZmcgd2UgbmVlZCB0byBkZWZp
bmUgYSBuZXcgb3B0aW9uIHRvIGluZm9ybSBYZW4gYWJvdXQgdk1hc3RlcklkIHRvIHBNYXN0ZXJJ
ZCBtYXBwaW5nIGFuZCB0byB3aGljaCBJT01NVSBkZXZpY2UgdGhpcw0KPj4gdGhlIG1hc3RlciBk
ZXZpY2UgaXMgY29ubmVjdGVkIHNvIHRoYXQgWGVuIGNhbiBjb25maWd1cmUgdGhlIHJpZ2h0IElP
TU1VLiBUaGlzIGlzIHJlcXVpcmVkIGlmIHRoZSBzeXN0ZW0gaGFzIGRldmljZXMgdGhhdCBoYXZl
DQo+PiB0aGUgc2FtZSBtYXN0ZXIgSUQgYnV0IGJlaGluZCBhIGRpZmZlcmVudCBJT01NVS4NCj4g
DQo+IEluIHhsLmNmZywgd2UgYWxyZWFkeSBwYXNzIHRoZSBkZXZpY2UtdHJlZSBub2RlIHBhdGgg
dG8gcGFzc3Rocm91Z2guIFNvIFhlbiBzaG91bGQgYWxyZWFkeSBoYXZlIGFsbCB0aGUgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIElPTU1VIGFuZCBNYXN0ZXItSUQuIFNvIGl0IGRvZXNuJ3Qgc2VlbSBu
ZWNlc3NhcnkgZm9yIERldmljZS1UcmVlLg0KPiANCj4gRm9yIEFDUEksIEkgd291bGQgaGF2ZSBl
eHBlY3RlZCB0aGUgaW5mb3JtYXRpb24gdG8gYmUgZm91bmQgaW4gdGhlIElPUkVRLg0KPiANCj4g
U28gY2FuIHlvdSBhZGQgbW9yZSBjb250ZXh0IHdoeSB0aGlzIGlzIG5lY2Vzc2FyeSBmb3IgZXZl
cnlvbmU/DQoNCldlIGhhdmUgaW5mb3JtYXRpb24gZm9yIElPTU1VIGFuZCBNYXN0ZXItSUQgYnV0
IHdlIGRvbuKAmXQgaGF2ZSBpbmZvcm1hdGlvbiBmb3IgbGlua2luZyB2TWFzdGVyLUlEIHRvIHBN
YXN0ZXItSUQuDQpUaGUgZGV2aWNlIHRyZWUgbm9kZSB3aWxsIGJlIHVzZWQgdG8gYXNzaWduIHRo
ZSBkZXZpY2UgdG8gdGhlIGd1ZXN0IGFuZCBjb25maWd1cmUgdGhlIFN0YWdlLTIgdHJhbnNsYXRp
b24uIEd1ZXN0IHdpbGwgdXNlIHRoZQ0Kdk1hc3Rlci1JRCB0byBjb25maWd1cmUgdGhlIHZJT01N
VSBkdXJpbmcgYm9vdC4gWGVuIG5lZWRzIGluZm9ybWF0aW9uIHRvIGxpbmsgdk1hc3Rlci1JRCB0
byBwTWFzdGVyLUlEIHRvIGNvbmZpZ3VyZQ0KdGhlIGNvcnJlc3BvbmRpbmcgcElPTU1VLiBBcyBJ
IG1lbnRpb24gd2UgbmVlZCB2TWFzdGVyLUlEIGluIGNhc2UgYSBzeXN0ZW0gY291bGQgaGF2ZSAy
IGlkZW50aWNhbCBNYXN0ZXItSUQgYnV0DQplYWNoIG9uZSBjb25uZWN0ZWQgdG8gYSBkaWZmZXJl
bnQgU01NVSBhbmQgYXNzaWduZWQgdG8gdGhlIGd1ZXN0Lg0KDQo+IA0KPj4gIGlvbW11X2Rldmlk
X21hcCA9IFsg4oCcUE1BU1RFUl9JRFtAVk1BU1RFUl9JRF0sSU9NTVVfQkFTRV9BRERSRVNT4oCd
ICwg4oCcUE1BU1RFUl9JRFtAVk1BU1RFUl9JRF0sSU9NTVVfQkFTRV9BRERSRVNT4oCdXQ0KPj4g
CeKAoiBQTUFTVEVSX0lEIGlzIHRoZSBwaHlzaWNhbCBtYXN0ZXIgSUQgb2YgdGhlIGRldmljZSBm
cm9tIHRoZSBwaHlzaWNhbCBEVC4NCj4+IAnigKIgVk1BU1RFUl9JRCBpcyB0aGUgdmlydHVhbCBt
YXN0ZXIgSWQgdGhhdCB0aGUgdXNlciB3aWxsIGNvbmZpZ3VyZSBpbiB0aGUgcGFydGlhbCBkZXZp
Y2UgdHJlZS4NCj4+IAnigKIgSU9NTVVfQkFTRV9BRERSRVNTIGlzIHRoZSBiYXNlIGFkZHJlc3Mg
b2YgdGhlIHBoeXNpY2FsIElPTU1VIGRldmljZSB0byB3aGljaCB0aGlzIGRldmljZSBpcyBjb25u
ZWN0ZWQuDQo+IA0KPiBCZWxvdyB5b3UgZ2l2ZSBhbiBleGFtcGxlIGZvciBQbGF0Zm9ybSBkZXZp
Y2UuIEhvdyB3b3VsZCB0aGF0IGZpdCBpbiB0aGUgY29udGV4dCBvZiBQQ0kgcGFzc3Rocm91Z2g/
DQoNCkluIFBDSSBwYXNzdGhyb3VnaCBjYXNlLCB4bCB3aWxsIGNyZWF0ZSB0aGUgImlvbW11LW1h
cCIgcHJvcGVydHkgaW4gdnBjaSBob3N0IGJyaWRnZSBub2RlIHdpdGggcGhhbmRsZSB0byB2SU9N
TVUgbm9kZS4NCnZTTU1VdjMgbm9kZSB3aWxsIGJlIGNyZWF0ZWQgaW4geGwuDQoNCj4gDQo+PiAg
RXhhbXBsZTogTGV0J3Mgc2F5IHRoZSB1c2VyIHdhbnRzIHRvIGFzc2lnbiB0aGUgYmVsb3cgcGh5
c2ljYWwgZGV2aWNlIGluIERUIHRvIHRoZSBndWVzdC4NCj4+ICBpb21tdUA0ZjAwMDAwMCB7DQo+
PiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sc21tdS12MyI7DQo+PiAgICAgICAg
ICAgICAgCWludGVycnVwdHMgPSA8MHgwMCAweGU0IDB4ZjA0PjsNCj4+ICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDE+Ow0KPj4gICAgICAgICAgICAgICAgICNpb21tdS1j
ZWxscyA9IDwweDAxPjsNCj4+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiY29t
YmluZWQiOw0KPj4gICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwIDB4NGYwMDAwMDAgMHgwMCAw
eDQwMDAwPjsNCj4+ICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4ZmRlYj47DQo+PiAgICAg
ICAgICAgICAgICAgbmFtZSA9ICJpb21tdSI7DQo+PiB9Ow0KPiANCj4gU28gSSBndWVzcyB0aGlz
IG5vZGUgd2lsbCBiZSB3cml0dGVuIGJ5IFhlbi4gSG93IHdpbGwgeW91IHRoZSBjYXNlIHdoZXJl
IHRoZXJlIGFyZSBleHRyYSBwcm9wZXJ0eSB0byBhZGRlZCAoZS5nLiBkbWEtY29oZXJlbnQpPw0K
DQpJbiB0aGlzIGV4YW1wbGUgdGhpcyBpcyBwaHlzaWNhbCBJT01NVSBub2RlLiB2SU9NTVUgbm9k
ZSB3aWwgYmUgY3JlYXRlZCBieSB4bCBkdXJpbmcgZ3Vlc3QgY3JlYXRpb24uDQo+IA0KPj4gIHRl
c3RAMTAwMDAwMDAgew0KPj4gCWNvbXBhdGlibGUgPSAidmlvbW11LXRlc3TigJ07DQo+PiAJaW9t
bXVzID0gPDB4ZmRlYiAweDEwPjsNCj4gDQo+IEkgYW0gYSBiaXQgY29uZnVzZWQuIEhlcmUgeW91
IHVzZSAweGZkZWIgZm9yIHRoZSBwaGFuZGxlIGJ1dCBiZWxvdy4uLg0KDQpIZXJlIDB4ZmRlYiBp
cyB0aGUgcGh5c2ljYWwgSU9NTVUgbm9kZSBwaGFuZGxlLi4uDQo+IA0KPj4gCWludGVycnVwdHMg
PSA8MHgwMCAweGZmIDB4MDQ+Ow0KPj4gCXJlZyA9IDwweDAwIDB4MTAwMDAwMDAgMHgwMCAweDEw
MDA+Ow0KPj4gCW5hbWUgPSAidmlvbW11LXRlc3QiOw0KPj4gfTsNCj4+ICBUaGUgcGFydGlhbCBE
ZXZpY2UgdHJlZSBub2RlIHdpbGwgYmUgbGlrZSB0aGlzOg0KPj4gIC8gew0KPj4gICAgIC8qICMq
Y2VsbHMgYXJlIGhlcmUgdG8ga2VlcCBEVEMgaGFwcHkgKi8NCj4+ICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwyPjsNCj4+ICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4+ICAgICAgIHBhc3N0aHJvdWdo
IHsNCj4+ICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4+ICAgICAgICAgcmFu
Z2VzOw0KPj4gICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+ICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8Mj47DQo+PiAJdGVzdEAxMDAwMDAwMCB7DQo+PiAgICAgICAgICAgICAJY29tcGF0
aWJsZSA9ICJ2aW9tbXUtdGVzdCI7DQo+PiAgICAgICAgICAgICAJcmVnID0gPDAgMHgxMDAwMDAw
MCAwIDB4MTAwMD47DQo+PiAgICAgICAgICAgICAJaW50ZXJydXB0cyA9IDwwIDgwIDQgIDAgODEg
NCAgMCA4MiA0PjsNCj4+ICAgICAgICAgICAgIAlpb21tdXMgPSA8MHhmZGVhIDB4MDE+Ow0KPiAN
Cj4gLi4uIHlvdSB1c2UgMHhmZGVhLiBEb2VzIHRoaXMgbWVhbiAneGwnIHdpbGwgcmV3cml0ZSB0
aGUgcGhhbmRsZT8NCg0KYnV0IGhlcmUgdXNlciBoYXMgdG8gc2V0IHRoZSDigJxpb21tdXPigJ0g
cHJvcGVydHkgd2l0aCBtYWdpYyBwaGFubGUgYXMgZXhwbGFpbmVkIGVhcmxpZXIuIDB4ZmRlYSBp
cyBtYWdpYyBwaGFuZGxlLiANCiANClJlZ2FyZHMsDQpSYWh1bA==

