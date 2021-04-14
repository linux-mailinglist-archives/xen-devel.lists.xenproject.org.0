Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75D35F159
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110454.210839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcYJ-0007fE-Fr; Wed, 14 Apr 2021 10:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110454.210839; Wed, 14 Apr 2021 10:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcYJ-0007ef-9V; Wed, 14 Apr 2021 10:15:19 +0000
Received: by outflank-mailman (input) for mailman id 110454;
 Wed, 14 Apr 2021 10:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1ra=JL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lWcYH-0007eI-Hc
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:15:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57171729-7814-42b7-86ba-202170ea9c43;
 Wed, 14 Apr 2021 10:15:17 +0000 (UTC)
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by PAXPR08MB7230.eurprd08.prod.outlook.com (2603:10a6:102:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 10:15:07 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::bb) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 10:15:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 10:15:06 +0000
Received: ("Tessian outbound 81a4524e9a48:v90");
 Wed, 14 Apr 2021 10:15:06 +0000
Received: from 9cdd780bd3f7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22ABDB8B-FA34-4E91-A6A5-A327134C9E9E.1; 
 Wed, 14 Apr 2021 10:14:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cdd780bd3f7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 10:14:55 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3312.eurprd08.prod.outlook.com (2603:10a6:803:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 10:14:51 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 10:14:51 +0000
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
X-Inumbo-ID: 57171729-7814-42b7-86ba-202170ea9c43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHUA0qgAPsu2HYCT8bTV6W/Moacfs3YTvwBXZoQ4dK4=;
 b=T2POsae9+GeCZ1szo2VxnqzCyFDZ+gDDJk75WyhPRq+kB6u7J/hYCqMpJRBz9zXRbFSk16i+heRVNTPafp/boWcB1XF7s/Pr+jt6OGV4gYoYVdvkwdKzwBMf+ffQzreVhlIlnOEOcLCdVJf1CqAPrUA+UK/n7/ho0xySQ9j6CNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a107ba044f62111f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV+F+V6sU02B1FIoqXEWWCNz33G3QMSchSUzDmmbr4zwZg5qhVO6JewNNA6ywAyRmSeB0G0a4HcxEJ3LTK2NvPZkKjP5/bQ8mNlAI1mPZPoPaiaoGBKMOEEG888Jne117GYQGhgMJO/TEKZl+atG5rVcohXMuMn40BuGEAOROeULYsvPqLCGaiOXdlZOY3cEJ3PQpcYbYyvaWiUw2FWh46x2zlu/NTVP99Wpd7lBdXoR+Si/+RJWm+xiOMzgiQ/y+OnXnL/hbkhRN9Zt7KXYPmkkITC+Vn04t1+dFsRM+hplBvsgi0aCNOzs85Axx9b010pvVAW357v9wiE9eadltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHUA0qgAPsu2HYCT8bTV6W/Moacfs3YTvwBXZoQ4dK4=;
 b=AEMFjiMnYaMlptI4FK/xb17s3Y1UxUQqEdfUTtmnO0UCn9TL/6byup7B5BPGQbdwBNgoqTFU6s/Cia5ctjBV+PnA7KVrlCDN5J0NyD3nJEGy3RCoS8Ci4MJdLx0YnHn67bEvyL5JtwrmUTNnYvenNwPSKTSdLBA90o+iZDMILktnW5Vj+XWV23fGmmboT/FnLcRK2erTnEIvCe24ddtlkkS8CO2iWtia9EtdzzbOdvDw/9iIRmOoTMlP37vFzHSSTi5T62cf3KMspbJv4G+qvEtT89iaZEPsm0PPTAV0ydzii6DbReGkgN5LLO8R+q5fRsTw0j8/w4ktAe7qUGcAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHUA0qgAPsu2HYCT8bTV6W/Moacfs3YTvwBXZoQ4dK4=;
 b=T2POsae9+GeCZ1szo2VxnqzCyFDZ+gDDJk75WyhPRq+kB6u7J/hYCqMpJRBz9zXRbFSk16i+heRVNTPafp/boWcB1XF7s/Pr+jt6OGV4gYoYVdvkwdKzwBMf+ffQzreVhlIlnOEOcLCdVJf1CqAPrUA+UK/n7/ho0xySQ9j6CNE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
Thread-Topic: [PATCH v4 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
Thread-Index: AQHXMQ6SubMfZi/T90ypyknR3mHSW6qzy+WA
Date: Wed, 14 Apr 2021 10:14:51 +0000
Message-ID: <D94C1EE2-E8CA-4C0C-BCAA-737BC0A456C6@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-5-luca.fancellu@arm.com>
In-Reply-To: <20210414091404.14215-5-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9e096a-2a2b-4aa1-33bc-08d8ff2e2d5a
x-ms-traffictypediagnostic: VI1PR08MB3312:|PAXPR08MB7230:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB72306ACF9A04419A604220F59D4E9@PAXPR08MB7230.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o33uCDgEn/KfGVz24hHPK0lg9IQd6JzjjkIuYrSW6X3mIY9EmutSeI3ztzY4K+y3+p78+gUK7OydJvojX4LDT6vOUe+dDm4lDJ9R8uYUzDo0SHA2CLMLousguwvkjSfjaLpPwh5vqjaF+YF+YF9e+VnxsN9p9+1RjUxMAU2NcqIl3t/auwkYLLDXZz3jgwQKedpkK/h4SvyRvJqdJANeS0UiMp7yVIAPgoEWPVkFNovbMHTSx5+kMvssZkdHxHDtdwWYkKdMST8UJxAXayACR7v9AOTDmsv6++avyzdf+xs0jiZbKh6FADUl9dW095wG6SZnRxVgNDpTslFHAfjHG8nht98UaZS9HMb1UxeZLOOQtfPIx41ZALG60kHsH/ryxCURELP2E+AaX5HL4YPll3jPMkQ2XRw8aO8MBf29unQvQt7dgfP3RElIODt5b0Yt+A/6tN5nHSgNtthVdFciC5MizDtKj4YaFudXqdOn18mDMiFUZEgUsCoVKD30q4hXeodxOTD3J9A4Iv/wgLbPQLGFpLdzEHsI4MSJALtq0SQS+O1b4WvLD+WrYEtA32k8u/a4N01ZZKrogzsZXzBeHAaji3uldeMYqPcsQjJGtTugA20ir8Zvs3mKldKMfxYHql7geN7kvNDY1nCa7pZ3f+mF9e57MkEA1fwZThlvc+FlORLIS5i3BiNz+Zui9WrI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(2906002)(66476007)(66556008)(8936002)(316002)(66946007)(91956017)(76116006)(6512007)(37006003)(33656002)(6862004)(26005)(54906003)(66446008)(36756003)(6506007)(2616005)(8676002)(478600001)(83380400001)(64756008)(186003)(122000001)(5660300002)(6636002)(38100700002)(86362001)(71200400001)(4326008)(53546011)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?NhV8ayAazXxp0Q5FxTvqnG9TheqZwhbZbKJhRPmqMSWLQjzXeo1u2RX1emNY?=
 =?us-ascii?Q?Ff8AEZLU63YdNLBVlv+K55MZXhOnRoZFI4mJWeEsdZR2l9wedrZnXInaKOvi?=
 =?us-ascii?Q?k0v5H21qWn0agIfepUiXFGm/S0tgYKJL8RRYygtRng4LWqxLJfik2bWPwYcP?=
 =?us-ascii?Q?BVziTaKmAuodiSXjz6hUPkpVl8IrwStLg0JVo2EYJEDdRTs8inoZjULH3zEM?=
 =?us-ascii?Q?lInmhz8ojO01ZYvtowjPiiwULTU2uxbarlWYsmwdQhgrl13M8UBxmIAkS3J/?=
 =?us-ascii?Q?gOppnUI0lJQ9WtkvhdBeMR6hE3pSPXUee2wkH61MZa2R+1c4SlXAPNFMc2hl?=
 =?us-ascii?Q?XA8rPKv4qeY2Pr00o+1W4MKMcl38rDNg8jMNJu3aj/OlZuykMLHK++tBV4AU?=
 =?us-ascii?Q?EUhp5SEIOEoaZMXT/N8w5uy3yGfzI5ghW22r1pZuiQbqFXaSi2M8cvt16EVg?=
 =?us-ascii?Q?wlnxe0HO2A5Y1ptscEnNVaKQdJZ+wMqM5TELZVM8pqXnuJrJ8mrXjrPwx16d?=
 =?us-ascii?Q?82kIiPYhmT509Zq47U/T6ddrc/jSoO00ZxwVCTcP/cpepMZlZJBw3oLiaifU?=
 =?us-ascii?Q?k7vq1+/p+sniP1CS18N0mb8viVw8u+GEmzRXF1rlTw3BXNBELWHsgws8p3uV?=
 =?us-ascii?Q?s45Ko22EwsDzo16TsMSng2Ub1LVp4XTlSYESgd8rK5zuXOkttLIXMBORzlxd?=
 =?us-ascii?Q?A8nalFNgvzZ18n4s62rpdsGCEcBZpwI67H8sVk/tNfdpdKJUBVxPa65JqcCL?=
 =?us-ascii?Q?JBepyWgSQ/+b2nWN6FRaRZnbZTYJkIX/zzPT+d1pJ7sGzvj50fBtBBrfh1eq?=
 =?us-ascii?Q?wErRqcKWZWC266zqvHpUKsVl0fxvCfmZ+56Vg65tkmTEssUCdwY6IogYeY7g?=
 =?us-ascii?Q?lyNiDKFMuq+XvbQRW9KCgi7myRKGF7Bf7tZYmecYdZwC0DrW0GiNWgMAKWLd?=
 =?us-ascii?Q?F9kXtB2CBBB3rlK+9UwVCUr5rTaKmv7p337zpZNS6vC9q801mZKc09d92YKu?=
 =?us-ascii?Q?GkPXEvV3JsEfVzs5KSV3VUQa/L+IPaOVUpF5a8T6CBiVPaQVUWKMA8bJqF2n?=
 =?us-ascii?Q?vV32oiOaie+FGplNphmjXLNfAdSVc4cxYqYqYJ+Xe3LjyZZsPuxTEteoGj0k?=
 =?us-ascii?Q?yUEqTvL8v0kKM4LDceYgUBTEhMzSO3M9PPbwMWzgw8f6OYuy3rAvO4HeRSaI?=
 =?us-ascii?Q?mDtzjHAaWe6RCz6gIM28T/ql8OkzI5LA8u/CWejNPUjnto75PCE5LIfzy/Df?=
 =?us-ascii?Q?jRB0JXPLySZJfOPZPOaQjoPQyq8LlgQ7E9vv8vbYAO0KO1WKuT0N/BO/fkq1?=
 =?us-ascii?Q?i7aBJ1dntvxbL15l1ScNk+XQCDVJ71KqNd5Xw3CMAWqkRw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <620AB50392A74C478797748C2BA55CAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3312
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85507584-1e9b-40a8-66ba-08d8ff2e243e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+DzJ8Ggz7+za6rOWpPyBeEES2vtd4xs+md9QgXb6CvVDQqo3FByrhcOSW+0UfoxNEJyGymCDmgu0SuEloq9p6xCe7ROzkcUSl/uzYCp8J8q3hFaSI6P7AP2U1WfQecq4UlsX7NM/3upfs72C7pPWUGSoq/zpeGRFvxdj439NtC/xQ+sCMVMWIdKKZJ7BHJKeyWDhrlnSOBKP0Ld00hEgP98HcpSShmbP0KY1O92K4HPV/ibKGq93nSGNFDVhM+LSF7LZwLqU/pzDZjxMymMbPNOVIPfci1FpVSSa938iygYfkZEtT/yDjFsquv2qRVaVtNqU5dcuwIDCy+6ymAZpCz1IUsguV8LNc11ZqCOrRWtJHW72HO1OpxQzpEKUKXmF0RsoKYVmKRiVk3zVHdcCAxwjDMouMB3c+lRVRflMsP/1L+MEmkz2gEEu83dBfWIxwY+jHxhk285C/AAJ2MnIMqJ9v1yma6uLl10NEiTS8bmVcTlB0JM/6xW7bW8Rzq5DJhQhKlL0f+cLIqjAE8i2WnPDxw9qOUpwNeEkgK5xFv2nLR59WxI2AFyG5sI9RTfrFGZW3laWDtHXoAch2cCtNUDMcItFAbHfHqIpD9XBc2sPTUzdJke4QccYEOsMYO6+NyBYFYwIRsaX3UrpVpnJO11dW5q16jkcPiRc/JsSOz4HIhSQD9kjustOV6F4XbB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(2616005)(2906002)(70206006)(36860700001)(336012)(316002)(82310400003)(4326008)(70586007)(6862004)(37006003)(53546011)(6636002)(186003)(6506007)(54906003)(8936002)(36756003)(26005)(6512007)(8676002)(33656002)(107886003)(86362001)(478600001)(82740400003)(356005)(81166007)(83380400001)(5660300002)(47076005)(6486002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:15:06.6080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9e096a-2a2b-4aa1-33bc-08d8ff2e2d5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7230

Hi Luca,

> On 14 Apr 2021, at 10:14, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers,
Bertrand

> ---
> v3 changes:
> - Rephrase documentation
> ---
> docs/features/dom0less.pandoc |  7 +++---
> xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
> 2 files changed, 43 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pando=
c
> index d798596cdf..c9edb529e1 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/dom0less.pandoc
> @@ -16,9 +16,10 @@ Multiboot specification has been extended to allow for=
 multiple domains
> to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
> information about the Multiboot specification and how to use it.
>=20
> -Currently, a control domain ("dom0") is still required, but in the
> -future it will become unnecessary when all domains are created
> -directly from Xen. Instead of waiting for the control domain to be fully
> +Currently, a control domain ("dom0") is still required to manage the Dom=
U
> +domains, but the system can start also without dom0 if the Device Tree
> +doesn't specify the dom0 kernel and it declares one or more domUs.
> +Instead of waiting for the control domain (when declared) to be fully
> booted and the Xen tools to become available, domains created by Xen
> this way are started right away in parallel. Hence, their boot time is
> typically much shorter.
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index b405f58996..ecc4f0ae98 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -793,6 +793,38 @@ static void __init setup_mm(void)
> }
> #endif
>=20
> +static bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods =3D &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found =3D false;
> +    bool domUfound =3D false;
> +
> +    /* Look into the bootmodules */
> +    for ( i =3D 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod =3D &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind =3D=3D BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU =3D=3D false )
> +            {
> +                dom0found =3D true;
> +                break;
> +            }
> +            else
> +                domUfound =3D true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode
> +     */
> +    return ( !dom0found && domUfound );
> +}
> +
> size_t __read_mostly dcache_line_bytes;
>=20
> /* C entry point for boot CPU */
> @@ -803,7 +835,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>     int cpus, i;
>     const char *cmdline;
>     struct bootmodule *xen_bootmodule;
> -    struct domain *dom0;
> +    struct domain *dom0 =3D NULL;
>     int rc;
>=20
>     dcache_line_bytes =3D read_dcache_line_bytes();
> @@ -958,7 +990,10 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>     enable_errata_workarounds();
>=20
>     /* Create initial domain 0. */
> -    dom0 =3D create_dom0();
> +    if ( !is_dom0less_mode() )
> +        dom0 =3D create_dom0();
> +    else
> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>=20
>     heap_init_late();
>=20
> @@ -976,7 +1011,8 @@ void __init start_xen(unsigned long boot_phys_offset=
,
>     if ( acpi_disabled )
>         create_domUs();
>=20
> -    domain_unpause_by_systemcontroller(dom0);
> +    if ( dom0 )
> +        domain_unpause_by_systemcontroller(dom0);
>=20
>     /* Switch on to the dynamically allocated stack for the idle vcpu
>      * since the static one we're running on is about to be freed. */
> --=20
> 2.17.1
>=20


