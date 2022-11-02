Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65661578F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 03:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435431.688792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq3Ss-0005xK-LI; Wed, 02 Nov 2022 02:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435431.688792; Wed, 02 Nov 2022 02:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq3Ss-0005vF-GW; Wed, 02 Nov 2022 02:26:50 +0000
Received: by outflank-mailman (input) for mailman id 435431;
 Wed, 02 Nov 2022 02:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unuU=3C=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oq3Sr-0005v9-6B
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 02:26:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbffd02f-5a55-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 03:26:46 +0100 (CET)
Received: from DU2PR04CA0235.eurprd04.prod.outlook.com (2603:10a6:10:2b1::30)
 by DB3PR08MB8891.eurprd08.prod.outlook.com (2603:10a6:10:42a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 02:26:44 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::64) by DU2PR04CA0235.outlook.office365.com
 (2603:10a6:10:2b1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 02:26:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 02:26:43 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 02 Nov 2022 02:26:43 +0000
Received: from 9628f1fba73c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABA47A6A-FEB0-4F62-8F01-1DF0E4344C8E.1; 
 Wed, 02 Nov 2022 02:26:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9628f1fba73c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 02:26:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6230.eurprd08.prod.outlook.com (2603:10a6:20b:29d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 02:26:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 02:26:34 +0000
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
X-Inumbo-ID: cbffd02f-5a55-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AuOrO4iVmAXWfwrJpIM/XtGMKY4TrVNYYglNSDkvQMRBBbE3rpcJ4YswjkF+MZI5ew2EMS0ifox8AM7pd+pctMRUClII8FQLbie6jxhEiDPChzwLJSPn9WWqFHkzczNXNPYVVMHkQ9wYQBFL223OjyewFxMVv0c5ibbyXr3PeJA7fFby4fdlJewJT0inYzTcUXNXzD04Zr0D1JchXzxbFaaxswaggWxxOP0Mfgj09VtTxLXo6086bk7mLVuGcnqcu2bF48JI4wIZvmbE/BSa32RcQZLbf4Pr/ANfnWOHOkX7eQd1z80O4MD/ZeR5S162megkPHGxht0li7jOkIvPdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UHtU8XtcpS0EXFssE+14LXtjeyAVPSX3Y+vDU7HxVU=;
 b=bZhtb7+7up4nt1CRI0TOZlvk9lKg8EwzWshSZK47siM46s+JCoXHGf+kxi4BXq52UAzJkLFxYMNnov8g9mY+npRpZW7mYHE5lE9Ddpn3MJeU/pbPWlH71TGp2uK3oOeFSWPIKPPuHrydz4dCk2f+7Px9Q6scyp85RDMTyoqvEs0UZXBpHTq9R+hd7cVw1B1bxda0Je9WTfuqf7Xo9H6XlIVKGr+1+uGyy5jIxGZ4HRKATZVgbOX7CpBs8K2/zG7Wea6uHbh89jV8/wgS4VikJsOWhVgjQ85tsrY/yZzexhECR0SypL3KfKOn4cgn13dd6UPMBoafAFoEhdvJ5Dyyfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UHtU8XtcpS0EXFssE+14LXtjeyAVPSX3Y+vDU7HxVU=;
 b=MhJyTEjpOoVxaTGsZmPoNtzFrEgccf8srfnibHwITMd1TtfkOwD0lD0yVDTTtaGqao8xh7XZ5Orln0x/C8CUToE1NfQdfzHzuFhDozfg7+dOqWzjWTvDe8y95yelzsC72DD+2eh5Bv6OM1pdYtqjn0mbQuUH0/yiPuu4DjWe9AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHRFigJrKbQoa7S8JGakyzgEwI4AznOW5ZpBh4ntoSgdNuQSNtyAlFKW2Apua9dwpi1khbunbo9I11V9pdPF/uAXHG2CXHDOcFq4UO/kUXuKo5qJltMCHmwpGq0m4lPeecosY26zTLcQMI2HyB9aYWxZLs+nyA3sXTQZWLMuW7Pz3NqHmE4mbD7onsfj08pooq2AJrSkV5fC1+AqpYchMp5pPAIsTpOu4FzkxjJLxFUC9BugXSoXFfhh6EuRpEW3CZdgIB+dotpwjcUOGkPO/e4+KLmV4P7n/tKSS+qhR9kM6xVWeogSQwE173nFQxeYzfKCymHHaUYk2OOL7Sec4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UHtU8XtcpS0EXFssE+14LXtjeyAVPSX3Y+vDU7HxVU=;
 b=Jbp2IsOiOPu9L4ZlhFoW41GQ3er55hPPr+AH2vrENjFUQfSRqEBPzxTJAUhXusfC3w2TSeTZyil+zbySKwCb057raEKHMP1QhXYe2mfUE9Xtfq1LbBynbsQq4rAvNT27nX1dttpQ98Slm97f8xXM1M8Y6CoYMcZCF7y9C4E2NJGWAPxKeYE7UyAc2oVhNGm3uOjNQ0U0xmfW72DdAvS6IbIp0/kp9zwiDKnqShNdG6xH5vXS3jlRPwPbTByaGmi/fp5eCtQMrhGO7Oexv0Gi151j8TNtXU2FzN01qogEjjlx/PHu81zUV86as0vNnulOq4+nmHa/BmfsqbKtosrwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UHtU8XtcpS0EXFssE+14LXtjeyAVPSX3Y+vDU7HxVU=;
 b=MhJyTEjpOoVxaTGsZmPoNtzFrEgccf8srfnibHwITMd1TtfkOwD0lD0yVDTTtaGqao8xh7XZ5Orln0x/C8CUToE1NfQdfzHzuFhDozfg7+dOqWzjWTvDe8y95yelzsC72DD+2eh5Bv6OM1pdYtqjn0mbQuUH0/yiPuu4DjWe9AA=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
Thread-Topic: [PATCH 01/20] tools/xenstore: remove XEN_LIB_STORED and
 XENSTORED_ROOTDIR
Thread-Index: AQHY7ga4dTGSL0cDn0qJYyAUTS/3pK4qRiKAgACiqGA=
Date: Wed, 2 Nov 2022 02:26:34 +0000
Message-ID:
 <AS8PR08MB79915CB6F49D98D6B7D1F03192399@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-2-jgross@suse.com>
 <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
In-Reply-To: <766454c4-1065-a991-b64e-c9f950ad8cdb@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 417C75A47983F049A6B8C07ED181108D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6230:EE_|DBAEUR03FT062:EE_|DB3PR08MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 838c5a49-623d-4e67-7adb-08dabc79af04
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WkKIZ8Zh/JV1U5qmPF/J/J9YKpYvztwA/SZJ1iAqsO2xg1dNKw5lh03DLFLLPGLxm8l8z2Akp2U14PzECw0P/yrQnGLOd1nsPaN4Ta073DQF6B9uEqoSFqPQVc7djT93mr3F+62gWkKqlbIn7LRahFHPITWEqSIkf7hDtab+PWpD5SbcWj3OnctDiIcxmK65axKHIykKLAivKspTNfEt5udaatkFzXfXQL0Wq+mjcRT314na1pLHHRGOaEbLb+kKJbffr4nlZc7HKjUoqqKz7V2Bqar6E9r5isDrrpzUPyLcyT4nZnY+FhJCJg4Lj28T590WPTMe9lXYkwMEu/LSZu9mmpQ2D2TQKcQ18X/vY4nZPQV3/OErK/L1QuntXc1FXf2xoz0FXoMnyg0uiP8Y705KTusJqYxgrqLmz54Wp1Kf7RkJgdZbASHE/LewtHfKNaQlM7S2MbxHoboIg6zAn/YiaHo1Og1qykgxoVC0sk8XosobKrM8r0j7a2NMYXvKzm/CX59ldAHji/wqcDO2G/nfBdCUlXbvXeBUf01+1CKEpVIVaAb6cbY7UUt1Kx5IzrvSl+OmugK+PO6fW2tId/8NlabSHQ8B5aY6hiRJXhNJ5DYP5W9XKtpzeqf2+iTn44WpUxHd97aVeG7rx1WeBZex8bz8KxKAQKuP7GCPxp1U7E5sKJbalpIGmNKSBXUG3kTCqtfRl4QBkJkINfIVnT2LlBPusqzJjhwkBcMwWeA9u7rgnYQEHgug98h1FXHkb+eBxkuJOqCQWyf5Z15XjQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(83380400001)(33656002)(38070700005)(86362001)(38100700002)(5660300002)(8676002)(122000001)(2906002)(66446008)(66476007)(4326008)(64756008)(41300700001)(8936002)(52536014)(66556008)(6506007)(66946007)(7696005)(53546011)(186003)(26005)(9686003)(478600001)(316002)(76116006)(110136005)(54906003)(55016003)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6230
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cea8360f-064b-4fe6-c0b8-08dabc79a94e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KIqpP43WYBeyvLTfQhcdcJdjjIl1UDBFGbHvgYpCPoc1L1QwAd6v3/830cFyCIfipEM1mCWMpF0lPVLoAJYLF/YCQWCsbRmmo8Lsx1qYODXDd2qy1nH8cISZ4cAq5z6I2N/xMl6P1M3DUUko165zIAvbgWEpuJmZI19TqDEm3+b6JepjAn8TiArkwUtv62MjwJZNR7tzqq2y2gEue45xRDmZDzlFfDkQNWSbIkibxleQJR689hiJNoo+cHNuGJJghoFs2EvPxkktHpAan+p71r22awvdxbLq3IlhMwiRmcC40DT6XIO9xIjpr4uPVe5e52oixH6IQHZ6JcBxa14Go+LU0DreqG+txxQTAG8c2U9p4T9rvcSeFRYaivX9ngTo4l5nb0gBsrhafoJXt775oO4/4UUlqZTrh/Zq3+x29uFlLpaKEsniyIhUibFJEADoeBSsJKQu+aL7YrHphX5FM8IcJW2BBGHOXsJaBIUYC3rBATaulgxZDgHN0w6ZQqAT5dZ8U81hysmHmH6oM0GD/tTfp0CEyi7GZsLJFjHO7B45hNt8oPkMJb0TnlRClawrE+zc2NJNrt3XMFlgnuy7x4lObXbGdTz2RiBOth01IsUSyXFQfQelA/R/UUZty/9dPqbFK0Ylj20g5JDcfGWW+q79tAG1v+qLqU4lYrDbFCJ80IviUZAZq8zNe4REuQFBLKK1tMWO5Qeh8lDmjXwR+jp0wf99TQVY942ZwUoRqaXeZ1RODfT8NuXtVqxJ0bdvl2dy+S3mDoxcH5w3t1EvwQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(26005)(9686003)(478600001)(7696005)(83380400001)(36860700001)(54906003)(6506007)(53546011)(336012)(186003)(40480700001)(47076005)(2906002)(40460700003)(55016003)(110136005)(82310400005)(70586007)(52536014)(8676002)(70206006)(4326008)(316002)(8936002)(5660300002)(41300700001)(86362001)(33656002)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 02:26:43.9561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838c5a49-623d-4e67-7adb-08dabc79af04
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8891

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMDEvMjBdIHRvb2xzL3hlbnN0b3JlOiByZW1vdmUgWEVOX0xJQl9TVE9SRUQgYW5kDQo+IFhF
TlNUT1JFRF9ST09URElSDQo+IA0KPiBPbiAwMS8xMS8yMDIyIDE1OjI4LCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPiA+IFhFTl9MSUJfU1RPUkVEIGlzIHNlcnZpbmcgbm8gcmVhbCBwdXJwb3NlLCBh
cyBpdCBpcyBhIG1vdW50IHBvaW50IGZvcg0KPiA+IGEgdG1wZnMsIHNvIGl0IGNhbiBiZSByZXBs
YWNlZCBlYXNpbHkgYnkgWEVOX1JVTl9TVE9SRUQuDQo+ID4NCj4gPiBYRU5TVE9SRURfUk9PVERJ
UiBpcyBiYXNpY2FsbHkgdW51c2VkIGFscmVhZHksIHRoZXJlIGlzIGp1c3QgYSBzaW5nbGUNCj4g
PiByZWZlcmVuY2UgaW4geHNfZGFlbW9uX3Jvb3RkaXIoKSB3aXRoIGEgZmFsbGJhY2sgdG8gWEVO
X0xJQl9TVE9SRUQsDQo+ID4gYW5kIGEgLmdkYmluaXQgZmlsZSBzZXR0aW5nIGl0Lg0KPiA+DQo+
ID4gUmVtb3ZlIHRoZSAuZ2RiaW5pdCBmaWxlLCBhcyBpdCBpcyBub3Qga25vd24gaGF2aW5nIGJl
ZW4gdXNlZCBzaW5jZQ0KPiA+IGFnZXMsIGFuZCBtYWtlIHhzX2RhZW1vbl9yb290ZGlyKCkgYW4g
YWxpYXMgb2YgeHNfZGFlbW9uX3J1bmRpcigpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gRG8gSSBnZXQgYSBSZXF1ZXN0ZWQv
UmVwb3J0ZWQtYnk/DQo+IA0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gDQo+IENDIEhlbnJ5LsKgIFRoaXMgcmVtb3ZlcyBhbiB1bm5lZWRl
ZCBtb3VudCBmcm9tIGRvbTAgKGFuZCBhc3NvY2lhdGVkIGluaXQNCj4gaW5mcmFzdHJ1Y3R1cmUp
LCBhbmQgYXMgc3VjaCB3aWxsIGJlIGEgYmxhbmtldCBpbXByb3ZlbWVudCAoaWYgbWFyZ2luYWwp
DQo+IGZvciA0LjE3LsKgIEknZCBsaWtlIHRvIHRvIGJlIGVudGVyZWQgZm9yIGNvbnNpZGVyYXRp
b24gYXQgdGhpcyBwb2ludC4NCg0KVGhhbmtzIGZvciBub3RpY2luZyEgU291bmRzIGdvb2QgdG8g
bWUuDQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo+IA0KPiB+QW5kcmV3DQo=

