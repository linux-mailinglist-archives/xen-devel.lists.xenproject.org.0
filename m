Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A373F24C4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169195.309076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuIr-0000Yi-TL; Fri, 20 Aug 2021 02:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169195.309076; Fri, 20 Aug 2021 02:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGuIr-0000VE-Q7; Fri, 20 Aug 2021 02:30:41 +0000
Received: by outflank-mailman (input) for mailman id 169195;
 Fri, 20 Aug 2021 02:30:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGuIp-0000V8-JW
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:30:39 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aa90014-015e-11ec-a67b-12813bfff9fa;
 Fri, 20 Aug 2021 02:30:38 +0000 (UTC)
Received: from AM6PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:20b:b2::18)
 by AM9PR08MB7291.eurprd08.prod.outlook.com (2603:10a6:20b:436::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 02:30:36 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::96) by AM6PR08CA0006.outlook.office365.com
 (2603:10a6:20b:b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:30:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:30:36 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Fri, 20 Aug 2021 02:30:36 +0000
Received: from 28d05513cb22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14172D55-1268-4FE3-8620-59D2B7F18C8B.1; 
 Fri, 20 Aug 2021 02:30:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28d05513cb22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:30:30 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1767.eurprd08.prod.outlook.com (2603:10a6:4:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 20 Aug
 2021 02:30:19 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:30:19 +0000
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
X-Inumbo-ID: 9aa90014-015e-11ec-a67b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HddaFCK3CI3FCr5H1XwicGOX81s2LCclFL5816nC6fs=;
 b=7JXMJKcuPIfVp5hp4R03lEUVHYtwtIjJSO5+FZwbBXBl07sUOzda4wBZlrYrcmOXk3uVqG9nwly6WreHnXQAGTc5cux/qro/L8qcYs8agquI4w/3atdZRREYdoJeCwTqFWtTAekwqOVz1h8Pc5ATQd1VYXXBaXp01tPH1BsqMbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysz4NYMbq9EAbW2Yk3HRTaJPbBnV8emLyFkwR6/p5558teSLunLcVJ6wjivlHB4DgYPhOBMIOEHKYxKi3gR80OqV8mgfphUy57ZCWwL4CB/pyN6wDEFapmZvopmxVDV0JxmM31pHCmjF03Zwtw4FdrKAQ6kW0rS5J9uP/8kpNrP+teQhA/zVXJ9SFzh/5ggIHh4DbL69No97fn9lrzgZ+FkRXax07rVi5SAg/XckyGcm4A4vjFs3oRezP4212KRCmo88+oXFGWcqKpE193jCO9TqZFuFTPbif3/JAQPmXa7SPGT7yNknOAPUXdbYbgUDFkI+A4OPUs2HwlPHM6YdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HddaFCK3CI3FCr5H1XwicGOX81s2LCclFL5816nC6fs=;
 b=PFSAnwTaWTeyB4jtIQVpeQ6pTNr+qYz7j423WzeE9/5i4l9/PQT73HZ7PBTH/TtFAJTCt4wAHqMWOQa/41+UeHvPvloCHm/L/xg9DTgyhlTByQ6BVAiTZBSLCxgRklrAHDusFdIrmnY98OsHLCnlLvI08sLUtvMyaDE1QDDV2JIG80gIC152PULyseS/KAuVV009HhUAibyTN0ylOHWq/MTlnT+fRQ6v22p6FjBg927m8hf+92iaOI4bs5qfj0BciZl9rFWrs5yPVn7vy7P646SWAArxHL0+EPEg0mtLJ2kn7/qdmEANARyXsbSuzCpAockf3cklg1Ypkc188YTPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HddaFCK3CI3FCr5H1XwicGOX81s2LCclFL5816nC6fs=;
 b=7JXMJKcuPIfVp5hp4R03lEUVHYtwtIjJSO5+FZwbBXBl07sUOzda4wBZlrYrcmOXk3uVqG9nwly6WreHnXQAGTc5cux/qro/L8qcYs8agquI4w/3atdZRREYdoJeCwTqFWtTAekwqOVz1h8Pc5ATQd1VYXXBaXp01tPH1BsqMbs=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig
 for arm64
Thread-Topic: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA
 Kconfig for arm64
Thread-Index: AQHXjps53Qsrm+WTv06/kg1OUu3sHKt64bkAgADV/ZA=
Date: Fri, 20 Aug 2021 02:30:18 +0000
Message-ID:
 <DB9PR08MB68571FFA0E971E3A60C588EA9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-18-wei.chen@arm.com>
 <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
In-Reply-To: <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BE68A6242F0E9846A7F9942D06D3580D.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0f537dba-812c-4b78-5354-08d963827e4d
x-ms-traffictypediagnostic: DB6PR0801MB1767:|AM9PR08MB7291:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7291C76D73C159D3998562789EC19@AM9PR08MB7291.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aM3nhNx/9FtHjpuThQD5HWYxAG5sDsXtyxvG6eUf4zlHWZTpJe40d0pjjSZ3OBaqi3UPW8k/Sv/2wYDH0OCTOueVKyabbWkY21EDyWzEBrm5/KvliTIXlwcrDyflgtUgCp6SWti5I+ius98xBwpkMmVDg+xz9L7VYeCmTto8MJ3kf93VCV7gbbLxGhymjDP51urQb/J7JMtfonGLUSoN7YTPpnnOqvi4XHPTg2/xf66kZQ2Q4P+VUXJze3u1kIXuFuE7s1aQK7iYDeNZQNKZWginIDUtxNis+aT4w/Perg9x/N+SVWJJOG6gqs8x0KgbG+/P+SSrh3O5KbsbQXMPjK0Z/tOhJb8AKikdq4Pi72Uxn2YasXwzXK4BVKYBCBEUOTwnc5QQlHV8taWQAiqAvKgpSmOjIByJ7qxZA5JXN/NXtbO1srzZooTXSwJd2sHxhYgYRamQx+i6YyOJF9S0zyLI+SgUF5VWrv+OANUq9IELj3DN/M7KWCPACctgcri520kiumw8LQZxmcpAtFfQympGUvhaTZcJo8T0O08d8EVxaT6yaIA/8N/+JNSABIyiGdUJMC5GI6QLpExuxKjm6Oc9RqF6j8JYiKI0NHMVMGA0RiIiuw/5Tmr+vjnP4gRojb3ptDuNv/untqaavFQNH1FNtvsGFHBhYc6Zih4APCqjsHJhjtNbl6hbQTO+mkcKK/ZG14rMijoyJ7AlFGlb/Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(64756008)(2906002)(66476007)(66556008)(5660300002)(66446008)(26005)(9686003)(478600001)(33656002)(83380400001)(7696005)(186003)(8676002)(8936002)(122000001)(4326008)(52536014)(110136005)(38100700002)(55016002)(66946007)(86362001)(38070700005)(76116006)(71200400001)(6506007)(53546011)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TExYSmI0RTJWNWRqd3JYZG1LWG1WVGZmSGxnbVUzMGpnYVd0aFhicDk2V214?=
 =?utf-8?B?Q25HbGREdENiKzFTSVZ3VGUyT1l4TWkxVzNEQ284ckd4ZFJ3UC85NU5oa3hF?=
 =?utf-8?B?enRwWXdjN1lFenNCcXVBdUR2cjdVU3FRU3pPRUU2anhWbHJhZ3BHWmw4dng3?=
 =?utf-8?B?ZTNZQVFGbmxaaE5NcXplSFNITzhJMzRIZHhxZDhPQlZTTlVSOGJqWUd2eWky?=
 =?utf-8?B?NU5xWnA1NXRBTzVaT3Nja1Q1MTZ5aFp1aEJxeDF2OUl1K0g5andxZ0ltKzli?=
 =?utf-8?B?Yy9PbkJPT2tSeXM3bFpGSHphdXBnOFZzZStvSWJXTFVmcFRzRWxuN2h2cC90?=
 =?utf-8?B?Q2JvTmN2T203aW52MTJLc0pLUmJvdUpWMGRZU1djNlgxUGhXd1hZeUtpWk1Z?=
 =?utf-8?B?NWJNcGJybjgwa1l6TklCZHd3ckRvQ1Vvc0hUNDdJYTFwTHN3cUNmb0NSSEwy?=
 =?utf-8?B?MXdjUk5yQ0hsVm5vSWhha2hKN0RlckQ1RlJKcmx3VWJNTkVTaUNNNnoxZ0tZ?=
 =?utf-8?B?NExxbC9ON2FBVVRTczRuVnpkM1dqNE14K25RMnJIWWtBYmZ1VmxiMHE0S2J0?=
 =?utf-8?B?T3ZUNkhHbE1lWTNVYU5NMGZZTngrdUxTaGVMMnQra3RVUTBuK1BMVG5nMjh2?=
 =?utf-8?B?dWJPWDhnZi93eG5oWWVvTlZnTzdzNGtOM0V5SjZpYk43UklLSUdVWTl0Zkts?=
 =?utf-8?B?Nk5GRHIzL3AxSERxK1UwVmlTRS9oaXdYK01JZi8wbmtFQmhseGJzTFNsaXZM?=
 =?utf-8?B?YmtUUzRaNUlGcVV5QzFRSktneDUzQTVrSkcwMHR1am9BMnU4TnZJajFkSzU3?=
 =?utf-8?B?MW5jVk5NYndZcXY0bVBNc2R0eDFLelBGN1ZSZklPVnVPVjdWTlFsQXBpSEZM?=
 =?utf-8?B?cW1JejNQSnZTSWw5Y2ZKRFZld0tPTjB5VHUwcVBveWFBWXhpVFVaWWpyNzZi?=
 =?utf-8?B?cmZIMjVEbUhMYkNIb3NLRlFtcjdYb1ByZ0hMOVpKRHpGTHJxWnM4QjY2dWp6?=
 =?utf-8?B?VGhkbjBQTngzS09YZjVOYTRrNzZET2pHTVV1SzVGWTJKVFhPV2JPK1pEN3hn?=
 =?utf-8?B?RjlQelprS2pTRHdRT1drTys4eTkxWklpYy9rR3dBQlQ5MjlFSlU1b1BCbFlZ?=
 =?utf-8?B?SWY2c0ErNlZUVzk1MmVtOXh4N25qZSs0TzdBRExHT2JZMXJ2TVdoc3VwcFdW?=
 =?utf-8?B?SHgrRWVkQVF1VVFGR3daOUd4VWJER1hMMHl4QmJaVm1tdHowNHphamhWc1Jj?=
 =?utf-8?B?WXJTS2lpRXFaSXR0MWpUNXhKQmFBS20wSmtsWDRuTTZkT0RoRUNUYS9SN3FP?=
 =?utf-8?B?Y1NaT3pNV2ZBN2R2d3BsOVNFdXFxd0JLaThLK2xQcFAwc0xLSmxmNzQvb3VO?=
 =?utf-8?B?T1VVMHJSTXdocEJseEFSTGhJL1U1V2swYjI1d09aOHZZRXdvN3NGZElZZ3Rs?=
 =?utf-8?B?RkpqbGJMWVZzWVg0NmpueWFIYU5EbUJXclZMVFRBSmQvYU4xeGRZVVFZZGVE?=
 =?utf-8?B?R3hxVHppL3ZGb0c0M0VmNW5lc0wwYWZETXVBYWVlK0NoMGlCRXRyK2lmOU5h?=
 =?utf-8?B?R1RBZ0l3MmlGU0oxK2FRYTFMdnB4L0FKRDc2ZFM5d0FDdnlLdlpVZktzeUxq?=
 =?utf-8?B?aWI2ZnhHSW9hRUNTYzhqOHZSYWZEK1pWWHA2YS9SWHJLSWE5Q3JkbmgydXI1?=
 =?utf-8?B?bWJXSGpoMVVtUFNPNkRWd1pHRkdYcllZWGMxNjRVL2w1WkwvYndsMEd6VnhH?=
 =?utf-8?Q?X4OaOrxYYLKvwaVS68nI8VgY2euuPuTxIIvwyIo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1767
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06361f04-d61f-46be-8db0-08d9638273de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9jBO0gdkVOm2sNUXpuJTfIcTrdpSQUSWOr4bz0WDHIYLdklhpZn54e2FhqDovcOznFXqJ4UjrH9ZmcPA0FzGlo0c/p5f0pEqEjlZEzS+zRzvGwwQwCtETx2p31D/wvo3EYb/4htlgYETP/H5QHnUKjT6Zbo844b/MuNJklPenCQ60lcyiMmgHbXIa89acubq80xpeh3V0muoF0nXjiqezTHWTkVRfCLJ/bHHIZefEcKNxcMBP1ZJw8NvoM1q7mK/EKFpy2J3Z6TpoMDgb/+QymsGBfgSHaqihqZFDD55chLP6pTAM3Z5IIqXu+WzfVOKjb2+qb8RcTfDbEfpqFa1KxY7Wg3X+rDQqd32+A9x3Bf5/gyIDoKlCtuIWlgTssvmClPpx0usNDHHMsEUcpvPf3/qBDA0c8b5sKeMpG4D1ObpKuXv234jmkeCsuSX0iBnhjveCjMVjAbUwyV/61nW0FleFqkftaBa7beVA0+csbhYYt+xvhHLhhvC5Atbq6EhjBtjaZgJVoqdRcsxpJxuVCCQYag69tjc7z884InAQRphWGL3ufwDGYqWA0qR7m3l04bLRuYW86N3slo/58JogoPe75o+Ir6yNrrYutnP8FUMKEhzJ+EVEC137MaBcJM2lG96aJ7HaJGdp05AWX5IOWpGnJ/YDQRV/QjOBnc0pg8/iLeggnlB2d8wcGjFByrCytDQiYrkeIZpisY+aoY9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(46966006)(36840700001)(70206006)(70586007)(82310400003)(336012)(52536014)(36860700001)(86362001)(7696005)(82740400003)(47076005)(83380400001)(2906002)(5660300002)(55016002)(4326008)(8676002)(33656002)(81166007)(26005)(356005)(478600001)(186003)(110136005)(9686003)(6506007)(316002)(53546011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:30:36.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f537dba-812c-4b78-5354-08d963827e4d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7291

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MzgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMTcvNDBdIHhlbi9hcm06IEludHJvZHVjZSBERVZJQ0Vf
VFJFRV9OVU1BDQo+IEtjb25maWcgZm9yIGFybTY0DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDExLzA4
LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFdlIG5lZWQgYSBLY29uZmlnIG9wdGlv
biB0byBkaXN0aW5ndWlzaCB3aXRoIEFDUEkgYmFzZWQNCj4gPiBOVU1BLiBTbyB3ZSBpbnRyb2R1
Y2UgdGhlIG5ldyBLY29uZmlnIG9wdGlvbjoNCj4gPiBERVZJQ0VfVFJFRV9OVU1BIGluIHRoaXMg
cGF0Y2ggZm9yIEFybTY0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5j
aGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyB8IDEwICsr
KysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
Zw0KPiA+IGluZGV4IGVjZmE2ODIyZTQuLjY3OGNjOThlYTMgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2FyY2gvYXJtL0tjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+IEBA
IC0zMyw2ICszMywxNiBAQCBjb25maWcgQUNQSQ0KPiA+ICAgCSAgQWR2YW5jZWQgQ29uZmlndXJh
dGlvbiBhbmQgUG93ZXIgSW50ZXJmYWNlIChBQ1BJKSBzdXBwb3J0IGZvciBYZW4NCj4gaXMNCj4g
PiAgIAkgIGFuIGFsdGVybmF0aXZlIHRvIGRldmljZSB0cmVlIG9uIEFSTTY0Lg0KPiA+DQo+ID4g
K2NvbmZpZyBERVZJQ0VfVFJFRV9OVU1BDQo+IA0KPiBUaGUgbmFtZSBzdWdnZXN0cyB0aGF0IE5V
TUEgc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBmb3IgRGV2aWNlLVRyZWUuLi4NCj4gQnV0IHRoZSBk
ZXNjcmlwdGlvbiBsb29rcyBnZW5lcmljLg0KPiANCj4gSG93ZXZlciwgSSB0aGluayB0aGUgdXNl
ciBzaG91bGQgb25seSBoYXZlIHRoZSBjaG9pY2UgdG8gc2F5IHdoZXRoZXINCj4gdGhleSB3YW50
IE5VTUEgdG8gYmUgZW5hYmxlZCBvciBub3QuIFdlIHNob3VsZCBub3QgZ2l2ZSB0aGVtIHRoZSBj
aG9pY2UNCj4gdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHBhcnNpbmcgZm9yIERUL0FDUEkuDQo+IA0K
PiBTbyB3ZSBzaG91bGQgaGF2ZSBhIGdlbmVyaWMgY29uZmlnIHRoYXQgd2lsbCB0aGVuIHNlbGVj
dCBEVCAoYW5kIEFDUEkgaW4NCj4gdGhlIGZ1dHVyZSkuDQo+IA0KDQpIb3cgYWJvdXQgd2Ugc2Vs
ZWN0IERUX05VTUEgZGVmYXVsdCBvbiBBcm02NC4gQW5kIERUX05VTUEgc2VsZWN0IE5VTUENCmxp
a2Ugd2hhdCB3ZSBoYXZlIGRvbmUgaW4gcGF0Y2gjNiBpbiB4ODY/IEFuZCByZW1vdmUgdGhlIGRl
c2NyaXB0aW9uPw0KDQpJZiB3ZSBtYWtlIGdlbmVyaWMgTlVNQSBhcyBhIHNlbGVjdGFibGUgb3B0
aW9uLCBhbmQgZGVwZW5kcyBvbg0KTlVNQSB0byBzZWxlY3QgRFQgb3IgQUNQSSBOVU1BLiBJdCBz
ZWVtcyB0byBiZSBxdWl0ZSBkaWZmZXJlbnQgZnJvbQ0KdGhlIGV4aXN0aW5nIGxvZ2ljPw0KDQo+
ID4gKwlib29sICJOVU1BIChOb24tVW5pZm9ybSBNZW1vcnkgQWNjZXNzKSBTdXBwb3J0IChVTlNV
UFBPUlRFRCkiIGlmDQo+IFVOU1VQUE9SVEVEDQo+ID4gKwlkZXBlbmRzIG9uIEFSTV82NA0KPiA+
ICsJc2VsZWN0IE5VTUENCj4gPiArCS0tLWhlbHAtLS0NCj4gPiArDQo+ID4gKwkgIE5vbi1Vbmlm
b3JtIE1lbW9yeSBBY2Nlc3MgKE5VTUEpIGlzIGEgY29tcHV0ZXIgbWVtb3J5IGRlc2lnbiB1c2Vk
DQo+IGluDQo+ID4gKwkgIG11bHRpcHJvY2Vzc2luZywgd2hlcmUgdGhlIG1lbW9yeSBhY2Nlc3Mg
dGltZSBkZXBlbmRzIG9uIHRoZQ0KPiBtZW1vcnkNCj4gPiArCSAgbG9jYXRpb24gcmVsYXRpdmUg
dG8gdGhlIHByb2Nlc3Nvci4NCj4gPiArDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxp
ZW4gR3JhbGwNCg==

