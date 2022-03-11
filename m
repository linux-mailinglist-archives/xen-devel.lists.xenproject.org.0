Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D577C4D5E49
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 10:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288872.489985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSbRn-0001hb-1W; Fri, 11 Mar 2022 09:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288872.489985; Fri, 11 Mar 2022 09:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSbRm-0001en-Tx; Fri, 11 Mar 2022 09:20:30 +0000
Received: by outflank-mailman (input) for mailman id 288872;
 Fri, 11 Mar 2022 09:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/As=TW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nSbRl-0001eh-5a
 for xen-devel@lists.xen.org; Fri, 11 Mar 2022 09:20:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba7c515-a11c-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 10:20:25 +0100 (CET)
Received: from AM5PR0502CA0008.eurprd05.prod.outlook.com
 (2603:10a6:203:91::18) by DBAPR08MB5717.eurprd08.prod.outlook.com
 (2603:10a6:10:1ae::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Fri, 11 Mar
 2022 09:20:22 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::a9) by AM5PR0502CA0008.outlook.office365.com
 (2603:10a6:203:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 09:20:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 09:20:22 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 11 Mar 2022 09:20:21 +0000
Received: from eb83f013d847.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D112B6A4-E8A0-46ED-9012-0ADD2192EAC1.1; 
 Fri, 11 Mar 2022 09:20:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb83f013d847.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 09:20:16 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 09:20:13 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa%3]) with mapi id 15.20.5061.023; Fri, 11 Mar 2022
 09:20:13 +0000
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
X-Inumbo-ID: 7ba7c515-a11c-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSdaAfTvS3Cau6k31vQz7cMYUanQWubHEURyC1QQA7c=;
 b=l3LuTdBxloa4HB90dr2x3E++75WV4w4wOXG0y121B7ht6gIcoCTiPxcLc4qi5WB7WZVfvAX2YHA0b/MitvPJA1E/VOpLqGE0yG/azjkPwkvCIQPsJQn7GVWbAVUK8+mWviz0Ozl/rqiMrqXFrHAkKciWKfKQjtEEBF6INywxuLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw/MDKH5WwQpJ0JG9isJ5C3mxDxhcjBvOaZ2DU81A/mf2lmAsKq35hOG/XBIUOS416oCGa3O0ylhhBV0OBVB4xy7MhhcoF42Kex7YbVvz+AX0o8sDcpsP8jVMqPmithcm+MzUSoAxpu9bNDnGHtgqKKd4VQxkAu4aK927QRda3EbU/Srm+pc2kgHJYWEIsLRq91G1J9EG/yWnaovckN9E3yKZ4UUCbjozNu7zFKdlWbMQSFawTz4Pn0+Jgj4gLrGj8w81sbXYuvZNE5Hj6EMom1DhJc2Psw5Um/15g+sYe7mFmg321srsVTCKM5LOBpvZC/1hmjx008BdfuszfQSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSdaAfTvS3Cau6k31vQz7cMYUanQWubHEURyC1QQA7c=;
 b=d+pO6Dgs7aMlS03ah5S2XoXHd68w74KMSTySBFNw24J+ILVcveyqQqVuYhWHjDaUHUFv+lWym8KxFycf1zoIZPp6TbPn/U3ycYSaZ//+OKtDzmZncqPV9BCmfuwjveZaGsD8iDhk2WRZ9WH8mHetTNbKedT1h5eDzhKVnx0BtjnSG8Hw2P2hMYOkXcQLLD01k+CWPnhPWNS+VslxksI0LpogzqxJ3DJZKbnIrWkeYqOP3bJsx2OER6Z4gIJlgSnmGlYfELFVeM3aRyFx78zsYtPx3M/YgHzoj2ej9lSgNj/0Q0VBjqhzo5qwUxN2Nd/khywiJCMnSaXx+0EjINfOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSdaAfTvS3Cau6k31vQz7cMYUanQWubHEURyC1QQA7c=;
 b=l3LuTdBxloa4HB90dr2x3E++75WV4w4wOXG0y121B7ht6gIcoCTiPxcLc4qi5WB7WZVfvAX2YHA0b/MitvPJA1E/VOpLqGE0yG/azjkPwkvCIQPsJQn7GVWbAVUK8+mWviz0Ozl/rqiMrqXFrHAkKciWKfKQjtEEBF6INywxuLM=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH] MAINTAINERS: Propose Henry Wang as the new release
 manager
