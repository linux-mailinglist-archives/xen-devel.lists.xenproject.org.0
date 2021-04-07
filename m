Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2EE3573A7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 19:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106876.204328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCMN-0003lw-GU; Wed, 07 Apr 2021 17:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106876.204328; Wed, 07 Apr 2021 17:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUCMN-0003lW-CT; Wed, 07 Apr 2021 17:52:59 +0000
Received: by outflank-mailman (input) for mailman id 106876;
 Wed, 07 Apr 2021 17:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L58=JE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lUCMK-0003lR-Sk
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 17:52:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86104592-dbda-4cb7-9983-b7a473c4f219;
 Wed, 07 Apr 2021 17:52:55 +0000 (UTC)
Received: from MRXP264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::18)
 by AM0PR08MB4481.eurprd08.prod.outlook.com (2603:10a6:208:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 7 Apr
 2021 17:52:43 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::43) by MRXP264CA0030.outlook.office365.com
 (2603:10a6:500:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 17:52:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 17:52:42 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Wed, 07 Apr 2021 17:52:41 +0000
Received: from e748ff116bf3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2D30D2F-DD38-4328-BAF8-A0F64CC8B0A6.1; 
 Wed, 07 Apr 2021 17:52:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e748ff116bf3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 17:52:30 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2552.eurprd08.prod.outlook.com (2603:10a6:4:a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 17:52:27 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 17:52:26 +0000
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
X-Inumbo-ID: 86104592-dbda-4cb7-9983-b7a473c4f219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yioT2oQUvK5WvIuU4k+PjiO2PwemmBYLpnx//Kj+fKE=;
 b=1CNMWjrGL9FxgGLhPzNdSHD6ljWoHi1x9Du0nsyK08YgaZmORNMT4jTHYIAhBnmN0v3jd6WDBkzcF4NKM1T+NWD3o4OJ44rsqp47k0o+a+FHT3/xMeomr2z9oBFe9FoY3eSPpnyDUJv6zuxaQnG90fiBNn5VsMKZbzn7JJEsf0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48af9176d1e61601
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvnqEiPAtLisednMN/7O66n81SMnE6CZtw+dpy551h3fM3vFgTQq2zzgg05m2m54XQ1u9h3JldZgIIO3Bbiq+27dfkaL9PyMUgmI7ZmoI0vPALY9r3mT2cIAs0HfvPaVcnNKfMEX2LI5nA/yuh5FS1Mn3WQtfL+2H9hJEBYzt9/r9F3jzXQ0u5/A9uv0QecKJJGuTv7MJ5x29QmgDG9qIex4IfShb76tzysSBvTOgxPwSKatXXA/kAmUsqk+wOQsaYmVZCwoNFaSt5TEnup8GJSjII5kE+U3yNWAVgXEFQ+o91o3BmQJegC2mT0PoJ0SSjGj2WcH1lLn3kl7Ux3jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yioT2oQUvK5WvIuU4k+PjiO2PwemmBYLpnx//Kj+fKE=;
 b=oDSU6If+nJp8EOiIaxKDPD7ZnzU3C691RqNqRCP1+LqlQjMA1aBpoPGBDU8diX04+8r9is9pb76QxuFasGtliyNzEpJt8yjOQzy0gL6qBrpxHErjTVzu2Abk0tgja+20sdRh3AdadgAay7L8oiUl5J46fYidxNB1j5EbMg7a0ZrNttSyEfsvLaWMlHmUW4Zuw/kyEk60bfuNulNVLgKph8IDCWKFyAoKBAbtng6swWijO6QfSjX45LhhNQGCASa5ibdpkHudjli6x4REeCxOWEWvuTzDFNbHo3nf8Ze/Qtes5ALgNC74S/zyzk5J8dnQqgEgrVwuHlUOsgnPbujiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yioT2oQUvK5WvIuU4k+PjiO2PwemmBYLpnx//Kj+fKE=;
 b=1CNMWjrGL9FxgGLhPzNdSHD6ljWoHi1x9Du0nsyK08YgaZmORNMT4jTHYIAhBnmN0v3jd6WDBkzcF4NKM1T+NWD3o4OJ44rsqp47k0o+a+FHT3/xMeomr2z9oBFe9FoY3eSPpnyDUJv6zuxaQnG90fiBNn5VsMKZbzn7JJEsf0s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Thread-Topic: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Thread-Index:
 AQHXKtnMgQfSb5EUJ0m5ImZxjYO+aaqniEaAgAAErYCAAAg4AIAAAtUAgAANswCAAbIjAA==
Date: Wed, 7 Apr 2021 17:52:26 +0000
Message-ID: <6593B520-538C-4422-80BA-DDDEBC2724E5@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
 <YGx3TsTlAuE9eQ7i@Air-de-Roger>
 <88704bcf-a06b-cf89-5fa3-0db94428f9f8@xen.org>
 <YGyFLIp8Ld0RjcoI@Air-de-Roger>
In-Reply-To: <YGyFLIp8Ld0RjcoI@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bc1898f9-52bc-4fbd-39b2-08d8f9edf144
x-ms-traffictypediagnostic: DB6PR0802MB2552:|AM0PR08MB4481:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB448181D597BD860B3A41819BFC759@AM0PR08MB4481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tTORihAFKtYnVNgqdhZ8tY27fkGsobSVG38kw0rJzksvypiCmDel6cGF4DqhzlFcApd9mtIFOVTurk6nnL20zA4f1d1j7Hjy2v6lVOwynk86QROC0VOlMvgxWLE1wOXnm/Iy+Hh3CxuJBbluJwtYinvk6d/w6k7W3FInE6OsN/H+27qIY7FYhbJoUSq6GwMUTmUMv74bOMQgs7ipc95nn8AHyp1kYoEyyHdXKemrXOj4201R2OvtQHU37FLtDfCFGazByEEzv6YMBherfFNWo213zqJDhMdMscQUXyFMZs5uVQEKrv3Ivx5a7FZ58iiAtJrxJGgqTHnJ91HulOCExAA/eu1t9lu573aA0w0dsZUO+aBzL6OwIR/58QsOBKRFSe8pyph2yibyppprdxjkFXvYq+VJjijrWQiTofyDkqNKGDfrBruxqc+WILANrEXcWGW5ai5m2ZxceHtltEGv2TPf90KclHn4gfct5VD13ON4ogHtdupvviiXCqEtjZo5uuAIyQtuB1X618b2FW8ExnWi/C8Yj1EZAGPsR5wLp6+mRUOiVqoxbHDeadKoqxrEPkpvhZ19aZfB/mi2yJ2NoKRvPhalXoAwNODCOpe/d93jNuJgJncWfljq/m3MaVjtQD00VaXpWEVyr0BAyhp5nj9oYiLFedRvGkDH8Ksotk/NPqcZCyPELCgRqHDyeITE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(316002)(478600001)(66946007)(4326008)(6486002)(54906003)(6512007)(66556008)(76116006)(64756008)(66446008)(71200400001)(91956017)(33656002)(53546011)(66476007)(6506007)(8936002)(5660300002)(7416002)(83380400001)(186003)(26005)(36756003)(2616005)(38100700001)(2906002)(86362001)(8676002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?QlR3aU0yWjd0d0hqcDcyeWtkNlEyU2lUb0ZaTkxycXRqaERVT2RzWG0xYk42?=
 =?utf-8?B?NjFSRFoyM1U3dTVNZm1XRlpZRkptdVJkdlZncEZCSlR0cGF1c09YR2pCK0dx?=
 =?utf-8?B?SUw0NS9TZ3I4ZGo5NllQNTZIZnNkamNISTNSUVZxU1pMczdLelpCWDJLQW5x?=
 =?utf-8?B?azBqQ1RDZm9TeVlYU0FGMW9BQUFSeU03cS9qRjg3dmFrYVFVMjQ1SGFrMC9D?=
 =?utf-8?B?VmJlaFdCb2lkdGI1SEVvTFF3eTJpQm5XSllWTlR5dzJNRC91czNpRi9oK2VU?=
 =?utf-8?B?VFc4aWxnZ1lGenBsYUFEdU1KYjdJNlNJbzAzcFo3b0wzRWdoTTFjdXNTYXhN?=
 =?utf-8?B?cXArUTFac2h6TFI0djhLZVpqNmFXdzBCM2NZa0VKWlI5R1ZXbGtSZ2IwMHJm?=
 =?utf-8?B?NVhBRkRtRjdHZlF3K0F3Qkhra3lvSlFha2tUQUFPTXhJSE5ITURScytQejF3?=
 =?utf-8?B?Sy92WlprNFdsbmx3Q1g4MG16cU1SL0U2SXRFQzF2RExQazVXekF0LzFwZGp1?=
 =?utf-8?B?bzFzMG1LU1hpaGpFdHJsa0t3ejNLcVNRbjMvWmVNYkQ2YWdaOXpCOFdlNlhv?=
 =?utf-8?B?a3dDMnBwMzB2Sjk3VzMwZHJSNGtiK3pibWR6RUhjMS9waVpSaGsxNFIvQjRq?=
 =?utf-8?B?b0dOeGNKbUpqU25YazBac0hiOWdJRVNEQnFpd2JpdnpDaG1UYU5GbS9oZVFx?=
 =?utf-8?B?ZHZYZGhKZGlnK0QyQk0rbFREaTBlOHREa3k3bkFqSndYRFAxZE0yY3NJSEtT?=
 =?utf-8?B?ckw0WUdPNm1uZ2c4SXdsdXppU3U5M25jeUptYlY4WllEMFBXNlBmNmdjSTdH?=
 =?utf-8?B?Q09NdmhLcWlQSkJyT0RjbnZCTGlWeXVtZjlxZGhYNCtwK2xVRmpzaGoxWllo?=
 =?utf-8?B?OTU3V1k5OG40Y1M1RFVRRS9YUG9NUkJLdXJZamhvcGhadUJmdnB0T0ZNbWJp?=
 =?utf-8?B?dWZkVjVZeUFzNWFnV0F5UjMzQ0dJNUo4UXNVclJHaDU4Um5IVlg4QnFKdDUy?=
 =?utf-8?B?cTdjclBIN1ZhRDliMEt1cVBCRVZ4aFd4ci9CVnhVM1VmYXJ5dFJyc1MwT0Nz?=
 =?utf-8?B?YnVpRWdiMUo3aDRab240NWJaQi9CclJuSUp3SG0xSG1Zd2M0Q1JtWnlicVky?=
 =?utf-8?B?NzJVTFNab2d6Vk02VXVLU0NLazR6LzVGUnNuS1p3am9uMUJWYk5wRy84YzRM?=
 =?utf-8?B?SjNPYzRxSWpacUw1N2xkbWJnYlVBQjFnQlhuTlZrbUxBZjBQWDdYbUFDZkhU?=
 =?utf-8?B?MWl5VUIwQXBUOXlHd2gxQ0lFRS92dUpXM2o5NXpoRmowUU1ySU5WVlB5QS9m?=
 =?utf-8?B?ZDI0Nm1VUDdrcDRXZkYxTFFLWXo3WUNkTEdSL0xiTlZHblh4SEZLZkpMTkJq?=
 =?utf-8?B?MkZxV2ZlbnlDZUNXb05sNHN2OHpldTZhYnBXT2ZBWmZ1eGRReWxHMExJNnJM?=
 =?utf-8?B?dWh1TTBoekk4dU1uZnY5MFVLRjJkcG1ha3ZuLytlQlhLNWJBUGRwaWFOL3ZB?=
 =?utf-8?B?STZMb0hlY0Fpc2s4aVZMNE15dXc4V2JxYldtOEZqYmlhblJJQzBuNGZLa3hw?=
 =?utf-8?B?MWFhVTRicUV2R2p4bGgzMmE3WEhDYXNLMkdiM0tMWFZkUC9UVS9rK05lRWFo?=
 =?utf-8?B?SFBxZ3QxcG92clU5QlVZbzAvNXNsUktwa2tGQUtWb05RcFNHQXlZdlBUMlJK?=
 =?utf-8?B?YmJCdHVWaEF0Y1R6a0VpZDZIZlZWdThoZkJtZUhMM2pKZXdhQkU2ZWdyTVFx?=
 =?utf-8?Q?KvNYwFXe59LgAfbakB4aVdgFiFjlXiSHeIAy5c1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <021232F41C285C45BFD2DA4F7D297CB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2552
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab7a5ade-8412-4b72-e5b0-08d8f9ede81e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wRBsZfwWchCABxRSoTV24eT7x3u5OhGWn2Kp8WT2LbZ1odqKb21HS4YKHqLdYEivp2B/kx/B5wlzPovB2ztRIyCyDOnHTj7di+kN32s67k500Eo3ZO8Rlily/xltQPYZDeXt2eTWwO8DDZ/NVWUOI6VltatrVUillEyvmjjNvXdbZ0P/idMWGfOOIlmVey46dLrlaKfzv27dlCgYGeZuHsV7x5sA10lnuLo9XQ03NLdwfmlp5xM3Nx5AYLpCI5lu4j1nsFTK8SX7LdIk8dTNxBcfd71bKprjLYSGXQoInt93AlhXdB4oevajCNT5dwkrRnhW5CVlEESW44wndsdZxK6DbuQVl5rlniqa5PCo/4ekp/DlhdvqLexoE0nUNOwcYp2YQ9JfugZuWPZRPvid/Oij+PKgW8P+v1C9Olw74WTaOGcGLsJRCbiia8XFnuEf7tB1f1lj2SXx7nAewkK5/s0QmmnHr4VtlT/tvdQ+qVFmGcdwuge2V4raTN0guCwCzOpPMmi2YaSE8t/+vclAqoGiuDyJpIU9J7Pm8lLmainV6pamuN5QJSEAngQicrg25AEAQQJNnIPdnLz/WQUtwv9ghP+VGGUztgD2uLV9XnBQ9EpNHdjyAhEF8zrZze096n/7/BYThQrmczRxEskp2cehtAw/KjnPt1EbLNG6NZs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(8676002)(478600001)(5660300002)(8936002)(6862004)(316002)(86362001)(26005)(186003)(36756003)(47076005)(82740400003)(70586007)(6486002)(82310400003)(53546011)(83380400001)(356005)(6506007)(81166007)(6512007)(336012)(2906002)(36860700001)(54906003)(2616005)(70206006)(33656002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 17:52:42.1461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1898f9-52bc-4fbd-39b2-08d8f9edf144
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481

SGksDQoNCj4gT24gNiBBcHIgMjAyMSwgYXQgNDo1OCBwbSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQg
MDQ6MDk6MzRQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gDQo+PiANCj4+IE9uIDA2
LzA0LzIwMjEgMTU6NTksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVHVlLCBBcHIg
MDYsIDIwMjEgYXQgMDM6MzA6MDFQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBT
byBJIHRoaW5rIHdlIHdhbnQgdG8gYmUgYWJsZSB0byBjb21waWxlIG91dCB0aGUgY29kZSBpZiBu
b3QgdXNlZC4gVGhhdA0KPj4+PiBzYWlkLCBJIHRoaW5rIHByb3ZpZGluZyBzdHViIHdvdWxkIGJl
IGJldHRlciB0byBhdm9pZCBtdWx0aXBsZSAjaWZkZWYgaW4gdGhlDQo+Pj4+IHNhbWUgZnVuY3Rp
b24uDQo+Pj4gDQo+Pj4gSSB0aGluayBwcm92aWRpbmcgc3R1YnMgaXMgdGhlIHdheSB0byBnbywg
dGhhdCBzaG91bGQgYWxsb3cgdG8gcmVtb3ZlDQo+Pj4gdGhlIHVubmVlZGVkIGNvZGUgd2l0aG91
dCBoYXZpbmcgdG8gZXhwbGljaXRseSBkcm9wIE1TSSBzdXBwb3J0LiBBcw0KPj4+IHNhaWQgYmVm
b3JlLCBJIHRoaW5rIGl0J3MgZmluZSB0byBwcm92aWRlIHRob3NlIHVuaW1wbGVtZW50ZWQgZm9y
IEFybQ0KPj4+IEFUTSwgY2FuIGJlIGZpbGxlZCBsYXRlciBpZiB0aGVyZSdzIG1vcmUgcHJlc3Np
bmcgUENJIHdvcmsgdG8gZG8NCj4+PiBmaXJzdC4NCj4+IA0KPj4gV2Ugc2hvdWxkIHJlbW92ZSB1
bm5lZWRlZCBhbmQgKmF2b2lkKiBhbGxvY2F0aW9uLiBQcm92aWRpbmcgc3R1YiBmb3INCj4+IGV4
aXN0aW5nIGZ1bmN0aW9ucyB3aWxsIG9ubHkgYWRkcmVzcyB0aGUgZmlyc3QgcHJvYmxlbS4NCj4+
IA0KPj4gRm9yIHRoZSBhbGxvY2F0aW9uIChzZWUgYWxsb2NfcGRldigpKSAsIHdlIHdpbGwgbmVl
ZCB0byBtb3ZlIGl0IGluIHNlcGFyYXRlDQo+PiBmdW5jdGlvbiBhbmQgZ2F0ZSB0aGVtIHRvIHBy
ZXZlbnQgdGhlIGFsbG9jYXRpb24uDQo+PiANCj4+IEl0IHdvdWxkIGJlIHdyb25nIHRvIGdhdGUg
dGhlIGNvZGUgd2l0aCAjaWZkZWYgQ09ORklHX1g4Ni4gU28gSSB0aGluaw0KPj4gUmFodWwncyBp
ZGVhIHRvIHByb3ZpZGUgdGhlIG5ldyAjaWZkZWYgaXMgY29ycmVjdC4NCj4gDQo+IEkgdGhpbmsg
YWxsIHRoaXMgbmVlZHMgdG8gYmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRoZW4sIGJlY2F1c2Ug
ZnJvbQ0KPiBteSByZWFkaW5nIG9mIHRoZSBjdXJyZW50IG1lc3NhZ2UgaXQgc2VlbXMgbGlrZSBN
U0kgY29kZSBpcyBvbmx5DQo+IHJlbW92ZWQgYmVjYXVzZSBNU0kgc3VwcG9ydCBpcyBub3QgaW1w
bGVtZW50ZWQgb24gQXJtLCByYXRoZXIgdGhhbiBBcm0NCj4gbm90IHJlcXVpcmluZyBzdWNoIHN0
cmljdCB0cmFja2luZyBvZiBNU0kgYWNjZXNzZXMgYW5kIE1TSSBpbnRlcnJ1cHQNCj4gc2V0dXAu
IExpa2VseSB0aGUgbmFtaW5nIG9mIHRoZSBvcHRpb24gbmVlZHMgdG8gYmUgYWRqdXN0ZWQgYWxz
bw0KPiB0b2dldGhlciB3aXRoIHRoZSByZWR1Y3Rpb24gb2YgaXQncyBzY29wZSB0byBzdHVmZiB0
aGF0IGV4cGxpY2l0bHkNCj4gbmVlZHMgdG8gYmUgcmVtb3ZlZCBpbiB0aGUgcHJlcHJvY2Vzc29y
IG9wcG9zZWQgdG8gYWRkaW5nIGFyY2gNCj4gc3BlY2lmaWMgc3R1YnMuDQo+ICANCg0KDQpUaGFu
a3MgZXZlcnlvbmUgZm9yIHJldmlld2luZyB0aGUgY29kZS4NCg0KTVNJIHJlbGF0ZWQgY29kZSBp
biB0aGUgInBhc3N0aHJvdWdoL3BjaS5j4oCdIGZpbGUgaXMgbm90IHVzZWZ1bCBmb3IgQVJNIHdo
ZW4gTVNJIGludGVycnVwdHMgYXJlIGluamVjdGVkDQp2aWEgR0lDdjMgSVRTIGFuZCBhdCB0aGUg
c2FtZSB0aW1lIHRoZXJlIGlzIG5vIHBsYW4gdG8gc3VwcG9ydCBNU0kgaW50ZXJydXB0cyBmb3Ig
QVJNIHdpdGhvdXQgR0lDdjMNCklUUyB0aGF0J3Mgd2h5IEkgdGhvdWdodCBpdCBpcyBvayB0byBj
b21waWxlIG91dCB0aGUgY29kZSB3aXRoIHRoZSBuZXcga2NvbmZpZyBvcHRpb24uDQoNCkkgZGlk
buKAmXQgcmVhbGl6ZSB0aGF0IEhBU19QQ0lfTVNJIG9wdGlvbiB3aWxsIG5vdCB3b3JrIGZvciB4
NjggaWYgc29tZW9uZSBkaXNhYmxlcyB0aGUgSEFTX1BDSV9NU0kgb3B0aW9uIGZvciBYODYuIA0K
SSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBNU0kgZnVuY3Rpb25hbGl0eSBhbHdheXMg
YmUgZW5hYmxlZCBmb3IgeDg2Lg0KDQpJIGFsc28gYWdyZWUgdGhhdCBoYXZpbmcgdG9vIG1hbnkg
I2lmZGVmIGluIHRoZSBjb2RlIGlzIG5vdCBnb29kIGFzIGl0IG1ha2VzIGNvZGUgaGFyZGVyIHRv
IHJlYWQuDQpJIHdpbGwgdHJ5IHRvIG1vZGlmeSB0aGUgY29kZSB0byBhZGQgYSBzdHViIHZlcnNp
b24gb2YgdGhlIHVubmVlZGVkIGNvZGUgZm9yIEFybSBhbmQgd2lsbCBzZW5kIHRoZSBuZXh0IHZl
cnNpb24gb2YgdGhlIHBhdGNoLg0KSSB3aWxsIGFsc28gbW9kaWZ5IHRoZSBjb21taXQgbWVzc2Fn
ZSBhY2NvcmRpbmdseS4NCg0KUmVnYXJkcywNClJhaHVsDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIu
DQoNCg==

