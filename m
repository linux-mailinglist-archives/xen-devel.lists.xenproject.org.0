Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131F74BC99
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 09:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560660.876747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qI2NU-0008Il-Ub; Sat, 08 Jul 2023 07:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560660.876747; Sat, 08 Jul 2023 07:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qI2NU-0008GG-Qw; Sat, 08 Jul 2023 07:29:12 +0000
Received: by outflank-mailman (input) for mailman id 560660;
 Sat, 08 Jul 2023 07:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afvC=C2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qI2NT-0008GA-Cx
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 07:29:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21191f13-1d61-11ee-b237-6b7b168915f2;
 Sat, 08 Jul 2023 09:29:10 +0200 (CEST)
Received: from AS9PR06CA0627.eurprd06.prod.outlook.com (2603:10a6:20b:46e::31)
 by DB9PR08MB9780.eurprd08.prod.outlook.com (2603:10a6:10:45f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sat, 8 Jul
 2023 07:28:34 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::5d) by AS9PR06CA0627.outlook.office365.com
 (2603:10a6:20b:46e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26 via Frontend
 Transport; Sat, 8 Jul 2023 07:28:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.14 via Frontend Transport; Sat, 8 Jul 2023 07:28:34 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Sat, 08 Jul 2023 07:28:33 +0000
Received: from d79d782ba4de.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2FE43CB-714B-494B-A855-6575057B04D5.1; 
 Sat, 08 Jul 2023 07:28:23 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d79d782ba4de.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 08 Jul 2023 07:28:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB5439.eurprd08.prod.outlook.com (2603:10a6:803:13b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sat, 8 Jul
 2023 07:28:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Sat, 8 Jul 2023
 07:28:19 +0000
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
X-Inumbo-ID: 21191f13-1d61-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdjDcwYdAtqlEmgSVd0m6HjrI0mcTrgniRl056C3big=;
 b=JFULIt8E/RSWoxzO32YqFj02v4UzljvkKwYj0j2z3lfS6BtoxE7c8BnN6090mrmEywvFg9n7rdKu4OE33EUzz6l0eWe2H0MuHg4sjI1v0Mf8StFFmsNTWiFsciO4UZsNnuOxxx3dO8E2DHcN1BzKdsyemib+iA9uasSk+yZRueI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 747db35e17dbd82b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M586TXhpXoGcBXuwRU8f8DT0wMHJPb/wXoyxYCo1LPoh6zHGoUg5ajSj6ufLxZr6jNaXtCWBeUBrRKpisYMoPydKU/EpC/dmpX7gwREU2oHxqZMSKpmkqc39LlZF0svwDqTtz8hS0G6oO18ltPyr7JLPto4pr5hUDvJYaNgiCHGChed2ObNIxzqGPfbPSW0VhWXOzPVXEDTtPAmU7VFWHKpRAlRZePrrELwE7azp0f/l/jJfdWk5xRrwqkncZ3Ywx0kotUREDg84ZMC3OBeO0fBbHRBouBJs3GJNFTbG3tfykR0uJTM4t1ZAZmx5pMu3BE2boDxosb+Sl53XPTJFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdjDcwYdAtqlEmgSVd0m6HjrI0mcTrgniRl056C3big=;
 b=XObwFi632XMDJXSKbDmagk6+CTQRujNY3UJ028p/AkFqW3Yjq0QeOjv74NffC8Y/1m16ICHNlSIGOfjcmP8ppVbg9PgSagdhKJjQBDLenXMXZ0tPWPYIymijHL/g0yfKcDHOuJeGu/0C1MRNnWOf0qqozEo9InA4Frm6AkrOQrJeJoNd7fTrqLEtYIfJpvgjQ/t5Cx6+BuScjxQnjn+dzM7ffQuxvchmV2d4XXGLsblIeOwXNlAqgQxd5OBmSZZvx2sO2qklxwoqZQDq/o46SKdBzCPnv1z2DZpGALsndpiJoNLByoZ2dIVPv2gZLwvB+EQ74pJnBXUoC3V5ErvDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdjDcwYdAtqlEmgSVd0m6HjrI0mcTrgniRl056C3big=;
 b=JFULIt8E/RSWoxzO32YqFj02v4UzljvkKwYj0j2z3lfS6BtoxE7c8BnN6090mrmEywvFg9n7rdKu4OE33EUzz6l0eWe2H0MuHg4sjI1v0Mf8StFFmsNTWiFsciO4UZsNnuOxxx3dO8E2DHcN1BzKdsyemib+iA9uasSk+yZRueI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Rich Persaud <persaur@gmail.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, George Dunlap <george.dunlap@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Rian Quinn <rianquinn@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Scott Davis <scott.davis@starlab.io>, Adam Fraser
	<adam@starlab.io>, Paul Durrant <paul@xen.org>,
	"rsmith@riversideresearch.org" <rsmith@riversideresearch.org>,
	"m.a.young@durham.ac.uk" <m.a.young@durham.ac.uk>, Elliott Mitchell
	<ehem+xen@m5p.com>, openxt <openxt@googlegroups.com>, Jason Andryuk
	<jandryuk@gmail.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index:
 AQHZqzMUKP6yBnvUfEC1egkdxmuozK+ki8cAgAB66ACAAukxgIAAZuEAgAAgQQCAABPDAIACuauAgACBNoCAAMWkAIAAwt2AgAGJIQCAACU3AIAAIOcAgAAM7QCAAFrAAA==
Date: Sat, 8 Jul 2023 07:28:16 +0000
Message-ID: <4CAC8F69-ABE0-47D7-9421-77F0719B9BDE@arm.com>
References:
 <alpine.DEB.2.22.394.2307071814070.761183@ubuntu-linux-20-04-desktop>
 <7486398B-AEAE-4199-8DF1-B713FEECD672@gmail.com>
In-Reply-To: <7486398B-AEAE-4199-8DF1-B713FEECD672@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB5439:EE_|AM7EUR03FT039:EE_|DB9PR08MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b801f24-c2ea-4101-237d-08db7f84f014
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DF3DRwL9EHp2G6sQRziKoPt4h755OdugsmPnMIlEQD3lTC8yFh4yRTYi2quYXNA444UeFmPhdy3hIN3rNpY4CwgFg/QbxcRTjzW1i5746R2oDgcLJc65+NoWxCE1rei7KdkC52us0Z+io2YQXaqhAut+LhhxDfyjnn7RpH2nA8MNFX+K4aTu2sTyIOphaaJquLvH2CClDkBXI8XlDZgWsEfR46tYKplTpNlkiVDEJiWxq6K0OSNhlYrJE/EeeZTsr5GV5yt2W12f+ua0ifwDG5TIeeET0WhV0rxfoUNgbBtNFe4cyfyQFKmQf4EYjE7EDivDxbiKv5KTO9fnc4iBkTdcUVCbiYYnLjCEiXjoloLrbBV3XEe06mEf0IV05Svnl+GrCWnTyvRByPVfEPPfp475Ps9kT4Ki59lSn0FVhS1o9AcMgxQ0aehlAfgbm0/nSSjt0gid7INGlirgQ51CQrv/PQFNXsbI4uED9BXjE3To4oaGHsMIh34ntIDNCv6DWzWsUdJziQ/jzIGgL4kLut0DepERtwqo2cUK1tRq7RSQ5iP3+OKPt+8rjJ7cwG0icpxIBxrOri4lFx9V7EE6MggQkZj6Os9kL4KvDf1qYDTT/4FEQ0ug4oldsnhZbpYMMezpEX5zcU5N1xfCYBhX3HHA4d6wzsTYlQ6hk1jnQmg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(66556008)(66446008)(66476007)(64756008)(66946007)(7416002)(86362001)(4326008)(38070700005)(4744005)(316002)(2906002)(91956017)(6916009)(76116006)(41300700001)(478600001)(54906003)(5660300002)(8936002)(8676002)(38100700002)(71200400001)(6666004)(122000001)(6486002)(6512007)(6506007)(26005)(2616005)(36756003)(33656002)(186003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EE1D8823EB27D43B94D36DDE9F4DE0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5439
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f809147-729b-4d05-e854-08db7f84e5b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y2ixfb1B7ND1W9guGsu2OGArdnc5RRF5qMzW7ABctjsiwTJsKi05Odklb/TBOqPNVhgp73ioiQTD3/T+mdRoiVOSPq6PWkIJnWESmNXMwULhW8wjiwMkR9Zuau+Mq3dmk9NQ/1XNuNKAA3vXFE9RMfxLAGB4gCU4yb29i5d/3qgrGSK18P9cnbdB67KS/lzVROGyWCE05w6lDHdSDm3/YP1hZHZ8osR3u/bePlBJXNNf7AChtWj9lTh2CDwqLAPJXgJPRqLumIoC1IkDEPK39aS6ByeRJ60udrZeRASibfjGiTDAGMdPeua+KfEB3wur+faufx8FjXeIKDnfeAMFrO0nwpNzsZvNnRTRKMDUXkcLcVj7PristOegOfUz9xHxTVGc3YxBkdLD0LSRFSEhwl5DfY+ULi3WEc4GkxNC2tsOx7uWRR+c3AXc33uC3ZFXJGWLr1Mqa1HqcIIG02OE46RB5D1mtyqZKZ/brTx8K46NETR1SkdmJv84Cc7/uxwGF0XF4+CST4xXdVxkwPlmOMuSnGeMHi59N8b1cdf0d5Do0EIMrX4b6nQyuuelY5vB7jT3Qq4EVS+AFelAiyqMybfyo5HrO70zcEaeqmGUd1RWtpN7euEH7kwl1u1faXHrkDVpuGWgg5kRFIeqWw9RfcJVUw7DgkHQ51MGiFpwATTrSjS86dgFbp2YG9Ig29rAIgHK8pVKDrR+kCPjAA44E5QtyVkX8lA64BbJGDCCA6uqxIFJAqAFgRDbx/uqC/P7n/d0Vi/OH9AVGrldMEBWPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(86362001)(82310400005)(40460700003)(40480700001)(36756003)(33656002)(54906003)(6666004)(478600001)(70586007)(6486002)(70206006)(81166007)(356005)(82740400003)(107886003)(5660300002)(36860700001)(6506007)(6512007)(26005)(186003)(316002)(8936002)(8676002)(2906002)(6862004)(2616005)(336012)(41300700001)(47076005)(4744005)(4326008)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2023 07:28:34.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b801f24-c2ea-4101-237d-08db7f84f014
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9780

Pj4+IA0KPj4+IEluc3RlYWQsIHRoZSB1c2UgY2FzZSBjb25maWd1cmF0aW9ucyBzaG91bGQgdGhl
bXNlbHZlcyBiZSBkZXNjcmliYWJsZS4NCj4+IA0KPj4gVGhhbmtzIENocmlzdG9waGVyLCBEYW5p
ZWwgYW5kIGFsbCENCj4+IA0KPj4gU28gaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgeW91IGFy
ZSBpbiBmYXZvciBpZiByZW5hbWluZyBEb20wbGVzcyB0bw0KPj4gSHlwZXJsYXVuY2ggdGhyb3Vn
aG91dCB0aGUgWGVuIGNvZGViYXNlPyBBbmQgd2UgbmVlZCBhIGNsYXJpZmljYXRpb24gb2YNCj4+
IHRoZSBkb2NzLywgZXNwZWNpYWxseSBkb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYz8NCj4g
DQo+IENocmlzdG9waGVyIHdyb3RlOg0KPj4+ID0gQ29tbXVuaXR5IHJlc291cmNpbmcNCj4gDQo+
IE5vdGUgdGhlIHByZS1yZXF1aXNpdGUgd29yayBpdGVtcyBmb3IgdXBzdHJlYW0gWGVuLCBsaXN0
ZWQgdW5kZXIgIkNvbW11bml0eSBSZXNvdXJjaW5nIiwgdG8gbWVyZ2UgY29kZSBmb3IgSHlwZXJs
YXVuY2ggY29tbW9uIGludGVyZmFjZXMgYW5kIHRlc3QgY2FzZXMsIHdpdGggZG9jcyBvbiBjb25m
aWd1cmF0aW9uIG9mIEh5cGVybGF1bmNoIHRvIGRlbGl2ZXIgZnVuY3Rpb25hbGl0eSBmb3IgZG9t
MGxlc3MgdXNlIGNhc2VzLg0KDQpBcmUgeW91IHNheWluZyB0aGF0IGJlZm9yZSByZW5hbWluZyB0
aGUg4oCcZG9tMGxlc3PigJ0gZmVhdHVyZSwgd2Ugc2hvdWxkIHdhaXQgZm9yIGl0IHRvIGJlIHBv
cnRlZCB0byB0aGUgY29tbW9uIGNvZGU/DQoNCj4gDQo+IFRoYW5rcywNCj4gUmljaA0KDQoNCg==

