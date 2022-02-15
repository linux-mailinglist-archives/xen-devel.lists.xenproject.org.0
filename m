Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5154B742F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 18:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273485.468687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1yN-0002NB-JB; Tue, 15 Feb 2022 17:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273485.468687; Tue, 15 Feb 2022 17:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1yN-0002K0-Fj; Tue, 15 Feb 2022 17:50:43 +0000
Received: by outflank-mailman (input) for mailman id 273485;
 Tue, 15 Feb 2022 17:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nK1yM-0002Jp-4w
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 17:50:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca43770f-8e87-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 18:50:41 +0100 (CET)
Received: from FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::6) by
 AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.18; Tue, 15 Feb 2022 17:50:37 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::9b) by FR3P281CA0019.outlook.office365.com
 (2603:10a6:d10:1c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8 via Frontend
 Transport; Tue, 15 Feb 2022 17:50:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 17:50:36 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 15 Feb 2022 17:50:36 +0000
Received: from c1ec6550b558.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1833A4B7-99C9-4052-B4EA-2E194DF0913C.1; 
 Tue, 15 Feb 2022 17:50:26 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1ec6550b558.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 17:50:26 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB7PR08MB3467.eurprd08.prod.outlook.com
 (2603:10a6:10:48::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 15 Feb
 2022 17:50:24 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 17:50:24 +0000
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
X-Inumbo-ID: ca43770f-8e87-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne5DhximP25m0nxT5RWvd303HKEY0pT0i+RqLpcnIDI=;
 b=PRev5fxpRtVey7WNlyQKTO5CWDNBd5O1AJWuM326TQJnYtgtcMUprMxTMl/YFfaaG7XX0XVHSVrHimLXlBk6hlYQsbd7Oyw7Viwz02QUvzXxM82/Z8lkeadi1vcNGUfShXrzXoUH+UTRHyWDfh73eJ6LewXm6pOspZvlTKpCXys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e0798f6cc577667
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVDrF5EXt2pgxqAGqEisaSuYKXDFfzZDQ1whDjdOg8foBacx07cpDhoADrZqDIzkno6r0gD31g7hQobVwPtlBYn1wQzJ4KMcf/gkNFK+wSQwlzPTmZ+LebA5gVEnhXl73GmPncGXsRND3uY199UCoy5qw/GsvclLwPxf9Ym821ezmcxHHTcr+7sEpVQoq6P788V9q8VMEpRjsJR7VVeqz5PbnfCgESRDQhXgBMDZxrbBddUnGasqLgn6XbKFCZtV789dxUZhngWlMV9f7ARNkBWvSYZQgUXcqagZRJOblNVqqX5/lUoXvpdbOR6rl52hiKkTn4FNB5KlyngUtfKUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne5DhximP25m0nxT5RWvd303HKEY0pT0i+RqLpcnIDI=;
 b=UoMMe7+FoGe5KmqZhZiWa6UB/oljI8bVhqTglKAOhIsNL/Kp9iQ4ldBxttcWNBrEacOrGMfAPele0THyCsBlsgmOv6ANXIP6WpYOXrUtrsZdgn9J2K1QKL3M54P+EOrHyTRJcVoZF6o5QzDuUtv6JAG51qdqpTVBNexw456ykmrM3aT0PHmZFRET7xJAQE5lCiOjaoBABwEq/5wvSj7pIcZyQfDMtnFgvlDrAT59Gkh++z2Uv/OXxfrhfnE6LyffX0JJAUKDcWc0F1Mmh/TgenYt5LkGD/EBWpJ3y7traJf2dD+NiH+6yEacvkxwxlP/EmezdkffqTizLKSTFjbIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne5DhximP25m0nxT5RWvd303HKEY0pT0i+RqLpcnIDI=;
 b=PRev5fxpRtVey7WNlyQKTO5CWDNBd5O1AJWuM326TQJnYtgtcMUprMxTMl/YFfaaG7XX0XVHSVrHimLXlBk6hlYQsbd7Oyw7Viwz02QUvzXxM82/Z8lkeadi1vcNGUfShXrzXoUH+UTRHyWDfh73eJ6LewXm6pOspZvlTKpCXys=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/5] xen/sched: create public function for cpupools
 creation
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <50ad5e74-c8b6-bdb3-2a9b-fa118610d07d@suse.com>
Date: Tue, 15 Feb 2022 17:50:19 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: 7bit
Message-Id: <3E27F91F-F97A-443D-BBA8-8400FA3FF377@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-3-luca.fancellu@arm.com>
 <50ad5e74-c8b6-bdb3-2a9b-fa118610d07d@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::8) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f3db0eff-fe64-4e51-f584-08d9f0abac3d
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3467:EE_|VE1EUR03FT021:EE_|AM6PR08MB3224:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3224700B8EE683E60FEB6672E4349@AM6PR08MB3224.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LN/9GwGF3wnXkA8zyeck7iRNFDCea7Iif9RLCOEO6ObzfTy2UTqaauxbYD2XWYPbPeF8j4O4WHuIQCwd63Zshr1izekWi0fOGBZmLOxJlgoNwnsZatNydLSbTIH7b2KQjvg/2DPNrL1rWt8vbQVSNT7l4VbDllf6VI5nEp1c3+SDxHQRJBAVN8PynIYfkmi8vsXVlSkLJzw+HaBItkXoyOWMK+eJhbsjTxrNIufbACPJOHbcbwo5WmcMXf1V0nv14DS1+sC83X0e4nh8VZaH6lBsJ1pIJwxATFEJYoaGL5QGJNFslHEYzZHfG7fjWxC3QYI89MvQPkkWp/KApj7EpIljyqYPvVw5aJ45z43aKHUT/CcQg+8U37EORkC38BMeTMQ0vw7nyE03Fzy6PSBUqFySwSqsUTo2KGncRD2yhJFDiOm1rwcys+V79yr2PGxmbDKdMxHoCNk9BLqkXXwSacGto/qGRJJfzc+E+1o85jRVC6KVDlEer+267Q/IwcmEeZbvo5lVEhhpspy+xOxt0j/iObU0B9rOus+KsHkc2D5YovCkGnTyS5mAyDIK4oXZzVOzGsf+w72pQolM5XY2rt+EYiIRc/ANdFAbwzO70+BhN0+vYmLut8uAQWpas/nPd1YCqDCXaadXjwC9lD1REifBGNnAgN940W92rYMHcROtHcx2ztKh/nzifF3arkIUWD8mYGbLPBcXF3dzODlvVamDuzAQRIPIoVPHPYj0Ri8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6512007)(6506007)(6666004)(38100700002)(38350700002)(52116002)(53546011)(66476007)(66556008)(66946007)(2906002)(2616005)(26005)(8936002)(4326008)(36756003)(4744005)(5660300002)(44832011)(8676002)(54906003)(508600001)(33656002)(6916009)(316002)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3467
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09ddcd74-d37a-4f77-0fe8-08d9f0aba490
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	djMZONIg4VQj4GvxAYnUxgt9Z2UzCxtr8UmivazmzDgkdIGf3jyn0CRwMFjHDwN2Lu9oDeghAUcBnvIMOoAg3ggg1UvkPE4q+3Qwk96nlWqo1U1yJTEBW0H67pIZNOrh+gRT8k5VuCmGcVxRfl4P9hbxrTKfzXWEc95Y1fta2vQLz5vri6MLXBWO8+lgm7f/dUoKApfEk8GaDw/ajXr/gljTBNHFbUlkf+AQQQ/IZrC6O3pmvpx1DYx8yKdsdxRbfHlOFNm1/UtN/au8g3LBXq6Kg/CuKLOgYsmSoOxPIfW6VWwkaHD8iVVf0F0OE/QYe9FzFaxZIC/P+4hhZgor+/NtP5l4VfDC2ydzL7ZbJUXW7z4275Rh2jlQXhwl4TQ+qAQbLajaKlbhC5O3MXkpI8/7Ycsglo76DbdHE+YCJDQBopWzykJPP7aN6BZmZ1THAiL0fUci9jfnM/3gg9Dl+5e20nWplk4utx7xIGgwTNkO/AC8MsOVhbwyBGlXA0jSwI3DlufXTtuauu4WUHKUzqfvCQQBgUWDpmnZNV/j6aB8WS9O1NB49FxIVi4ToU5SLDqn71IMx5t+BrByPO7P3YocEYWdYOMpLP0eUrXsob1wKB/qFETCEfbQUCiGn07wTEh8yO+Odzita33ZYtKMtY2G2TfHfcMsJv0QdUIZWYncN8YJ2kOkt7ZbeHgKauLv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(53546011)(36756003)(508600001)(6512007)(6506007)(6486002)(54906003)(33656002)(36860700001)(40460700003)(316002)(6666004)(47076005)(86362001)(4744005)(82310400004)(8936002)(81166007)(70206006)(70586007)(5660300002)(356005)(8676002)(186003)(26005)(4326008)(2616005)(336012)(2906002)(6862004)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:50:36.8378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3db0eff-fe64-4e51-f584-08d9f0abac3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224



> On 15 Feb 2022, at 10:38, Juergen Gross <jgross@suse.com> wrote:
> 
> On 15.02.22 11:15, Luca Fancellu wrote:
>> Create new public function to create cpupools, it checks for pool id
>> uniqueness before creating the pool and can take a scheduler id or
>> a negative value that means the default Xen scheduler will be used.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> with one further question: you are allowing to use another scheduler,
> but what if someone wants to set non-standard scheduling parameters
> (e.g. another time slice)?

I guess for now parameters can be tuned only by xl tool, however it would
be possible as future work to allow parameters in the device tree for each
scheduler.

Cheers,
Luca

> 
> 
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