Thread-Topic: [PATCH] MAINTAINERS: Propose Henry Wang as the new release
 manager
Thread-Index: AQHYNMhyMcIJxhFRS0ylLPd8oqvQQay556xg
Date: Fri, 11 Mar 2022 09:20:13 +0000
Message-ID:
 <PA4PR08MB62538EAA0292E1FA430B8537920C9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220310214655.14510-1-george.dunlap@citrix.com>
In-Reply-To: <20220310214655.14510-1-george.dunlap@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E80394E2F453D148817304078FFAE0B0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 062dcf70-f945-4814-7020-08da03405e5c
x-ms-traffictypediagnostic:
	AM4PR0802MB2178:EE_|VE1EUR03FT045:EE_|DBAPR08MB5717:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5717BB52BEC9793CC10D8714920C9@DBAPR08MB5717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZmLeK/bT4NGEhXPqQ6riVdKc5daPVYgfFaK9GzO4b+TgfrGxIDJxeFNCklqmbj4of2R9DWV9iodPamhsYUYXNYP06ZbnWWSkxFmrri2THnHrkTPW7kJLivKxHd22+JC2gcBUH43E4RgOiuqT0WukMaLqizpHLMca6DdWj8ag9bB8Ls96RnHviu9UUBEW1f3JMkOkpmIE2PHJXLllqOUeqd+azLqa82d7VVRr3l8e6md1FN9+TYpqW1g6K5f6R3ibhK9cpv7FQ1nhPz5tZu690y1wmANi18qw1KoX93YRvekkuCOQNIJT+Y/XNWE4B3/HTjiEPZgQXBDYrTe1uIQiwe4PsOFMqr6YWL0LbCPyX3l2vGS9B+ddr4DPBeL1yR17DcJBTtREn/IrT1BafzMMk96dJ6CkscrD1fG9A0m3E+tH75eB6Q06KASOKBgpMiJRjfLeK7OoBvXDKAsokXUWbad++y7+YLLr5c5bqBO3uNxgqHQtb4sJ0kGGdSMPbxmf0oCUKSQ3Lw5gQyazkUJZWM3WGpQL/7LIYlg2UnD3j/NZcImItCfE/tiqOXGKJueb28wIxzXslfbUw/4gzJvNdT6Q3jURnNgQ92W7j5oqWaNXcxkVws5f7IAonktTH77FuAV4HByHNfFhRXMp1vBtdYAfS5ZJp3bDQv61aVuOlH5h1Qq7BNtDTu+MiSj7VDaWQyXNQZZc441EI/B6hfex0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(52536014)(38100700002)(83380400001)(186003)(33656002)(8936002)(86362001)(4326008)(122000001)(76116006)(66946007)(54906003)(110136005)(66556008)(8676002)(66446008)(26005)(66476007)(5660300002)(71200400001)(64756008)(55016003)(9686003)(38070700005)(7696005)(53546011)(2906002)(6506007)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a28cb313-9e3a-4234-de20-08da034058fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qIrSDp2bbRPdrFzqz/P3mWQSo9LAmsEV83FUj+mQf11oERELiv7K7X57dGRZzHjzcntgOcX+K4TIt5xc9o5tZoIYF3x5lx/ncLINSYFFl8MgULPoomXArr76IEe1xUUROgDaKPFqtvuVabI4ljYiJJGJSxQqT+zPKRfr0AmYQVC+yNqzMzh+Sr0tMqt1qfmLxUX90CHla25Y+nTwdNnXn+D5ddaICz8mIwZGsQfUYvfPYCURmGFHk+kuXSI2DWwXtmuIjQD/Wgl1d1SKdvF7wLIIdkA+ad1SB9JLvC1/91hvI4tAArzlzbzU/RNkpnLsIY1EiUzSTzd/66SCz9M1oc6fviXSXc5A8XsK+/kURdg+7Jtr/ooh/+IrE5kwy6UZqDEz1mE2xljXdHLiHeWueqKvcTFfvzoSkOayBn1CxsIJHCmZVr+mbPZK7QH/CImF5yGxGzAzyIornV8Rc2Yvd3u7XNuelAvLzeYH7uO13INLmm3ZelJg9ICd8IzZEMCt9GkVO0ZBqeYfkTDf+6R0adIhag5S8SPIe0tpPkZDgj3A+L0k09MD+Elc3oPpJkXhAJz8Su+fdmj/FXcSufsp4OQffC7HrrsDQwsqVd+0gZ8zdt9iYx5oWcZ2cb0Ca71nSxnPyaHr85diGxDgBMClPvuihMKNkHN76k4qR6gXHNZAICD2Oy97/LtCxlp53BRP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(33656002)(70206006)(86362001)(316002)(54906003)(8676002)(55016003)(4326008)(70586007)(81166007)(5660300002)(6506007)(53546011)(336012)(8936002)(52536014)(356005)(82310400004)(26005)(186003)(7696005)(9686003)(2906002)(83380400001)(40460700003)(47076005)(36860700001)(110136005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 09:20:22.1174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 062dcf70-f945-4814-7020-08da03405e5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

Hi George,

> -----Original Message-----
> From: George Dunlap <george.dunlap@citrix.com>
> Sent: Friday, March 11, 2022 5:47 AM
> To: xen-devel@lists.xen.org
> Cc: George Dunlap <george.dunlap@citrix.com>; Henry Wang
> <Henry.Wang@arm.com>; Wei Liu <wl@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau
> Monne <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>=
;
> Julien Grall <julien@xen.org>
> Subject: [PATCH] MAINTAINERS: Propose Henry Wang as the new release
> manager
>
> ARM has proposed Henry Wang as a release manager for 4.17.  Signify
> this by giving him maintainership over CHANGELOG.md.
>
> Below is an introduction given by Bertrand Marquis:
>
> Henry Wang is an open-source software engineer at Arm focusing on the
> hypervisor and virtualization technology. Before joining the
> AIS-Hypervisor team, he was one of the leading Arm contributors of the
> Rust-VMM and the Cloud Hypervisor community.  He is the Arm reviewer
> of the Cloud Hypervisor project. His work includes basic project
> enabling on Arm platform, Arm device emulation, advanced features
> support on Arm and bug fixes.
>
> After joining the AIS-Hypervisor team at Arm, he has been involved in Xen
> feature
> development on Arm in various areas, including:
>
> 1. Xen Arm MPAM extension research and PoC: Ongoing, the design will
> share in xen-devel soon.
>
> 2. Port of Xen to Arm MPU systems: Working together with Penny Zheng
> on coding and testing, will be soon sent to xen-devel.
>
> 3. Static Xen heap on Arm: Work done but depend on the direct mapping
> series from Penny Zheng, will be upstreamed in the next weeks.
>
> 4. Virtio PoC for Xen on Arm using kvmtool as the Xen virtio backend:
> Work done, including the enabling of the virtio and the virtio
> performance tuning.
>
> 5. Participated in code reviews and discussions in xen-devel,
> including the foreign memory mapping series from EPAM, etc.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Thank you very much for sending this email!

Acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> CC: Henry Wang <Henry.Wang@arm.com>
>  CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monne <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d4b06f5bfb..6a097b43eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -255,6 +255,7 @@ S:        Supported
>  F:   xen/drivers/passthrough/arm/smmu-v3.c
>
>  Change Log
> +M:   Henry Wang <Henry.Wang@arm.com>
>  R:   Community Manager <community.manager@xenproject.org>
>  S:   Maintained
>  F:   CHANGELOG.md
> --
> 2.35.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

