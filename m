Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D035592A7D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 09:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387095.623203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUzH-00076Q-2B; Mon, 15 Aug 2022 07:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387095.623203; Mon, 15 Aug 2022 07:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUzG-00073a-VQ; Mon, 15 Aug 2022 07:58:14 +0000
Received: by outflank-mailman (input) for mailman id 387095;
 Mon, 15 Aug 2022 07:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNUzE-00073U-V7
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 07:58:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 012bc3b2-1c70-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 09:58:10 +0200 (CEST)
Received: from AS8PR04CA0188.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::13)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 07:58:06 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::a7) by AS8PR04CA0188.outlook.office365.com
 (2603:10a6:20b:2f3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 07:58:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 07:58:06 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 15 Aug 2022 07:58:05 +0000
Received: from 9b9e5abda966.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 45D93230-73DD-4CA3-9799-006CE1CC95F2.1; 
 Mon, 15 Aug 2022 07:57:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b9e5abda966.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 07:57:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM6PR08MB4261.eurprd08.prod.outlook.com (2603:10a6:20b:b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 07:57:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 07:57:50 +0000
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
X-Inumbo-ID: 012bc3b2-1c70-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UlSWyVD47mVCzZblIVNjthJ4X+ljISsLP5S94PCngT/VeLiV5XgeVqngvBwBzgT0Ddw1/CVKkbiLz/r/VBUH55XRQd0biqL/3ZNFAu6sc/mCs0beP18ElHauVEZIvGCT2XMRDThEjmdi+jmEEO5Eq4QEUEQc5XhyicdCwzH9TL96MATcnhycya3YFeyiQ7mnnIzwyvgp/YdIQCRUw6GTKZJp3GzpX/CXz4Bhgj/kgWKMmBv4r31bwYeB/P4FmG47ZGJxIcTVnwZr/hrS060pxtKY5AMJHr7Tx0PCKPdsVMe+lBDT4yC1nHLjWXWoTKB2dBWBcDQDz9ktVrIbkOvMrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx1N7EjdDeStwby0lB6Sa0l55ZqXSJSlYSmXhhqX6bY=;
 b=RkHg4+lCjSSUIqUxyKS+tdeiCk28cVdaOfAScqudh1EwoVjYgJb4LtOv3J8X+6TdP2CWVW1YX0ckFmpzh/RIAclD5R7hvFClLwaKKf5mlfaf4GYXOgG+nosHmqmr0TsFRPvDuRoSM3iBFD/Yt45u/omGLroryvnB0hFTaEEYHCtwUliHyGlQh4HDUtJdFVmtpUDG2AMgM9ljflOlMKaIKgR8B08oXBLPGUwrH9CFN2iDgg4SO01fdM0DReKfyLrNFw6CfSxkRFc4+g9ujPQxG9nTswxceO3++1pzx/qsybw+rxHAfkO90pU4iNrJhJWmZ3gmXNaJzU7a3hID9y+wdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx1N7EjdDeStwby0lB6Sa0l55ZqXSJSlYSmXhhqX6bY=;
 b=3KHYfR60v9nSTIJ1zPIzc+kT/sNozgsUhsnXyPI6un5aWTINFSP4tzCEvQS4rzuiDgm1U2fihIGsrv/WOspaLQ23nj6Yrp4JSdPLCwHx0O6807vT6cYPL6rlP+y5AkoHXFCPifUIuOgsMXhTwh6qy8pISH15ufwu709eGlC4EO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nv9OIM3JwGJnCXhetuDJRPYCCSQjrBJ/iQP93V8IL9/jd2+T4DdlsC0eKqxH0gcyhNXm29ZyWQGSki7zZ18KglByaDn+NI+JJLijgvYSbV11gUipgHe4STs2HswGM6EaucH2A8uNruvXLxjWpcJa/MuZpW7t7MGeFW7K59RFv2WHLFDVUfdPDdM0NjRrhRZzhiDJ+U1VQg88jiX9BTGI1GmQd7vzPg7FcNOQhGHi6LkmhdpQWoj8XGDYzC5DIYv05xOqZxrQHFaWTeJ+mkHfpD9nYCuEhlTA1vHx6PU4PynmHlEZihbu5GhsSvY3lXx2YA9HutivsIwOsUafYyP9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx1N7EjdDeStwby0lB6Sa0l55ZqXSJSlYSmXhhqX6bY=;
 b=Er8YDCw95+DrbutT0zixMudrsh7wM0x7e/zd3FEBb/e9VD2fwp9ZvQjpGJAaj7dLBWpNJTEAHI2MBtTD2si3mR2Ond5bHgT+hii+mdZIgjAD9Zwn+Sjoxt9l1SGHbyYLSZBQ84zOSanoyDPgDNJ01v7oI5X5gt8Hh8lXB6UpWvEUTwQoirONK7GoyxQxpXP0t77WdL0k0K94nC0ttCoU8kA2pkAI7/L8pRm6bKebmxua42WicXmX/fxUpPqltWURBLlzjhi307fhpxCGtff4ht9s7RfcXNGPTEV8idsSw/Cjq34SV87wPh7Mfa7w0kdNkBNXexK8C8GDXsLZiLrfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx1N7EjdDeStwby0lB6Sa0l55ZqXSJSlYSmXhhqX6bY=;
 b=3KHYfR60v9nSTIJ1zPIzc+kT/sNozgsUhsnXyPI6un5aWTINFSP4tzCEvQS4rzuiDgm1U2fihIGsrv/WOspaLQ23nj6Yrp4JSdPLCwHx0O6807vT6cYPL6rlP+y5AkoHXFCPifUIuOgsMXhTwh6qy8pISH15ufwu709eGlC4EO0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Xen 4.17: Current status of series floating in ML
Thread-Topic: Xen 4.17: Current status of series floating in ML
Thread-Index: AdiwaSAsLXrq8BcIQ6OGhWLWfPbjFwAEQ+EAAAAn0bA=
Date: Mon, 15 Aug 2022 07:57:50 +0000
Message-ID:
 <AS8PR08MB7991D6E142809FE9AD6FE00D92689@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <47b125f4-ce4a-7b2c-dbd5-2297f1e21581@suse.com>
In-Reply-To: <47b125f4-ce4a-7b2c-dbd5-2297f1e21581@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E8F00788EEA8FA4294E9B9EAAC3B6168.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aca0c27d-5899-4efe-efc8-08da7e93e317
x-ms-traffictypediagnostic:
	AM6PR08MB4261:EE_|AM7EUR03FT051:EE_|AM6PR08MB3863:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XTe4FKqwKkT2mwOgsS3ffKgJJWqfUTcCKD+GaKL5KvVpeYHnT4aCkhE2rMUvAArNdkJHxQ8zv2YsrUX1ro79NbCfwK/Dp15qmYeMBJ0VPp/XOhrENUffz/CXOx3dLe7o+ZH6VilzmlalhCNjKXRuKjHd+m3vF6ry+KOWIu5J+PwWpvvFAmBDVIiTkeY2waSA4kcnIeg7j4/4FCtxA3oM8XU9IFFsk/Ng1/kbOyXckbebOSQ5UvNdVKYdqttryZJQcupcvFnyLbdEZfdxMSFuFHQgGdNJ8J0yU88NzkN9kcOyZ9pGWbDMCgYcbQoc5MQ3A+rHnJV0W3UivqHeUei53DieaasP7+HX10BAZX92yZqxX+AfF+aWq6EYQuS5HURBWbtfM7awskZ9fhVPK7e6J+Sx2YuPh+D2WPiDhRi7Zu8y72xiZrR7+vSmuQcto7vNWX8K6SGBhV7fCongLyoVc/k+Ix3T6hlTVTaQ7V2DhD3t4nwLwx0RXWr3PHcMCD7RYZkxeHqtwt8J5bzlE4EQyKVabfBvXDwR5c0lRDtlXgawyBarSfcYb5o+fLXpBibmHe0SSfqnJvF9BX34lQOABjwfw53MWWNauLnzjlxEUft1D6s/KefxtV3+Gg770wXOEI3I8TBY6cOWSEXjCC7eA+d9244NxXfIAEy40OqpEZTwXtXSDIyGOvagO7z2fPhhgNGgGd2bgzP6XnCsBg7dg5CbxzPjpeCRcysZ1I74XwS3XX2gzrzcWqAc1+3jlQN5g2JEbClYOvhFP/7QVo626SsLAmU98HyehDOn9BS/Tba6aOyWNLkq04LyO5fFkmaLveyCBkBwcVajv5UvyZqzpBjI7Xa7XatTjoz5gSVi6xwxfYsMF5PiXdVvYy8ikExM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(478600001)(6506007)(7696005)(53546011)(38070700005)(33656002)(86362001)(9686003)(26005)(186003)(71200400001)(966005)(41300700001)(83380400001)(5660300002)(55016003)(66476007)(64756008)(4326008)(66556008)(66446008)(76116006)(8676002)(54906003)(316002)(6916009)(66946007)(38100700002)(122000001)(8936002)(7416002)(52536014)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4261
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68b6f697-8b35-42c4-d74f-08da7e93d9e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HcKs2IXpxzzn5I4cPbfA8tTnJ5fj8iO4K8NiUUgqAlWMCS3By4QLqMM+CTs0g2jcm6DBtsa6XGJIyoJEvHNe4Pjd3se0A7zN6e1sFGxPbLKSdcwpkO3APU9qNhIWjG5gLJ5ugRpHhHM22zIAr7EehvMFmbVlwrKO62kqxIAMMkInWjy/lknC1FpYGt1SRKb/TgpUUdlWctJED1qbmPzBUKvxYtzINlyb56qBMOasF5qlK9yCi7UIG2lJoG33sKlxCNxPVF2Uhf31Bi77QxPp6ytdnJ8maf+f5Oe29f4gLewTK88gVLyqgRYmTVWMIAWEXBea9TzXi0IHt+vRWA0rImHgwHH93Kg8Wpl032hagfZB9TyardWXUCUjbCJobgEfb4iSgH9oi2vKuU2VKAUAPrYo8/k2/GiXX3WiuDjzNG51M9/7cQGB/YmCw5QTca0UxJH6VP/6Mcg5RKctA4LsFrScy+QXbHqNSnf6QymYoXaxS/+u+Ko0xOxhYUcABY3RpdvZ1BCTcuB92OAV+Tvw3wpfRWjIVfg0KKSiEgl4PSHSDg+/1WvK5VwgfaINAVFOK1ZLAcJPBT5GC2yGH9lM3VMAAXY+y64nY+JOwdUWENzhe7wuxn4fIz22Fgvm75yWK5WX+NGH6ZidX+FM5oeH+lbGBNqRRknWcJERlKsbKFzSXq11+Chc1dgdOJ13wimcKpE4PokIwz2f3rYWH7MMpGylDn0eIxCfHk0ICQgoi0NyMOS1DuF36o5nvjrrErxT1Ybo2AMFeDvBuFMUVUCP4xXIKXdHHyVwJDpk8MHooflnr0VPJ9UEMW8JIiBRgXnwJ6e/hji6evDWBaP6Em+wV0EpYuiBWCwBHoIj1mBIFl9N2BYW/5lkY+NWnMq6w5B+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(336012)(36860700001)(40480700001)(83380400001)(55016003)(81166007)(356005)(86362001)(40460700003)(33656002)(82740400003)(82310400005)(70206006)(8936002)(316002)(70586007)(478600001)(4326008)(8676002)(54906003)(966005)(26005)(53546011)(9686003)(6506007)(7696005)(2906002)(186003)(41300700001)(47076005)(5660300002)(52536014)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:58:06.1166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca0c27d-5899-4efe-efc8-08da7e93e317
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863

SGkgSmFuLA0KDQpUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2UgYW5kIGRldGFpbGVkIHJldmlldyBv
ZiB0aGUgbGlzdC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBYZW4gNC4xNzogQ3Vy
cmVudCBzdGF0dXMgb2Ygc2VyaWVzIGZsb2F0aW5nIGluIE1MDQo+IA0KPiBPbiAxNS4wOC4yMDIy
IDA3OjQ2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IDExLiB2cGNpOiBmaXJzdCBzZXJpZXMgaW4g
cHJlcGFyYXRpb24gZm9yIHZwY2kgb24gQVJNDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9zZXJpZXM9NjYwODI4DQo+ID4gU3RhdHVzOiBQ
YXRjaCAjMSBuZWVkcyBhY3Rpb25zIGZyb20gYXV0aG9yLiBQYXRjaCAjMiAjMyBuZWVkIHJldmll
dy4NCj4gDQo+IEl0J3MgbW9yZSB0aGFuIGp1c3QgcmV2aWV3LiBJJ3ZlIGV4cHJlc3NlZCBlbHNl
d2hlcmUgdGhhdCBJJ20gbm90DQo+IGNvbnZpbmNlZCBvZiB0aGUgYXBwcm9hY2ggYXMgYSB3aG9s
ZSwgY29tcGxpY2F0aW5nIHRoaW5ncyBmdXJ0aGVyLg0KPiBBIHJlLXdvcmsgdG93YXJkcyB1c2lu
ZyByZWYtY291bnRpbmcgb24gdGhlIGRldmljZXMgbGlrZWx5IGNhbid0IGJlDQo+IHZpZXdlZCBh
cyBhIHJlLXN1Ym1pc3Npb24gKGFuZCBoZW5jZSBsaWtlbHkgd29uJ3QgcXVhbGlmeSBmb3IgNC4x
Nw0KPiBhbnltb3JlIGF0IHRoaXMgcG9pbnQpLCBidXQgSSB0aGluayB0aGF0J3MgdGhlIG9ubHkg
KGxvbmcgdGVybSkNCj4gdmlhYmxlIHBhdGguDQoNClN1cmUsIHRoYW5rcyBmb3IgdGhlIGNsYXJp
ZmljYXRpb24uDQoNCj4gPiA2LiB4ODYvY3B1OiBEcm9wIF9pbml0IGZyb20gKl9jcHVfY2FwIGZ1
bmN0aW9ucw0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2
ZWwvbGlzdC8/c2VyaWVzPTY2NjgzMA0KPiA+IFN0YXR1czogTmVlZCByZXZpZXcuDQo+IA0KPiBU
aGUgcmVwbGFjZW1lbnQgcGF0Y2ggaGFzIGdvbmUgaW4gYXMgMzFiNDFjZTg1OGM4ICgieDg2L2Ft
ZDogb25seQ0KPiBjYWxsIHNldHVwX2ZvcmNlX2NwdV9jYXAgZm9yIGJvb3QgQ1BVIikuDQoNCk9o
IHRoYW5rcyBmb3IgdGhpcyBpbmZvcm1hdGlvbiBhbmQgLi4uDQoNCj4gDQo+ID4gMTIuIHg4Njog
WFNBLTQwezEsMiw4fSBmb2xsb3ctdXANCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz02NjMxNDMNCj4gPiBTdGF0dXM6IFBhdGNo
ICM3ICM4IG5lZWQgcmVwbGllcyBmcm9tIG1haW50YWluZXIsIHRoZSBvdGhlcnMgbWVyZ2VkLg0K
PiANCj4gUGF0Y2ggNyB3YXMgd2l0aGRyYXduLCB3aGlsZSBJJ3ZlIGNvbW1pdHRlZCBwYXRjaCA4
IHRoaXMgbW9ybmluZy4NCg0KLi4uaGVyZS4NCg0KPiANCj4gPiAxNC4gW3YyXSB4ODYvbWVtX3No
YXJpbmc6IHN1cHBvcnQgZm9ya3Mgd2l0aCBhY3RpdmUgdlBNVSBzdGF0ZQ0KPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2VyaWVzPTY2MTU2
Nw0KPiA+IFN0YXR1czogV2FpdGluZyBhY3Rpb25zIGZyb20gYXV0aG9yLg0KPiANCj4gSXNuJ3Qg
dGhpcyBjb21taXQgNzU1MDg3ZWI5YjEwPw0KDQpNeSBiYWQsIEkgbXVzdCBoYXZlIGluY29ycmVj
dGx5IGdyZXBlZCB0aGUgdGl0bGUgd2hlbiBwcmVwYXJpbmcgdGhpcy4NCg0KPiANCj4gPiAxNy4g
eDg2OiBBZGQgTU1JTyBTdGFsZSBEYXRhIGFyY2hfY2FwcyB0byBoYXJkd2FyZSBkb21haW4NCj4g
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nl
cmllcz02NjA3MjkNCj4gPiBTdGF0dXM6IFdhaXRpbmcgYWN0aW9ucyBmcm9tIGF1dGhvci4NCj4g
DQo+IEFmYWljdCBlODNjZDU0NjExZmUgKCJ4ODY6IEV4cG9zZSBtb3JlIE1TUl9BUkNIX0NBUFMg
dG8gaHdkb20iKS4NCg0KQWggdGhhdCBleHBsYWlucyB3aHkgdGhpcyBhbmQgIlBDSTogYXZvaWQg
Ym9ndXMgY2FsbHMgdG8gZ2V0X3BzZWcoKSIgaXMgY2F1Z2h0DQpieSBteSBsaXN0LiBJIHRoaW5r
IEkgd2lsbCBuZWVkIHRvIGltcHJvdmUgdGhlIGZpbmRpbmcgb2Ygc3VwZXJzZWRlZCBzZXJpZXMu
DQoNCj4gDQo+IDE5LiBbUEFUQ0ggdjIgMDAvMTJdIHg4NjogbWVtY3B5KCkgLyBtZW1zZXQoKSAo
bm9uLSlFUk1TIGZsYXZvcnMgcGx1cw0KPiBmYWxsb3V0DQo+IFN0YXR1czogU29tZSBwYXJ0cyBj
b21taXR0ZWQsIHNvbWUgcGFydHMgZW50aXJlbHkgdW5jb21tZW50ZWQgb24uDQo+IA0KPiAyMC4g
W1BBVENIIDAvMl0geDg2L3ZNQ0U6IGFkZHJlc3MgaGFuZGxpbmcgcmVsYXRlZCBhZGp1c3RtZW50
cw0KPiBTdGF0dXM6IElpcmMgbm8gY29tbWVudHMgYXQgYWxsIHNvIGZhci4NCj4gDQo+IDIxOiBb
UEFUQ0ggdjIgMC8yXSB4ODYvbXdhaXQtaWRsZTogKHJlbWFpbmluZykgU1BSIHN1cHBvcnQNCj4g
U3RhdHVzOiBQYXRjaCAxIHN0aWxsIGxhY2tpbmcgYW4gYWNrLg0KPiANCj4gMjI6IFtQQVRDSCB2
MiAwLzhdIHg4NmVtdWw6IGEgZmV3IHNtYWxsIHN0ZXBzIHRvd2FyZHMgZGlzaW50ZWdyYXRpb24N
Cj4gU3RhdHVzOiBJaXJjIGVudGlyZWx5IGlnbm9yZWQgZm9yIGFib3V0IGEgeWVhciAoc2luY2Ug
djEgc3VibWlzc2lvbikuDQo+IA0KPiAyMzogW1BBVENIIDAwLzExXSB4ODY6IHN1cHBvcnQgQVZY
NTEyLUZQMTYNCj4gU3RhdHVzOiB2MSB3YXMgcmV2aWV3ZWQsIGJ1dCBzb21lIG9mIHRoZSByZXZp
ZXcgY29tbWVudHMgbmVlZCBmdXJ0aGVyDQo+IGNsYXJpZnlpbmcgYmVmb3JlIEkgY2FuIHNlbnNp
Ymx5IG1ha2Uvc3VibWl0IHYyLg0KPiBOb3RlOiBEZXBlbmRzIG9uIGl0ZW0gMjIgKGFsYmVpdCBp
ZiBhYnNvbHV0ZWx5IG5lY2Vzc2FyeSBpdCBjb3VsZCBiZQ0KPiByZS1iYXNlZCBhaGVhZCkuDQo+
IA0KPiA+IDUuIHRvb2xzL2xpYnhsOiBlbnYgdmFyaWFibGUgdG8gdHJ1c3RlZCBkZWZhdWx0DQo+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9saXN0Lz9z
ZXJpZXM9NjY0MDgxDQo+ID4gU3RhdHVzOiBOZWVkIHJldmlld3MuDQo+IA0KPiBBcyBwZXIgdGhl
IFhTQSB0aGlzIGlzbid0IGludGVuZGVkIHRvIGJlIGNvbW1pdHRlZC4gSWYgYW55dGhpbmcgdGhl
DQo+IFhTQSBtYXkgd2FudCByZS1pc3N1aW5nIHdpdGggdGhpcyBwYXRjaC4NCj4gDQo+IDguIFtQ
QVRDSCB2NyAwMC8xMV0gbGlicy9ndWVzdDogbmV3IENQVUlEL01TUiBpbnRlcmZhY2UNCj4gU3Rh
dHVzOiBMYXJnZWx5IHJldmlld2VkIGlpcmMsIGJ1dCB0aGVyZSB3YXMgc29tZXRoaW5nIEFuZHJl
dydzIGlucHV0DQo+IHdhcyBuZWVkZWQgb24sIG9yIGhlIHdhc24ndCBoYXBweSB3aXRoLg0KPiAN
Cj4gOS4gW1hFTiBQQVRDSCAwLzJdIGxpYnhsOiByZXBsYWNlIGRlcHJlY2F0ZWQgLXNkbCBhbmQg
LXNvdW5kaHcgcWVtdQ0KPiBvcHRpb25zDQo+IFN0YXR1czogUGF0Y2ggMiBzdGlsbCBoYXZpbmcg
c29tZSBkaXNjdXNzaW9uIG9uZ29pbmcsIGkuZS4gYXMgYQ0KPiBjb21taXR0ZXIgaXQncyBub3Qg
Y2xlYXIgdG8gbWUgd2hldGhlciB0aGUgcGF0Y2ggd2lsbCB3YW50IGEgbWlub3INCj4gdXBkYXRl
Lg0KPiANCj4gPiAyLiBQQ0k6IGF2b2lkIGJvZ3VzIGNhbGxzIHRvIGdldF9wc2VnKCkNCj4gPiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmll
cz02NjYzMjINCj4gPiBTdGF0dXM6IFdhaXRpbmcgZm9yIHYyLg0KPiANCj4gdjIgd2FzIGEgMy1w
YXRjaCBzZXJpZXMgd2hpY2ggaGFzIGdvbmUgaW4gYWxyZWFkeS4NCj4gDQo+IDUuIFtQQVRDSCAw
LzldIGdudHRhYjogZnVydGhlciB3b3JrIGZyb20gWFNBLTM4MCAvIC0zODIgY29udGV4dA0KPiBT
dGF0dXM6IFNvbWUgcGFydHMgYXJlIGNvbnRyb3ZlcnNpYWwsIGJ1dCB0aGlzIHNob3VsZG4ndCBw
cmV2ZW50IHRoZQ0KPiByZXZpZXdpbmcgLyBwcm9ncmVzc2luZyBvZiBub24tY29udHJvdmVyc2lh
bCBvbmVzIHRoZXJlICg3LTkpLg0KPiANCj4gNjogW1hFTiBQQVRDSCB2MiAwLzRdIHhlbjogcmV3
b3JrIGNvbXBhdCBoZWFkZXJzIGdlbmVyYXRpb24NCj4gU3RhdHVzOiBUaGUgM3JkIHBhdGNoIG5l
ZWRzIHJldmlld2luZyBieSBzb21lb25lIHNwZWFraW5nIGVub3VnaCBQZXJsLg0KDQpUaGFua3Mg
Zm9yIGFkZGluZyBtb3JlIHRoaW5ncyB0byB0cmFjay4gUGxlYXNlIGZlZWwgZnJlZSB0byBhZGQg
bW9yZSBpZg0KdGhlcmUgd2lsbCBiZSBtb3JlIGluIHRoZSBmdXR1cmUuDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

