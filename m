Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666236BF4D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 08:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118008.223938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHE8-0004bV-DT; Tue, 27 Apr 2021 06:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118008.223938; Tue, 27 Apr 2021 06:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHE8-0004b6-9u; Tue, 27 Apr 2021 06:29:44 +0000
Received: by outflank-mailman (input) for mailman id 118008;
 Tue, 27 Apr 2021 06:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cl93=JY=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lbHE6-0004al-2B
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 06:29:42 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 273f6daa-7ec0-4408-b0f8-cdf0bf88804b;
 Tue, 27 Apr 2021 06:29:38 +0000 (UTC)
Received: from AM6P195CA0032.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::45)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 06:29:36 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::c3) by AM6P195CA0032.outlook.office365.com
 (2603:10a6:209:81::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Tue, 27 Apr 2021 06:29:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 06:29:34 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Tue, 27 Apr 2021 06:29:33 +0000
Received: from 0f1bfd6ecc37.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAE6AC4B-45E6-4F4E-A733-EC4656B7AEBC.1; 
 Tue, 27 Apr 2021 06:29:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f1bfd6ecc37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Apr 2021 06:29:27 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 06:29:25 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 06:29:25 +0000
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
X-Inumbo-ID: 273f6daa-7ec0-4408-b0f8-cdf0bf88804b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb2FS5OzopljNYnTWSRHtMTkg6OcRK5aJZQwsHUkLK4=;
 b=lgxPZfDvcmdnnUlA1ZJVWBC9mtDXkowZeeWzko3RkRXwjsK03+prWzvJ+NF+sTw+Ek8dVgFvf0QWRhGjJVv5Aw0ZcDUoXZ1fSt5RQ3hfc/La90bw4ZCA4vzHEEdTmcuyh+PH26Xjemc0tDWNB44s0j8MtdsF8FcUN3i/wgV4VY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9dYftoizxSnHzsQvhjkUgwCWg0HDEVMAzqicsqUrxbUa7bvJ/PpNDri5Jb/Ov6WAOwfQhrICOC56nzRs4A/Bt9d95fsDYpwPuc0ZMFInGkUORiA+fGtQO9Bhz9ihoMmxr6xJrrjJCooUHeZ17UKypu5QT2u+q85fYuR/v0Hef7LI9rApUR2SendcFER3Yfucz//CR2oAdB5ycDF3p4Cmj0fOwHwfQ+bK7JCfKF5HCRdJvECNzZaVULGPtcNwnylZYmaDTfZwi1zZ4L339CcY6Z6d+xd6KypZKz8fnR2DOWAGso6NiIWzHSMNJSK8f1DGLA5X+jkshbu0SwjrwP09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb2FS5OzopljNYnTWSRHtMTkg6OcRK5aJZQwsHUkLK4=;
 b=ToZNZFamBCVlJXratRqptaQRnglpA0pXH8w/p0LRiOUi0oAbsSSxF1TI7jZUM4r56IoPmKoBxWtRxx5gvHKhMvPoPT6xvVPMYYS9CKUWryF45f+V+OoIjKZElcvfPFESHRNVZP1MygtmtrxpbhFEMghGXOGEPPGG2awJGAfPgs+t4a2rqmycGOYZ53m2098PVOcrGafrfh7KqJ3ib4BUD+OOUgcfSR8SBsaN9oQazWLDYJspYgTzZbRSkQJBSOXqbBQljzjlhioDVrGvsBxQ5tL3qblWn1Yp/EOPR5mHUw572G0POqvxFqRXooq53sFJXWR/yfX6o7y/OXyfBRFbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb2FS5OzopljNYnTWSRHtMTkg6OcRK5aJZQwsHUkLK4=;
 b=lgxPZfDvcmdnnUlA1ZJVWBC9mtDXkowZeeWzko3RkRXwjsK03+prWzvJ+NF+sTw+Ek8dVgFvf0QWRhGjJVv5Aw0ZcDUoXZ1fSt5RQ3hfc/La90bw4ZCA4vzHEEdTmcuyh+PH26Xjemc0tDWNB44s0j8MtdsF8FcUN3i/wgV4VY4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index: Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyA
Date: Tue, 27 Apr 2021 06:29:25 +0000
Message-ID:
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
In-Reply-To: <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 006D80AD84100F4A8251E9F822F611E5.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c01cbb24-225b-4f0b-7cd4-08d90945d2b9
x-ms-traffictypediagnostic: PR3PR08MB5723:|DB7PR08MB3387:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB33873DFDF5989F1942F30D8D92419@DB7PR08MB3387.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ycfWYfwSuNfzUa94m3OUclrZTzCqo106N5ijAvA73W9etdIqaXpqC4e0HXpQeBDO6kUg9un1un4bgcCB1YWwXjRP/kYLT5Rtt0ebwqmVoYJz95UgQaz1I0CmkfikUXBAniX/CWFiDfsG1kt+vDiuFLIKWICawlQ7lWCN9n1MprHGWxNJ0kVnHKYefs++pGZTHLkrEv81Qz4EIJ6F7MAOTv7nACx+jt83TEFjstWu3HIcC22WTP2w0IiU3teZQMILdB92FCw1Xwhj1T6ckBnj+8V56Du27pisvqWavUYrpS/+H/ug6cnzvklPA9gcVjWai/ozys+lARs3RbnHRt+vz7X3wvVXKKX+AnA03+/hj3dL0QmtYzTLpWd2qXfNuhLdkSys67tJf6Bre8a7qLglE+mF914+sXfet2Fy6b0XCUNdhh+Q2BdCG95MUyMDSkYbSP3MHiBQZH5pBCM10SguMC70pnRDgkVnU/IBu43auHS01MdQW5naiFF28wtDNXWeKFJQWYJcA0ZomgPmkoVmHWWK3MgsMLwN7aeYEV7ZoGY8ySGSi+ikK/5Clxcd4AMQJ1rkfEcKGXcEsxCbPLcfwnL33msJZgJFQbuYhC5vRrBg2qLyJ2ORFWBBBSVaaUQXisYg5220dQJ716xBLwdIYkcHhWPYzY6gIBMROASEXQDAjANpBfeKzLL0JrxM1a0G
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(9686003)(55016002)(5660300002)(478600001)(52536014)(110136005)(2906002)(966005)(122000001)(53546011)(7696005)(316002)(33656002)(76116006)(38100700002)(66446008)(186003)(66946007)(4326008)(66556008)(26005)(54906003)(66476007)(64756008)(71200400001)(83380400001)(8676002)(6506007)(86362001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NlBDc1ZJS3d0T0wzaDQzc3EyK2JlY0tQSzl0bXFjb0JIUmJLL3dNMjFnV2xG?=
 =?utf-8?B?WkdKUEFKOTBVSDRkcFA2cEtmell0b0s2cDBCOWNBQmptVE5nNVpZTTVFK0xv?=
 =?utf-8?B?LzFEY1ZzdXozZEtDUmFObHVwSStvYmZzNTZaSTc0Wm81YkFQWGZ3Tjh6Q3Az?=
 =?utf-8?B?MDQ3Y2FrN1NoUExpRndXdjBDdnV6VFZNNnlqNVNTaXAzcEFJcDBPMnFrRzVR?=
 =?utf-8?B?ODlTUlVnSWRFTnpGRmIxVWg5UmgyUDg3M1dQYVpJUjBsOUp4b2o2R1lmaVhH?=
 =?utf-8?B?SFptMHFhaGJjcjlJMkowQ1pyMllWbDFZVVUxb3pRc2RyYVMzRnFna2o3d2RV?=
 =?utf-8?B?Q3QwYkxZUWxFcW9sY2k2OE93NzNLYkhtUFdJNHRKNmVKekhkT0c4bjBZYm1r?=
 =?utf-8?B?eTV5REM4QmU2MTgrYzliVUlJV21FNU8zdVlDOERkdFU1bEpJbUxxSXI1NDNr?=
 =?utf-8?B?cytTdlNicGV5Mm8waE1ZMDFlWmJXV1pobmxrMDVFbkhINi80dDAvMHUwTENN?=
 =?utf-8?B?cXI4QXViek91R1pQOVZUQit6SVY3bjVJK1k4WTYzWUI2NjZUK3p3dVk3K2o4?=
 =?utf-8?B?b1k5NXNhYnpob2JZNW83UWNiaW4wQm1WcTRGdzRaZ0MzdHc3ZzNqRmt2NUdy?=
 =?utf-8?B?U1ROdEtONTgwOWY0SnpCbUh6L3pLOXIwZXZjcVhlTFhyT04zYWc2NHg3Smkw?=
 =?utf-8?B?SW44ZnQrWXArUlJjY1U0RW5MTTI3NkZZdHIvS3g0MUUrUzBSRkMwemIvaHhl?=
 =?utf-8?B?TmVoV05kNzlqQ3h3b01obUs3SlR5dWc3SExFWFZsU09XQ0FkUVVxZ2tXWkVv?=
 =?utf-8?B?MFp1TC8reThQMTJ0T1dRTW9wcDRKVnJQeTRoN3pnbmJ3RVE0UUZrajY3VzV2?=
 =?utf-8?B?bnZNZXIrT0l0WjI3b0tDQkNZZ01hWTdTN1NXdDkzemhGSXZNbFoySmR4a1o0?=
 =?utf-8?B?VXlNdjduT2NXcTRoQkhKWTB1dVlFZTJSZjFXSTFZMlBZSVRLOXZsRzlPK3pq?=
 =?utf-8?B?SEUwa1lSMnd4OHBReU5nR0xvR1h4Z1VqZTB1WXdad2tVTTBiRXZHSDB2bTBS?=
 =?utf-8?B?ZEI2MUpVS2ZuK3Y4OUtkTkdYWlFnZHBXOWZvWjlicm9lUHY4MzR6N2VkenAx?=
 =?utf-8?B?NDhkWGNybVVsVmdlOXZoYmx1QlRyRGhnc1FGK2VaSWxDaVBaTnNIYzh4VFJN?=
 =?utf-8?B?ZjBCYVVNZ0N3SG5ISkM1K1Vzb2c0d1BYVlFCUFlNd05jQ0JhU3pDYmdJVjlJ?=
 =?utf-8?B?L2JOZUd6SDAyQ3ZONE9ZbTJlOGhuMUY3L0JEOFk3M0QyWmhiaGM0SlQyNXJW?=
 =?utf-8?B?eXZhTU1IUzVhWk1PS1lxdmRLTlR0RlVhQ3J0S1E1cVFmWCt3YzBnZG5kelNy?=
 =?utf-8?B?UzR3Vk1vcENLeDhPWFRGbkFEVmJKNUNoNG11NzVhVUtSRnlwVzFKQ2hGRG1V?=
 =?utf-8?B?RzRuSnA4ZVQ5eThsUjBSaE9rQTczOTBZa3hva2RQNFF0aExaUytHTmJTUTdY?=
 =?utf-8?B?bExIaUJRZnllM0wrelNydmhiRUpvdG1PSTJ2THFoWS9PcTlYb3JJWDNiVDZC?=
 =?utf-8?B?MHM3MldTMzRzd0cwR2l1Zm0zUEtOUzdHY1BmZU9PZnpqVG9tTzFMV2QraTVv?=
 =?utf-8?B?eVg5enhDamgzWGNWL2V4MUZaSjNsYjN3eHJoZ2lPb3prVUIxVlFyQUdVWUhv?=
 =?utf-8?B?ci8vNi9oQ2V2K0lRL1pPZEVEMW5zSEpSWTZGWnRJSzhXcWU0M0RMNHQ5c0NX?=
 =?utf-8?Q?GwNRyyL0RT7Hvov42jKcrVe70MH4LhhG2jComnv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7cc45ca-0d50-48d5-ca22-08d90945cd5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IHXbaAzJ7C4BW0GAbzyO5+5TOKgwPQ3tp300GmpTjcW4Qdrj43LN1IACItyg06fuKWqXilYUzdIka4HHdRh6slATtfqVBGMC//pHPuzWYIlIJ8NB2w4JIcGhz/gz3FNChYawkneaFyxynztNhQicbAg2bSJZaNNTdhNqJMQM2lwIYLpU5Y1paRrXyYgLmQWqd+vRgSHEjDcFX5k7iqKNlFA6WaR+UflPc2lNf+s0xG4sFQFVc7SMwWJmlifyYqvI6oB2bg/s+wyVExmSdJP1T89o3AQHCGZ1AWSCeEGijzm0Eq8z15sNf4XoiNXOWBe7L6FyC73CkdTRgoef32GufvGwFvqbKEu4OO9kuosqPL+clu+jk3b9UXhxM8w/i+BNCN6fRoJcqSUUiVEo5hDk1r2V4lWwuNRLnCT8U9TgPMpfZqdp+SA4fFMd9X7xYGIDyw1fN5PSj148fXiWEswMuiKX56/bEngF2kGAF4ivML7c8iF+Xzafwy3bhvROGN17mD2A9V+EBsOXqQA7Jo2bOmCovYkJRANCGXFsavaD1gRzEgGEnaI/ldDmQI9WBM2C3r/8QYKb8Y+zs0mkvgwsmGCDHgze2D56T4E9mQ6NQ0dPkfbc7XoGwAZWoQkZM9KXUEtU114YF1HWMVtvivfig9WrpgeivIjLD07ewDAsKotChK6vMbAplHgHUhFxxCsrXSnM5LJvzW/L9E+XdI+xKu/TbJSoitf5lrJ/YPrUIWSi/rjRi9RERV3sr+AKWnpAVgBK+Ryj2uDXKzDLQbHu9tXkgdRGc/dGqkNejxgLMts=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(4326008)(9686003)(54906003)(5660300002)(81166007)(316002)(966005)(110136005)(8676002)(336012)(356005)(36860700001)(70206006)(47076005)(70586007)(8936002)(186003)(52536014)(7696005)(83380400001)(34020700004)(33656002)(26005)(6506007)(82310400003)(53546011)(82740400003)(86362001)(55016002)(2906002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 06:29:34.1751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c01cbb24-225b-4f0b-7cd4-08d90945d2b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387

SGkgSnVsaWVuLA0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkga2luZGEgbWlzc2VkIHRo
aXMgZW1haWwgc29tZWhvdy4uLi4NCg0KUGxlYXNlIHNlZSBteSBpbmxpbmUgcmVwbHkgXl4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVsaWVuIEdy
YWxsDQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjYsIDIwMjEgNDoyMCBBTQ0KPiBUbzogSGVucnkg
V2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgeGVuLQ0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFy
bS5jb20+OyBQZW5ueSBaaGVuZw0KPiA8UGVubnkuWmhlbmdAYXJtLmNvbT47IEJlcnRyYW5kIE1h
cnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IERpc2N1c3Np
b24gb2YgWGVuaGVhcCBwcm9ibGVtcyBvbiBBQXJjaDY0DQo+IA0KPiANCj4gDQo+IE9uIDIxLzA0
LzIwMjEgMTA6MzIsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkg
SGVucnksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDIxLCAyMDIxIDU6MDQgUE0NCj4gPj4gVG86IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNv
bT47IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IHhlbi0NCj4gPj4gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgUGVubnkgWmhl
bmcNCj4gPj4gPFBlbm55LlpoZW5nQGFybS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBEaXNjdXNzaW9uIG9mIFhl
bmhlYXAgcHJvYmxlbXMgb24gQUFyY2g2NA0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMS8w
NC8yMDIxIDA3OjI4LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+Pj4gSGksDQo+ID4+DQo+ID4+IEhp
IEhlbnJ5LA0KPiA+Pg0KPiA+Pj4NCj4gPj4+IFdlIGFyZSB0cnlpbmcgdG8gaW1wbGVtZW50IHRo
ZSBzdGF0aWMgbWVtb3J5IGFsbG9jYXRpb24gb24gQUFyY2g2NC4NCj4gUGFydA0KPiA+PiBvZg0K
PiA+Pj4gdGhpcyBmZWF0dXJlIGlzIHRoZSByZXNlcnZlZCBoZWFwIG1lbW9yeSBhbGxvY2F0aW9u
LCB3aGVyZSBhIHNwZWNpZmljDQo+IHJhbmdlDQo+ID4+IG9mDQo+ID4+PiBtZW1vcnkgaXMgcmVz
ZXJ2ZWQgb25seSBmb3IgaGVhcC4gSW4gdGhlIGRldmVsb3BtZW50IHByb2Nlc3MsIHdlDQo+IGZv
dW5kIGENCj4gPj4+IHBpdGZhbGwgaW4gY3VycmVudCBBQXJjaDY0IHNldHVwX3hlbmhlYXBfbWFw
cGluZ3MoKSBmdW5jdGlvbi4NCj4gPj4+DQo+ID4+PiBBY2NvcmRpbmcgdG8gYSBwcmV2aW91cyBk
aXNjdXNzaW9uIGluIGNvbW11bml0eQ0KPiA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVu
LWRldmVsLzIwMTkwMjE2MTM0NDU2LjEwNjgxLTEtDQo+ID4+IHBlbmcuZmFuQG54cC5jb20vLA0K
PiA+Pj4gb24gQUFyY2g2NCwgYm9vdG1lbSBpcyBpbml0aWFsaXplZCBhZnRlciBzZXR1cF94ZW5o
ZWFwX21hcHBpbmdzKCksDQo+ID4+PiBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKCkgbWF5IHRyeSB0
byBhbGxvY2F0ZSBtZW1vcnkgYmVmb3JlIG1lbW9yeQ0KPiA+PiBoYXMgYmVlbg0KPiA+Pj4gaGFu
ZGVkIG92ZXIgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiBJZiB0aGUgcmVzZXJ2ZWQgaGVhcCBtZW1v
cnkNCj4gYWxsb2NhdGlvbg0KPiA+PiBpcw0KPiA+Pj4gaW50cm9kdWNlZCwgZWl0aGVyIG9mIGJl
bG93IDIgY2FzZXMgd2lsbCB0cmlnZ2VyIGEgY3Jhc2g6DQo+ID4+Pg0KPiA+Pj4gMS4gSWYgdGhl
IHJlc2VydmVkIGhlYXAgbWVtb3J5IGlzIGF0IHRoZSBlbmQgb2YgdGhlIG1lbW9yeSBibG9jayBs
aXN0DQo+IGFuZA0KPiA+PiB0aGUNCj4gPj4+IGdhcCBiZXR3ZWVuIHJlc2VydmVkIGFuZCB1bnJl
c2VydmVkIG1lbW9yeSBpcyBiaWdnZXIgdGhhbiA1MTJHQiwNCj4gd2hlbg0KPiA+PiB3ZSBzZXR1
cA0KPiA+Pj4gbWFwcGluZ3MgZnJvbSB0aGUgYmVnaW5uaW5nIG9mIHRoZSBtZW1vcnkgYmxvY2sg
bGlzdCwgd2Ugd2lsbCBnZXQgT09NDQo+ID4+IGNhdXNlZA0KPiA+Pj4gYnkgbGFjayBvZiBwYWdl
cyBpbiBib290IGFsbG9jYXRvci4gVGhpcyBpcyBiZWNhdXNlIHRoZSBtZW1vcnkgdGhhdCBpcw0K
PiA+PiByZXNlcnZlZA0KPiA+Pj4gZm9yIGhlYXAgaGFzIG5vdCBiZWVuIG1hcHBlZCBhbmQgYWRk
ZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLg0KPiA+Pj4NCj4gPj4+IDIuIElmIHdlIGFkZCB0aGUg
bWVtb3J5IHRoYXQgaXMgcmVzZXJ2ZWQgZm9yIGhlYXAgdG8gYm9vdCBhbGxvY2F0b3IgZmlyc3Qs
DQo+ID4+IGFuZA0KPiA+Pj4gdGhlbiBzZXR1cCBtYXBwaW5ncyBmb3IgYmFua3MgaW4gdGhlIG1l
bW9yeSBibG9jayBsaXN0LCB3ZSBtYXkgZ2V0IGENCj4gcGFnZQ0KPiA+PiB3aGljaA0KPiA+Pj4g
aGFzIG5vdCBiZWVuIHNldHVwIG1hcHBpbmcsIGNhdXNpbmcgYSBkYXRhIGFib3J0Lg0KPiA+Pg0K
PiA+PiBUaGVyZSBhcmUgYSBmZXcgaXNzdWVzIHdpdGggc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygp
LiBJIGhhdmUgYmVlbg0KPiA+PiByZXdvcmtpbmcgdGhlIGNvZGUgb24gbXkgc3BhcmUgdGltZSBh
bmQgc3RhcnRlZCB0byB1cHN0cmVhbSBiaXRzIG9mIGl0Lg0KPiA+PiBBIFBvQyBjYW4gYmUgZm91
bmQgaGVyZToNCj4gPj4NCj4gPj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBl
b3BsZS9qdWxpZW5nL3hlbi0NCj4gPj4gdW5zdGFibGUuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hl
YWRzL3B0L2Rldg0KPiA+Pg0KPiA+DQo+ID4gUmVhbGx5IGdyZWF0IG5ld3MhIFRoYW5rcyB5b3Ug
dmVyeSBtdWNoIGZvciB0aGUgaW5mb3JtYXRpb24gYW5kIHlvdXINCj4gaGFyZA0KPiA+IHdvcmsg
b24gdGhlIFBvQyA6KSBJIHdpbGwgc3RhcnQgdG8gZ28gdGhyb3VnaCB5b3VyIFBvQyBjb2RlIHRo
ZW4uDQo+IA0KPiBJIHNwZW50IHNvbWV0aW1lcyB0b2RheSB0byBjbGVhbi11cCB0aGUgUG9DIGFu
ZCBzZW50IGEgc2VyaWVzIG9uIHRoZSBNTA0KPiAoc2VlIFsxXSkuIFRoaXMgaGFzIGJlZW4gbGln
aHRseSB0ZXN0ZWQgc28gZmFyLg0KPiANCj4gV291bGQgeW91IGJlIGFibGUgdG8gZ2l2ZSBhIHRy
eSBhbmQgbGV0IG1lIGtub3cgaWYgaXQgaGVscHMgeW91ciBwcm9ibGVtPw0KDQpZZXMgb2YgY291
cnNlISBJIHdpbGwgc3RhcnQgdG8gdGVzdCB0aGlzIHNlcmllcyBeXiBUaGFuayB5b3UgZm9yIHlv
dXIgd29yayENCg0KPiANCj4gRm9yIGNvbnZlbmllbmNlLCBJIGhhdmUgcHVzaGVkIGEgYnJhbmNo
IHdpdGggdGhlIHNlcmllcyBhcHBsaWVkIGhlcmU6DQo+IA0KPiBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9cGVvcGxlL2p1bGllbmcveGVuLQ0KPiB1bnN0YWJsZS5naXQ7YT1zaG9y
dGxvZztoPXJlZnMvaGVhZHMvcHQvcmZjLXYyDQo+IA0KDQpHcmVhdCwgdGhhbmtzIQ0KDQo+IENo
ZWVycywNCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMTA0
MjUyMDEzMTguMTU0NDctMS0NCj4ganVsaWVuQHhlbi5vcmcvDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg0K

