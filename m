Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF87AD14A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607642.945905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkft5-0004Iu-Ab; Mon, 25 Sep 2023 07:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607642.945905; Mon, 25 Sep 2023 07:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkft5-0004Fw-6i; Mon, 25 Sep 2023 07:20:11 +0000
Received: by outflank-mailman (input) for mailman id 607642;
 Mon, 25 Sep 2023 07:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkft3-0004Fi-1l
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:20:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35856e8-5b73-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 09:20:06 +0200 (CEST)
Received: from AM6P194CA0037.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::14)
 by AM8PR08MB5572.eurprd08.prod.outlook.com (2603:10a6:20b:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:19:36 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::a6) by AM6P194CA0037.outlook.office365.com
 (2603:10a6:209:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:19:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.18 via Frontend Transport; Mon, 25 Sep 2023 07:19:36 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Mon, 25 Sep 2023 07:19:36 +0000
Received: from e4cc6f1ed806.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 171EDF0C-5E5F-4F17-93E2-671B208928EB.1; 
 Mon, 25 Sep 2023 07:19:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4cc6f1ed806.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:19:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:19:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:19:26 +0000
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
X-Inumbo-ID: f35856e8-5b73-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CeZlE49HFDDQu2jidkldbpjFdhu5s8QpoVM4/hTDOQ=;
 b=bBVgd6CFnfgk1qHniEs0w6Ol+uFJ564PBjUYkH8yMwW1NVsKCv4SB/XwfaXaJmiHk3dIn09bypg0KbarDNnZympRjwCuq8dSZCIpHBsiF8moCBh7mTyRHInCd6nMhdLIiZPcNSC0JhHZG5AA6nf57Nz56HjwgIJ2XC6L1yVVQ2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36a292b4d102817e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUMfI3tzKU2tfS4vYk7MEaCot42GF1STJfRaku1Qq8tK4scNZEIpe5e+7m+ZFtT0oa9DTNTux47jnr74obJ5Z5l5Cn0MAxYZF2yNebkBRrVMawMytnhq2UcUHoWUAPkKwSzy4PiO/DIr99lEIO17mK/ZMRi6zGa1PeIOdzwBoOYZayNMzGxgkLWQnLx1Y97hPp4a32NfnSozD+CXy0f5HjP1bct+QyaG397pI60PgFuDnXs89wimH7BhtzAQAPzh1+5/cglGx3XEmtTNEF677JDMyrybUPsgGLdS79+usPVCHYfZUM+Rj56IfFGNlhBqiayCkELKQkPL4tsGMwcJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CeZlE49HFDDQu2jidkldbpjFdhu5s8QpoVM4/hTDOQ=;
 b=bIm+rOPdnaMLO7E4fDcnsDzr4vMVMxhk84vHdlbohVf/bs/Po9K84Q9C54gSrAUL3mmMHdkk4c1mo7bVLgXivNAjOEmW1XXHeZHWtD/ynuNN9bjzrxncnF7sSWQmGha/ouz1kM2Qs3L4Drqbi/lpRf5RnoCeM2JOQrO8pgz5D4HcfeeJ2bzG3K/4J2SzG+D1NunCEMlEUtn8zVZxMXszrjraDJPc+qnar9xF2kweWzPzB3KuEDMzhxFh+PRfN/Su83vG7HAeZayFhPwxOV+egjg2s1KjPjU8S2qK8s56Y46E8vfSRfPYrv6uIg+zV7jGxn9+psOQzdQ18UtbGGSSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CeZlE49HFDDQu2jidkldbpjFdhu5s8QpoVM4/hTDOQ=;
 b=bBVgd6CFnfgk1qHniEs0w6Ol+uFJ564PBjUYkH8yMwW1NVsKCv4SB/XwfaXaJmiHk3dIn09bypg0KbarDNnZympRjwCuq8dSZCIpHBsiF8moCBh7mTyRHInCd6nMhdLIiZPcNSC0JhHZG5AA6nf57Nz56HjwgIJ2XC6L1yVVQ2U=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Thread-Topic: [XEN PATCH v3] xen/hypercalls: address violations of MISRA
 C:2012 Rule 8.3
Thread-Index: AQHZ7ITbJMQ5KGQVDky/tIiL15HF1rAl3l8AgAVJxgA=
Date: Mon, 25 Sep 2023 07:19:26 +0000
Message-ID: <659974FA-A50D-4C8C-8267-1406C54CE407@arm.com>
References:
 <2c3e9469b3e59c7c4d0128320515f2b3df2b4c1c.1695297383.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309211533510.3563@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309211533510.3563@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8833:EE_|AM7EUR03FT009:EE_|AM8PR08MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: eb271532-49bf-4115-339f-08dbbd97c609
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MPAOm48ez6++nKzIqHgn0fHW4UnM9ywtXc9wOtpwiJcbS/JZ5wCn47J20LVlxXPHVr7ASwi8ealktWT6UIKFvyuGUfIYe28yRTXnNwR1cCCSuyWVeeF82Txn05Vo+EZqi8KRm8eTdHee4V8uOkDQrzSUe+L7Fo8hJVoc4932xJxGtfg5rF8hTk4NeLfGNnUPdGEDeiGH/VVRjw+T1p6JiEUpupe6lilkyIgMsiLbqnto+zZXju2G2YneX+pC5+CWLrPYtEqE+wqstGPfpFi/lL0QHxT7ANXOxSuK42lkVn5ZFTLruyF/5pQFLyd6RR4Ql7zJVRZl0tGGXzbZLGU3r2/nISdpOYsQXn1RxFtWTfmmUtzc9kovQUwP1yA18elGSoOj0chptY91qbicEaPENBQICsdaaPGnLL7Sa+b7mZZsnRXhTaYXiKV80tIWUj2RA61AWpV3CL/pjbAlktTdf65rx+gSmO5B1PPu3CLnpRII028j6Fpc2I8t5yV19qhyFL8wyHjoxLrEkDNdV7hF4ciS4JHDBry6jpNioAEH3PcTs9nE3dLUfm+ZqgCBAjiKpq7A4VGt1uhSNKTvS8hZ8Upia6t6Gqj2k0Z1hYBGxGbOQ888s07qsJ1BajFjDEiEVRc3GQH4UuN0xXuucFPDqg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(4744005)(5660300002)(110136005)(66946007)(66476007)(66446008)(64756008)(66556008)(54906003)(91956017)(76116006)(478600001)(71200400001)(6512007)(53546011)(2616005)(26005)(6486002)(6506007)(8936002)(8676002)(4326008)(316002)(41300700001)(122000001)(86362001)(38070700005)(36756003)(38100700002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7050FF7AB4AA54080887E5EB8991F48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0737d98d-513b-4405-5eb3-08dbbd97c04d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vIFDWQUcKnGITxZM0jTmctnt+8tQFWeg1ANIZt2RZqrd+EZ5RsYkQNMlWBkloLHo+fRQNGmPot5XaXUOKCI6grkB6GeCdQ9X5VJvwRxA5oj8XGIcb3f8P9TNI0wUIMf9ajL0x/DPdpSAqZgRQDX6Z3M2PpKElopkasJktDJWGYqinzwpdZOGdVvN0N4zNoOm4vuoPFlnn2Y5kX35/1Zue9edQFDoJrNp/cQw2ZllHFr24dh/2cfvSAGkMLnMSo5/aDUI+4i+x7qDFnAb5kw/bVcO7IGRPQPy8F4EefgLppJfQaFIlI3dXaUUrNsboCxkDE644+jPNEzPM85GFPqTojZ3UG5Fi6XpdRBlPHxoL97ZI/cvsZukXL3YkAuzN3tE25ufptkJDE2UGPRFBkZxl2/YsCtCMPi3oolj5jyQ3zzzpQL9VIJ4VTFyCFRjHbwLj39T82ppscW2CNnj+e5DxqVDt51skS4cUdtozDyhz1keTmA1Q46m0jmWnugy17DW02v4I/oHSC4auxHxfNJ72qhzXNO/uTqyUp0Pjwz1CzwX69HerGzX5+iv8ZudyReT8ywv/0VY/hnn27TtOpVskXkKAWUQQ7w9/WiuFOisWEswCVRskLtPcJa9DNSLQ0pmBnn44VQ5rBLOYlquXDk2yev9JAR92PpcvpUw1dDcQOiBqYYoDhN6eSKTA4QEcQ7F2qNB86QwUot58QJ8homiIOEFwbGPdxnmr71zUUHOFqdkb5xILCTrbPRSg4yzbwxT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(36840700001)(40470700004)(46966006)(478600001)(6512007)(53546011)(41300700001)(81166007)(40480700001)(356005)(316002)(26005)(336012)(2616005)(5660300002)(70206006)(70586007)(6506007)(6486002)(110136005)(54906003)(8676002)(8936002)(4326008)(47076005)(36860700001)(2906002)(40460700003)(4744005)(86362001)(33656002)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:19:36.2791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb271532-49bf-4115-339f-08dbbd97c609
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5572

Hi,

> On Sep 22, 2023, at 06:33, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 21 Sep 2023, Federico Serafini wrote:
>> Make function declarations and definitions consistent.
>> No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


