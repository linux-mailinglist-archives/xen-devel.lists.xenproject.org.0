Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C0A615E5F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435655.689306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Sx-0008DI-7a; Wed, 02 Nov 2022 08:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435655.689306; Wed, 02 Nov 2022 08:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Sx-0008Ay-4G; Wed, 02 Nov 2022 08:51:19 +0000
Received: by outflank-mailman (input) for mailman id 435655;
 Wed, 02 Nov 2022 08:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWbu=3C=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oq9Sv-0007x0-Bi
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:51:17 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2065.outbound.protection.outlook.com [40.107.103.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83009dea-5a8b-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 09:51:16 +0100 (CET)
Received: from AM6P191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::14)
 by VI1PR08MB10274.eurprd08.prod.outlook.com (2603:10a6:800:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 08:51:12 +0000
Received: from VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ab) by AM6P191CA0037.outlook.office365.com
 (2603:10a6:209:7f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Wed, 2 Nov 2022 08:51:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT025.mail.protection.outlook.com (100.127.144.151) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 08:51:11 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 02 Nov 2022 08:51:11 +0000
Received: from a267608a2105.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3392C4CA-8120-4494-9F21-BC11913C240D.1; 
 Wed, 02 Nov 2022 08:51:01 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a267608a2105.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 08:51:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7707.eurprd08.prod.outlook.com (2603:10a6:150:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 08:50:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 08:50:58 +0000
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
X-Inumbo-ID: 83009dea-5a8b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zip11gxD7FZb1ITly/xi/OtyTlNr7/alm08iTAM30sTSadV85RSU0BDEjrwcpZEyQN1K+LKT7M94sKg/ZscY84d7BzLqCr/1UumVpfRl/HebBWbwhPqP7i/a7OsTy9bn0PdJpyrxC0gxEor5eAEtPR5eOXhMxXDLizb6TWoyZ1Na3zdPbNAak/u0gdtt6HSCGmvIqcMgzXFo84Z3A8vIFHUkSEuV8RxgoJJrvXW0GfUIKnqy45oafHeEx93n8r4Xhwm/WmsxW829AZpsOSq2eFVYOHcLm0AWcjP2lLkVV641muC7QhGgAIKgx87QNg1RawQlUd3Zx1/sysLJT6X3LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v35/mGrKtMar9Hx6IpTQx3/+KlpCVHSkPX70F4d5i8g=;
 b=nQufWMDvh37iXEXSs9WgGBfRHGVJ8s3UGGHsBQXw/ixLrr0n1IiyWwLn8NfZSWKUWimHx4G8MjsIsSCPriz1gbfNhKhBE1KgzYsI6sfPQAXn9u9FAppyBorMzQQmEI4mKQsBkfvp2p0Yjkxi18VmVxE5dYngBoT2ETzlJBYeEcaO8IfGwATeE5Yp5Rs8IUKY2Q0TgSn8uv5Y/wMDWyI4qyTDzaacZrofr1t8MLephycnfxloTirBP+qtHRH/MECn7WYBMhmWmWeaJnY5GCpkarkDZs91dgq15mQk5txfmkGdacMV9QpPewMUhMPY3X6kVZ+pyj5bcq7bWbAZ8wUAqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v35/mGrKtMar9Hx6IpTQx3/+KlpCVHSkPX70F4d5i8g=;
 b=3JI7TgDWuLLxqCX5OetXO+XY36RAAQb6kJHzw5ITUPV6w3NoP9RWXtw4zkUcM566YFeOZBZ16t6UOk2Z+XcNezbszLuMCnjT5pCzYhu01FXW0ua5zWwdbcQGDtUadXW1+SOBI1s0CCFdvcut+i6Dh6Uty02k5pGxXREgPXhgfIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 352bfb693f8e33c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krW6P3SVVFv/inosnx2QeIXLEpNYbl1+AaGPBYqos1Q/dZqld33HKEGyW/POKpBfU9weu5ob8skEQxivzbTvPLakLSqCWPR8EuWVzNqkblhjSeElm4p/AJ+gHHqd9DC3EeBNIwTCIhH/i/MIKLXDPLYyI6SPQ6XBRHK1De8eQh1FbEEZ+FAIgwWRz23Gfkuec5yVv/lbx4eElquBFIu/56ZcBlynTDESJUtmMw4RrfZrQYYMERY4t1+ailnzv3ux5tVP95LNAAlSI0i1qSrtbrRTyEzwcKjVVWYYmuEVmJI/2Qk7IIr/GWmqH4Dp/JxyZQTRePVnl62EecbPyOQhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v35/mGrKtMar9Hx6IpTQx3/+KlpCVHSkPX70F4d5i8g=;
 b=JcflzCNPeR9uBWxDtgaaQ+9IGVpU9uM6I3FWE+NoYuYEZIzQLmw9jiHGyFoqmvB4TMPt5zKc4KgLG2rVMFEjnvzZRyFhhfcSH6/I+pwlQQa1e0y5OVKt6ST2eRrhgpEHQtD2m7BwxznQrSXDfiGb8zDNeRlZHP+oy/BLWnvXKLqHzys2KS4yWc2l5RktVxpvDsqQU8yhBfnA56OKCkBOJpjDVxOhO0IKOsyr8l0lezaIs6brns+iCg2wY9Rc6ersFK7KakQ/Skf13MapGe2tDmMzZQ2lU1wjiMAJ15wr2IziSzo6bqQO585V5X7SiAhi8+1EbbRA2rPmMAdymmEsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v35/mGrKtMar9Hx6IpTQx3/+KlpCVHSkPX70F4d5i8g=;
 b=3JI7TgDWuLLxqCX5OetXO+XY36RAAQb6kJHzw5ITUPV6w3NoP9RWXtw4zkUcM566YFeOZBZ16t6UOk2Z+XcNezbszLuMCnjT5pCzYhu01FXW0ua5zWwdbcQGDtUadXW1+SOBI1s0CCFdvcut+i6Dh6Uty02k5pGxXREgPXhgfIk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Michal Orzel <Michal.Orzel@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index:
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwCAAAPNgIADNHqAgABdGACAABWOgIABD7SAgAGs8ICAABi+AIAAQbAAgADQQAA=
Date: Wed, 2 Nov 2022 08:50:58 +0000
Message-ID: <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
References: <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
 <Y2E05RLmXRIR6heO@mattapan.m5p.com>
 <947E315E-6537-48DC-8AC6-5218C12B604C@arm.com>
 <Y2GAwKsmx9f39p+Y@mattapan.m5p.com>
In-Reply-To: <Y2GAwKsmx9f39p+Y@mattapan.m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB7707:EE_|VI1EUR03FT025:EE_|VI1PR08MB10274:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fc4393-b619-4dfa-ceee-08dabcaf6494
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IJjLTn6Q6QffLaRj8YL7C2nnN2somiz4Pw0snp535zObT6TDet6W3mJ8aHsRQpFCWSpq3/XimZC/jLRmPsRq9M1cvDfx4jNDUSv/06ujHSAZMtiOQ6KTbUqdxSjNKWO/hWs/RcBCi1VPRemErplMxDbzRIpHZW/0WJm6MVzhwP+kvu7NcjQNd7zXh8uaK+PoBa90KYvRYHGOfvrUF/QnMB1xjkh4ZN8zU94Sm291tSKjD+RJ6HQO8EWYIKpZBGbmZwH1ekdzpgZtgB3ZgUHNqIh+L/AcfPdWrLQJfNTPLmRl/MsiZ1I02oDd/cQ0pwIv4e3dnsbzRssRw1UvzhZpGB7taKiglGpvUC5AhNzarUQtyIIt/tSbj7Ft0Oud1sI1FKe/PCflDdQFoXYrArZxxymh2Jh2p7lhKRjB07pZy8dLPw3QbjaIPhP2JL33iZYSGv4qHNxnxLPIHCJyw6q6D0muil7jqKweioAlvUfLXRQD7wVIvRphMI/w4DcfdPuRixL4vaCv7a+WpKmY9/czE2IjoGJcEHMeyxqgl/DlN3y80tIGxd98PVE0cGRjMWM5A24mTWGO9ZYttuO4zV9ZR/t3XECb1eaK5FvASSXY0LmN0pTMJsuZnYeZM+ZcLfz+vtV6JRYnStAnK+p+v/AXsUIW6hlMtkJsM9CuJl0ttlRGD4l/L11E+srmPmxlZuQyyBp24QSXu6Smi8mIk4cbxkNpKGOR63P+JaMs0mKo2K/zl8Z/m3vW63/6G10Xn+decVhaauhClS8epgpnjXlmJWs+R56BOwl4Nyk/AIR9Gf4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(2906002)(66899015)(36756003)(5660300002)(7416002)(83380400001)(186003)(66446008)(64756008)(41300700001)(66556008)(8936002)(66476007)(33656002)(8676002)(91956017)(38070700005)(76116006)(54906003)(478600001)(4326008)(316002)(2616005)(86362001)(66946007)(6486002)(6506007)(71200400001)(122000001)(6512007)(38100700002)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EA595A88DBA3934D930A5518F1A86DBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f6e2309-46e9-4977-a520-08dabcaf5c83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YTgZmq6fCkjONZJZ+md1yR2tSx7R4lhFxhmE7kL1KLryADYfzMj0pC1cjGE2iD2ZfiE1VxO2NF4uCCzWltztmug1cXHrmPvMRTDqmGACgzh8K/WRzpLmIpQcSuQLyu5P9z1XR31zQiiYhN5GfQ5HzgjPS6eEHPFcEYrg2I3CYBqWeRy9Oax+sbh/WyRwEfqFWgzg+sk43o/zf9NGf0BRtun2OrScISWAHUwrxSrY+qqU7/uYxGL/2hXMwkUZYkyQobi9vUqoL3hovLahphWnYFfDlODXQaCGeBkdgBOJ+IZFJSJyAVQ2ctM4mSYWxzojMFGi9SPBlZtkR3hEWg0IXi8CZ2vlr/826/KiaYjOFueAHPBYQAzcPwoQNNwk0WVv2mfaDMvI3no5T2ZRkBdo36bocirDK0jyuHEym3pZnECMibo9h5X0dnGnymNvpVBhts4FCVPR3KGeFUGDTkMnkNgjzuRE2luLZS2h64n5nvgFPcAFWrVV/uEe8SmYRyCVmgBwbsdr64bRu4Oaj3lBKxXpFJGki2GSCIlq8Et8sHRfT7lApG+AVj3ZpQKxbCEZP5G14KnHHEd++qdILK7CFramrmGbpxlOoqDIyPvJ6D++TLQLf4/rfnh1eOScC6CM643iu/YqVWRQ18e9kVmkSNFmyL4mwe4mBYwdw1Keua9kpb/WaR59aJ4LkpNzulE9TaQ2ntqSVsgxyD1wfTqvwLKaOxhkLBQ+YYE91c3aIAohq8wD2trqI8mBKF1n9ZdO0zW8RqWQUFqNZ00tDJASzg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(336012)(47076005)(66899015)(86362001)(40480700001)(6486002)(33656002)(2906002)(107886003)(82740400003)(356005)(81166007)(40460700003)(8676002)(36860700001)(6512007)(53546011)(26005)(6506007)(186003)(2616005)(36756003)(82310400005)(6862004)(70586007)(8936002)(4326008)(54906003)(316002)(41300700001)(70206006)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 08:51:11.8025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fc4393-b619-4dfa-ceee-08dabcaf6494
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10274

Hi Elliott,

> On 1 Nov 2022, at 20:25, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> On Tue, Nov 01, 2022 at 04:30:31PM +0000, Bertrand Marquis wrote:
>>=20
>>> On 1 Nov 2022, at 15:01, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>>>=20
>>> On Mon, Oct 31, 2022 at 01:26:44PM +0000, Bertrand Marquis wrote:
>>>>=20
>>>>> On 30 Oct 2022, at 21:14, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>>>=20
>>>>> Ideally this would be something quick that can be easily invoked as t=
he
>>>>> first step of an external third-party build process.
>>>>=20
>>>> I think that we are making this problem a lot to complex and I am not =
sure
>>>> that all this complexity is required.
>>>=20
>>> Speaking of complexity.  Is it just me or does a vIOMMU had an odd sort
>>> of similarity with a Grant Table?
>>>=20
>>> Both are about allowing foreign entities access to portions of the
>>> current domain's memory.  Just in the case of a Grant Table the entity
>>> happens to be another domain, whereas for a vIOMMU it is a hardware
>>> device.
>>>=20
>>> Perhaps some functionality could be shared between the two?  Perhaps
>>> this is something for the designer of the next version of IOMMU to thin=
k
>>> about?  (or perhaps I'm off the deep end and bringing in a silly idea)
>>=20
>> I am not quite sure what you mean here.
>>=20
>> The IOMMU is something not Xen specific. Linux is using it to restrict t=
he area
>> of memory accessible to a device using its DMA engine. Here we just try =
to give
>> the same possibility when running on top Xen in a transparent way so tha=
t the
>> Linux (or an other guest) can continue to do the same even if it is runn=
ing on
>> top of Xen.
>> In practice, the guest is not telling us what it does, we just get the p=
ointer to the
>> first level of page table and we write it in the hardware which is doing=
 the rest.
>> We need to have a vIOMMU because we need to make sure the guest is only
>> doing this for devices assigned to him and that it is not modifying the =
second
>> level of page tables which is used by Xen to make sure that only the mem=
ory
>> from the guest is accessible using the DMA engine.=20
>>=20
>> So I am not exactly seeing the common part with grant tables here.
>=20
> With Grant Tables, one domain is allocating pages and then allowing
> another domain to read and potentially write to them.  What is being
> given to Xen is the tuple of page address and other domain.

With the IOMMU we do not get to that information, we only get the first lev=
el of
page table pointer and the hardware is doing the rest, protecting the acces=
s
using the second level of page tables handled by Xen.

>=20
> With the model presently being discussed you would have a vIOMMU for each
> other domain.  The the pages access is being granted to are the pages
> being entered into the vIOMMU page table.

Which Xen does not check.

>=20
> Allocate a domain Id to each IOMMU domain and this very much seems quite
> similar to Xen's grant tables.  I'm unsure the two can be unified, but
> they appear to have many common aspects.

From an high level point of view it might but from the guest point of view =
the
IOMMU is something used with or without Xen where grant tables are very
specific to Xen. I do not see anything that could be unified there.

Maybe I am missing something here that other could see though :-)

Cheers
Bertrand


