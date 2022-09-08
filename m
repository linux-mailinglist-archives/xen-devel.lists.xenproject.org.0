Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043185B2161
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403415.645528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWIwD-000488-1h; Thu, 08 Sep 2022 14:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403415.645528; Thu, 08 Sep 2022 14:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWIwC-000456-TU; Thu, 08 Sep 2022 14:55:28 +0000
Received: by outflank-mailman (input) for mailman id 403415;
 Thu, 08 Sep 2022 14:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5itv=ZL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oWIwA-000450-PM
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 14:55:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44dcbb50-2f86-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 16:55:25 +0200 (CEST)
Received: from FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::11)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 14:55:21 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::75) by FR3P281CA0176.outlook.office365.com
 (2603:10a6:d10:a0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.6 via Frontend
 Transport; Thu, 8 Sep 2022 14:55:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 14:55:20 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 08 Sep 2022 14:55:19 +0000
Received: from f271bd90c72d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91D5EAD7-2968-4A3C-9953-DE3B1C21B17D.1; 
 Thu, 08 Sep 2022 14:55:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f271bd90c72d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 14:55:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 14:55:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 14:55:11 +0000
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
X-Inumbo-ID: 44dcbb50-2f86-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FFxhnZtCojwywSacuYDWJRHNlRIoLgCxNn3TCZxmCiE5Hox2dnrb9e0rtb6ePbiak1I92M6g0JZOz2jnpSquGMcAZnA2YERDazc2wG/yQF+ZkJOyJkm9a/4oXt/hlTE75cJl+2OuvUPNAdlch9187Szplg0y8LGYKb/0UWEkoM3ryY9/m+fILSbii0yqBnScttLJrC2XFuQX2H2QfepQczXULW89/ftKgbMaQ0FJ0D/yBo3We1XDHG3u6tYjNtzNkByHEYiQMSJHUAO8wtQLibwbIB2Ry4itvRLLeMnM5IzfPPSFAPBJddpmcfzT4dW+VQhSOuIj2lAamAK/ftV5oA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+prVyg5c9zu9gczVOEkC80Uht3impG6KJztFkLvX9E=;
 b=jqtdpuZuAujDkfYTcbcttDWploKRc6RagZ3usccV05HVA0qmdmsgbYI/Fn9Yyf/7k0Dbzv7WLTgoVDx0lLQEtc08+7682jqtg+5k/kALFcaQvbjelenIoXFUxvi12HLEhpu6OESGvniCAqEQdkXLZdCmeUkpydJOwbWei8tsJjD/Y/ZS1wx0ETrRLWF9yYs1mVMj7X4qOEc+548T4cso7B7kIFvhlwrEMLOEYmEpHSMV9dq31tN31uE4RZmExy855xicDIMX/26XuoTi94DW/q7y5p/TfjO3lMV3kiYPAtAYRcQKDxMwzCPxRgjP3dHCD2F99YovhSOnUVC2iAMdwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+prVyg5c9zu9gczVOEkC80Uht3impG6KJztFkLvX9E=;
 b=sDFpb2lYCbfP4cDlVLIEnsnbMVwtKC/k4FHDC6kmDP1qEiTE1X+/sB/ohc6o2UTRkTWK92g1FAon9YXlGTlqzloDysNouGFH56q4WYl9x3nrN4uqOO4IMxmMhWOf8R3e0v6gioU37AiSLHItsMBe9g4GfAlLLdsBVb5fc9y8xU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayCO2PqHJSKrEZ54y237D9B9A1gyE649kpDRmvoa+0+GDgDG95MBLq+0lQwvkyBLEoQ0eFw18KSEbu+dM8+evPNSbz0dWDVw0y6wGcmwIS+3f/Xs/S32stRp5trl14CaYQDj4Ubv4ePwHELHSsUEzUp63EhVuqphmM4moap2N5KV/2Q0JUlR1v9Ac1GMn9N9/40agiehrIcE+Gm0X6WXcNkadn5E5YKheUCIh+qk4xXoKu10Vk7JcxoDZ2PHqr6HQ54QSqfQqQk6YNE+XrQuhH5AwX7OCVuZ8pDhaIeg2U/R/B2orWCw+f42BPPXsOoooXLECmDbQQAk+R4G01Kf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+prVyg5c9zu9gczVOEkC80Uht3impG6KJztFkLvX9E=;
 b=dm/l/I47tQaJNZrshhtiCGysqH38YPk7gaREQfNFQ+eyLcNMOFs38riRAVe/x+SZJLY8pn8bnnGC/ebY68QUIZeK1zdu9gC8i5HAp8lTCCAT38fPUcIWE3iyKWxiVvIIeRTMFA+e2n+JHYbKfIgFzMrtYmscUWECzLmELtJVLCCKirNQsK+uCRdT1o1rJTr0YDeOIntQP+yoYecrbtUfkOmLdTqUy0oaxxTTf+BEjy2oPlQu8bu8gttYOSDWsqGIGM/lgo11IYc/40jCLFaFvYPQWyijyezW6rbWsRIujDg0Av64WU/O5fsrVCaakgHTFODEZRjK4W8Qp0Bs8ijARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+prVyg5c9zu9gczVOEkC80Uht3impG6KJztFkLvX9E=;
 b=sDFpb2lYCbfP4cDlVLIEnsnbMVwtKC/k4FHDC6kmDP1qEiTE1X+/sB/ohc6o2UTRkTWK92g1FAon9YXlGTlqzloDysNouGFH56q4WYl9x3nrN4uqOO4IMxmMhWOf8R3e0v6gioU37AiSLHItsMBe9g4GfAlLLdsBVb5fc9y8xU8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 4/6] xen/x86: use arch_get_ram_range to get information
 from E820 map
Thread-Topic: [PATCH v4 4/6] xen/x86: use arch_get_ram_range to get
 information from E820 map
Thread-Index: AQHYvnyUkd8Ta8Mw/E68HKFtTdhKYK3VfB2AgAAsdNA=
Date: Thu, 8 Sep 2022 14:55:11 +0000
Message-ID:
 <PAXPR08MB74204DA78A2DF0791BDBDEF49E409@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-5-wei.chen@arm.com>
 <feec52d5-488b-8214-fde9-b2b26f78a5b5@suse.com>
In-Reply-To: <feec52d5-488b-8214-fde9-b2b26f78a5b5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 90A5B9302B464449A6D6348C16CF7F18.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DBBPR08MB6313:EE_|VE1EUR03FT032:EE_|DB9PR08MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7338c4-4202-45a3-5313-08da91aa26f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mApIoRiSN1dTYPmUm0T2fbSOFiSCFWwxrosyLBpJapmxatqJgV4RkJ3X7MdB0sjWiIhZt/QUur+ZR6A0xErJ9VFiXXy2jdic+YdYxwSlVIvljgXn2dKUxb4Vk+pomeggkpj4HcFLqzM0nf7IZ0SSjjnDN/LKnM/Pma8q23Mqyi78lA9Cx5diii3Fmh4fLCnJC30NjW65QspqOcMnESx2BPgjqDBZ4C0FbSJx6hmHPl5Mqu2su8kX6+XVWdl266PS4N4DreLxmlpkoPrOxXT/8K2PhAJW+5FRcz7D7WMHv9QyvPPqhPytT1d83vqvuva6t8jDKVxEl2htO1v4hg7zPL6qPPLYodFDiSWNZIeMTgewqU267ZTzMTeQvWup00hOmB75gMx3hJFKsFeQVapbKBwR9fyffYK2Xr9WnsU91ol64p7jT6o/xCz3K7jWiNTfZykIWePeucnsBf01uTxtD4wcaxasnyv/bLNQSbQZM/YqnescGl7nVOENEbga5A+4usTkmEaW3zm4OX77UJGOD6abTGU8pdn4b3yy+QXwvhC1q0bU+68nbwK6xE6Ue66kJBSXBQee1aJTPFo5SLldE/tPq9WzqOmmbkkw1gCTu2/EmQztB08V49pibu/bMt1dcYF6tjSL9DnhHvj3/NhB2u3uDIJ+kqHEErYPP/y1EmUox2J5TxTisJgsEcNr1IiB9QoxLANvv06ffKIZGWNSVR9aCoP25eYeMRRhmk9Oa16k2t0MV8mQrKGQkxcZjFiYliiR3p3BJrmRwSPBz/J93Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(186003)(52536014)(83380400001)(2906002)(53546011)(55016003)(5660300002)(6506007)(7696005)(86362001)(33656002)(9686003)(8936002)(71200400001)(41300700001)(478600001)(38070700005)(66476007)(76116006)(64756008)(4326008)(66446008)(54906003)(6916009)(66556008)(38100700002)(316002)(66946007)(8676002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd331042-3b89-4f3a-0ea8-08da91aa2138
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xwyOEQoX841LoAh/inmgOdE5+ske7wEzll+x3E8r2aFZI99bSnfX9Jsd87gWamhLvEMAfv9v0OkahwEqyMJBZrWdHwGRNRLQdZandsXWv3eE8BHRuuLVXgfG/5p5pgrEIRsd6g7pszIJ/eK6pJxez5GXWo6HVadqgBFHgn9fu5Ahq5Me9VEJ0oeUB4PncGZyCFoA3oXKEQSv+SQUuzhNpul5z+YltoyhwByUdAZWDt4Pbx78qmybDrZMRXOMkOXZw8lIROhfcSypbEntE8df5ZhmedCE4a9ff4npsMIeUPZAEHjxM77xUo0KUrAtLh5kcImsaK6s9g9IXT1lHbXwD0qeGzUWlSfaE8oxkwq5/SZcL4wP9fvF9+ff1cBqAVJL/Hpb5Jg2wxpmV0wUsz8MWo66Lvr5IKBjfUhw7OpQQ9ee4k83uJQydbMBhP7XTm7FuVHw9vu4s2vfwfSvs2pxbDtmXzXN+ZPJIzSk5569axWUUblhQ3fAPK7BRPJ5Tx3K16x/Jl9NIQLB56osE0cRs5W03miFeZ0IO1hu7rwfpqn4DeeAJmlkbZQ7xA5P/JvyKLAodmLTaMe1qrXNhFbiNaGy/Kuiv9r7IXKTpeiSGYEkyW9keZB9vNTC36sfbBYKJPSdkNu3wT3htKDQBcLY0tdL4RyCyzpbs/avqjm/lH7TY2YYuJUR9DBS1mABfmBJdSbG06Qngaptz1BMAOtq0wK5GwmPPnxwy1EH9t4MVi0zVTg+H1MPmgv3j7pboQN0ZqXujip0aSw4w+SSc2c/Yg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(26005)(478600001)(6506007)(9686003)(70206006)(70586007)(40480700001)(7696005)(55016003)(82310400005)(6862004)(2906002)(33656002)(40460700003)(86362001)(54906003)(81166007)(316002)(8676002)(41300700001)(53546011)(4326008)(356005)(82740400003)(186003)(47076005)(83380400001)(52536014)(5660300002)(8936002)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:55:20.8571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7338c4-4202-45a3-5313-08da91aa26f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIg45pelIDIwOjE0DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEdlb3Jn
ZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NCA0LzZdIHhlbi94ODY6IHVzZSBhcmNoX2dldF9yYW1fcmFuZ2UgdG8gZ2V0DQo+IGluZm9y
bWF0aW9uIGZyb20gRTgyMCBtYXANCj4gDQo+IE9uIDAyLjA5LjIwMjIgMDU6MzEsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+IFRoZSBzYW5pdHkgY2hlY2sgb2Ygbm9kZXNfY292ZXJfbWVtb3J5IGlzIGFs
c28gYSByZXF1aXJlbWVudCBvZg0KPiA+IG90aGVyIGFyY2hpdGVjdHVyZXMgdGhhdCBzdXBwb3J0
IE5VTUEuIEJ1dCBub3csIHRoZSBjb2RlIG9mDQo+ID4gbm9kZXNfY292ZXJfbWVtb3J5IGlzIHRp
ZWQgdG8gdGhlIHg4NiBFODIwLiBJbiB0aGlzIGNhc2UsIHdlDQo+ID4gaW50cm9kdWNlIGFyY2hf
Z2V0X3JhbV9yYW5nZSB0byBkZWNvdXBsZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMNCj4gPiBtZW1v
cnkgbWFwIGZyb20gdGhpcyBmdW5jdGlvbi4gVGhpcyBtZWFucywgb3RoZXIgYXJjaGl0ZWN0dXJl
cw0KPiA+IGxpa2UgQXJtIGNhbiBhbHNvIHVzZSBpdCB0byBjaGVjayBpdHMgbm9kZSBhbmQgbWVt
b3J5IGNvdmVyYWdlDQo+ID4gZnJvbSBib290bWVtIGluZm8uDQo+ID4NCj4gPiBEZXBlbmRzIGFy
Y2hfZ2V0X3JhbV9yYW5nZSwgd2UgbWFrZSBub2Rlc19jb3Zlcl9tZW1vcnkgYmVjb21lDQo+ID4g
YXJjaGl0ZWN0dXJlIGluZGVwZW5kZW50LiBXZSBhbHNvIHVzZSBuZXV0cmFsIHdvcmRzIHRvIHJl
cGxhY2UNCj4gPiBTUkFUIGFuZCBFODIwIGluIHRoZSBwcmludCBtZXNzYWdlIG9mIHRoaXMgZnVu
Y3Rpb24uIFRoaXMgd2lsbA0KPiA+IHRvIG1ha2UgdGhlIG1hc3NhZ2Ugc2VlbXMgbW9yZSBjb21t
b24uDQo+ID4NCj4gPiBBcyBhcmNoX2dldF9yYW1fcmFuZ2UgdXNlIHVuc2lnbmVkIGludCBmb3Ig
aW5kZXgsIHdlIGFsc28gYWRqdXN0DQo+ID4gdGhlIGluZGV4IGluIG5vZGVzX2NvdmVyX21lbW9y
eSBmcm9tIGludCB0byB1bnNpZ25lZCBpbnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
Q2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IGFsYmVpdCBzdGlsbCB3aXRoIGEgY291cGxlIG9mIHN1Z2dl
c3Rpb25zOg0KPiANCg0KVGhhbmtzLCBJIHdpbGwgYWRqdXN0IHRoZSBjb2RlIGNvbW1lbnRzIHRv
IGFkZHJlc3MgeW91ciBzdWdnZXN0aW9ucy4NCg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0
LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gQEAgLTQyOCwzNyArNDI4LDQz
IEBAIGFjcGlfbnVtYV9tZW1vcnlfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gYWNwaV9z
cmF0X21lbV9hZmZpbml0eSAqbWEpDQo+ID4gICAgIE1ha2Ugc3VyZSB0aGUgUFhNcyBjb3ZlciBh
bGwgbWVtb3J5LiAqLw0KPiA+ICBzdGF0aWMgaW50IF9faW5pdCBub2Rlc19jb3Zlcl9tZW1vcnko
dm9pZCkNCj4gPiAgew0KPiA+IC0JaW50IGk7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPg0K
PiA+IC0JZm9yIChpID0gMDsgaSA8IGU4MjAubnJfbWFwOyBpKyspIHsNCj4gPiAtCQlpbnQgaiwg
Zm91bmQ7DQo+ID4gKwlmb3IgKGkgPSAwOyA7IGkrKykgew0KPiA+ICsJCWludCBlcnI7DQo+ID4g
KwkJdW5zaWduZWQgaW50IGo7DQo+ID4gKwkJYm9vbCBmb3VuZDsNCj4gPiAgCQlwYWRkcl90IHN0
YXJ0LCBlbmQ7DQo+ID4NCj4gPiAtCQlpZiAoZTgyMC5tYXBbaV0udHlwZSAhPSBFODIwX1JBTSkg
ew0KPiA+IC0JCQljb250aW51ZTsNCj4gPiAtCQl9DQo+ID4gKwkJLyogVHJ5IHRvIGxvb3AgbWVt
b3J5IG1hcCBmcm9tIGluZGV4IDAgdG8gZW5kIHRvIGdldCBSQU0NCj4gcmFuZ2VzLiAqLw0KPiA+
ICsJCWVyciA9IGFyY2hfZ2V0X3JhbV9yYW5nZShpLCAmc3RhcnQsICZlbmQpOw0KPiA+DQo+ID4g
LQkJc3RhcnQgPSBlODIwLm1hcFtpXS5hZGRyOw0KPiA+IC0JCWVuZCA9IGU4MjAubWFwW2ldLmFk
ZHIgKyBlODIwLm1hcFtpXS5zaXplOw0KPiA+ICsJCS8qIFJlYWNoIHRoZSBlbmQgb2YgYXJjaCdz
IG1lbW9yeSBtYXAgKi8NCj4gPiArCQlpZiAoZXJyID09IC1FTk9FTlQpDQo+ID4gKwkJCWJyZWFr
Ow0KPiANCj4gU3VjaCBhIGNvbW1lbnQgYWhlYWQgb2YgYW4gaWYoKSBpcyBvZnRlbiBiZXR0ZXIg
cHV0IGFzIGEgcXVlc3Rpb24sIGUuZy4NCj4gIlJlYWNoZWQgdGhlIGVuZCBvZiB0aGUgbWVtb3J5
IG1hcD8iIGhlcmUgb3IsIGlmIHlvdSBkaXNsaWtlIHVzaW5nIGENCj4gcXVlc3Rpb24sICJFeGl0
IHRoZSBsb29wIGF0IHRoZSBlbmQgb2YgdGhlIG1lbW9yeSBtYXAiLg0KPiANCj4gPiArCQkvKiBJ
bmRleCByZWxhdGUgZW50cnkgaXMgbm90IFJBTSwgc2tpcCBpdC4gKi8NCj4gPiArCQlpZiAoZXJy
KQ0KPiA+ICsJCQljb250aW51ZTsNCj4gDQo+IEFuZCB0aGVuIHBlcmhhcHMgIlNraXAgbm9uLVJB
TSBlbnRyaWVzIiBoZXJlLg0KPiANCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+
ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiA+IEBAIC04MSw2ICs4MSwxOSBAQCBz
dGF0aWMgaW5saW5lIG5vZGVpZF90IF9fYXR0cmlidXRlX3B1cmVfXw0KPiBwaHlzX3RvX25pZChw
YWRkcl90IGFkZHIpDQo+ID4gICNkZWZpbmUgbm9kZV9lbmRfcGZuKG5pZCkgICAgICAgKE5PREVf
REFUQShuaWQpLT5ub2RlX3N0YXJ0X3BmbiArIFwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTk9ERV9EQVRBKG5pZCktPm5vZGVfc3Bhbm5lZF9wYWdlcykNCj4gPg0KPiA+
ICsvKg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIHByb3ZpZGVzIHRoZSBhYmlsaXR5IGZvciBjYWxs
ZXIgdG8gZ2V0IG9uZSBSQU0gZW50cnkNCj4gPiArICogZnJvbSBhcmNoaXRlY3R1cmFsIG1lbW9y
eSBtYXAgYnkgaW5kZXguDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCByZXR1
cm4gemVybyBpZiBpdCBjYW4gcmV0dXJuIGEgcHJvcGVyIFJBTSBlbnRyeS4NCj4gPiArICogb3Ro
ZXJ3aXNlIGl0IHdpbGwgcmV0dXJuIC1FTk9FTlQgZm9yIG91dCBvZiBzY29wZSBpbmRleCwgb3Ig
cmV0dXJuDQo+ID4gKyAqIC1FTk9EQVRBIGZvciBub24tUkFNIHR5cGUgbWVtb3J5IGVudHJ5Lg0K
PiANCj4gVGhlIHdheSB5b3UndmUgaW1wbGVtZW50ZWQgdGhpbmdzLCAtRU5PREFUQSBpc24ndCBz
cGVjaWFsIGFueW1vcmUsIHNvDQo+IGJldHRlciB3b3VsZG4ndCBiZSBjYWxsZWQgb3V0IGFzIHNw
ZWNpYWwgaGVyZS4gTWF5IEkgc3VnZ2VzdCB0byBhdA0KPiBsZWFzdCBpbnNlcnQgImUuZy4iIGlu
IGZyb250IG9mIGl0PyAoQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gY2hlY2sNCj4gZm9yIC1F
Tk9EQVRBIGluIG5vZGVzX2NvdmVyX21lbW9yeSgpIGFnYWluLCBmb2xsb3dlZCBieSBBU1NFUlQo
IWVycikuKQ0KPiANCj4gPiArICogTm90ZTogdGhlIHJhbmdlIGlzIGV4Y2x1c2l2ZSBhdCB0aGUg
ZW5kLCBlLmcuIFtzdGFydCwgZW5kKS4NCj4gDQo+IFBlcmhhcHMgYmV0dGVyIFsqc3RhcnQsICpl
bmQpIHRvIG1hdGNoIC4uLg0KPiANCj4gPiArICovDQo+ID4gK2V4dGVybiBpbnQgYXJjaF9nZXRf
cmFtX3JhbmdlKHVuc2lnbmVkIGludCBpZHgsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhZGRyX3QgKnN0YXJ0LCBwYWRkcl90ICplbmQpOw0KPiANCj4gLi4uIHRoaXM/DQo+
IA0KPiBKYW4NCg==

