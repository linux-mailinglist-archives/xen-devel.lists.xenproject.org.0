Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F994D3232
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287964.488323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyaW-0004NK-QO; Wed, 09 Mar 2022 15:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287964.488323; Wed, 09 Mar 2022 15:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyaW-0004L7-Mv; Wed, 09 Mar 2022 15:50:56 +0000
Received: by outflank-mailman (input) for mailman id 287964;
 Wed, 09 Mar 2022 15:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1b7=TU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nRyaU-0004L1-Tq
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:50:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f3bfad-9fc0-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 16:50:53 +0100 (CET)
Received: from AM6PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:20b:b2::26)
 by VI1PR08MB2895.eurprd08.prod.outlook.com (2603:10a6:802:21::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Wed, 9 Mar
 2022 15:50:34 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::d8) by AM6PR08CA0014.outlook.office365.com
 (2603:10a6:20b:b2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 15:50:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 9 Mar 2022 15:50:32 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 09 Mar 2022 15:50:32 +0000
Received: from 03b9ea3420b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D80AFE1-E2BA-4362-99B0-CB081CE29FFF.1; 
 Wed, 09 Mar 2022 15:50:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03b9ea3420b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Mar 2022 15:50:21 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM4PR08MB2850.eurprd08.prod.outlook.com
 (2603:10a6:205:3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 15:50:13 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:50:13 +0000
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
X-Inumbo-ID: b2f3bfad-9fc0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5Nvwym6EwBCaonhBcDZqUhNcEBgme2f9STe12xdYp4=;
 b=5KVKPli1J2h9bOhBO/o4CaDHIXcw8bd33a5HwFDlvaLZ0l2w8D8/TvCWz6rQQg2i5YnEc8+SvnQM5Yot0MHHTxe6hnsuB5AXIjjALwLp9DIAY8ejDSNldxAQSpMCTjgjmD1R/rdZM2j2wOutulolYvk7hKkhc7aHpA4xHtNCBsM=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c94f1fb3da4a1d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM1SpwYrbn0OBI7xBcBTb6kZVcl3/lhCnyGrhnZ0CunvThPp2QKZY57MsfVRHvMgy3Mlp/1himSVdBa14GeaLInvWBLpoR3Dgsrb3NlVOKprZzNekur0QAMXChr0bkdPResrgM1wPbPGpJmTx15CREVnbcM/Oo8cC8WBZ1m3RHYS24KwdxL/BtS0UL+8ySzfZQvIjVktarshaMFlAPYC2/8r85Xm9+rrXwl4DQGwUEKEHlW2kHZkAYqgt0s2yCDGfF86frgWuJjfT3mi031QYwaojCN1q+Yh3B/hod3RwHcfMOl3jhNjRfuRV1kezrFc0erPTpRTJNsonxD7uRBtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5Nvwym6EwBCaonhBcDZqUhNcEBgme2f9STe12xdYp4=;
 b=Cim1xvN9K+sAB7XM4WFAnSjxldeNnc0QgfJdALrxkaVwMVQJFJAZ7yldIWjdSkZSjqftyrUH/LMPAn74bsHSBjlSgB4efZjjUN9ECtY2eXJiw8bhfaDR6K6jEGUnt3n80VO4TsltrRBakU1Emf14SEuWL50U54obBqxAPp3FgLmDk0dl8JlEVYMe39Pu9fGD/55Lmn4H5tGYbZZn7vvPoMNESXNsGbQC2jerc3xYblwO0sE8bEEvgcf+sACVDd3EErJ7hOcPfZUWuIP3jz9E4iniM9kMTKDvOobFJYmF1xAZgr5bvNVALxWHqaxbfo6AwK6VamYcDoxdjqTAhMsqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5Nvwym6EwBCaonhBcDZqUhNcEBgme2f9STe12xdYp4=;
 b=5KVKPli1J2h9bOhBO/o4CaDHIXcw8bd33a5HwFDlvaLZ0l2w8D8/TvCWz6rQQg2i5YnEc8+SvnQM5Yot0MHHTxe6hnsuB5AXIjjALwLp9DIAY8ejDSNldxAQSpMCTjgjmD1R/rdZM2j2wOutulolYvk7hKkhc7aHpA4xHtNCBsM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index:
 AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQCAAAXLAIADUEkAgAD5MYCACAnKAIAAAqaAgABc6AA=
Date: Wed, 9 Mar 2022 15:50:12 +0000
Message-ID: <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
In-Reply-To: <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 78673165-26b8-4ac8-8f70-08da01e48b7d
x-ms-traffictypediagnostic:
	AM4PR08MB2850:EE_|AM5EUR03FT028:EE_|VI1PR08MB2895:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB28951510D8FF239B29ACEE9CFC0A9@VI1PR08MB2895.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /TPpBjm2KQPqrOHkeDqpPQ97IChHCrXfFB9x735oWCj01UmnOY0g5QX4S1BUfPKMZN7lYTiovYdgkUOsli5sRBqzGYrCM2ZgQGosHOA4K8yKZL4t/0HnUsZs6CicwTZXxHctuQ6ndYaEkcvz4baGyau0XX2+oOGD0cGpYSWU4dyPIMh715aG5mCD3sDY2v8YCmIKF2v9/l9FIIC86d2ZR36ZLsq8LifJ8DlqNQ51LNR3sElXoCnZkFcYQPK22jJBUaU//PghwoBQLODANujNsw9DR+JlmRZDLjrx8TQTUp1zpHdcqinwj52QgelIEHp4wXOqsk7MUy80sgm96amBjl2nVUH+ojWhYu1feZi+RCHBEde/aLD3vISN5R+sqdjBINXaVU0cAjLohE7Q3lan67gbDa+J9KWBHMA0poHEa8Qw9k+2lua/RX/5gDZoy3EuoJKxoskRX9mGn6gAb2WeVcLRkixlWlstZ7yXjpPdrGJsTxTMMZZVIGWre9IYvtIC9l2cRJMObbjW12PiYM2MIMlntK3DlGvZ5mM5b9FC0yMERyXMwMhtw5HdaNBcGrxBvxtjkRvKOVjHMn01ruasIq0Cebc1Y4DAMtWDfgGnVTpebAqyN4047uR2BJzb3lG2ZnNQ3/sxeEaGnWnWmcyr9vulJ58pat/UslLtQCZpASHLMZPombMTV+amUYI9PvOCXDn8DJ79ys1fwJ3CH2kG9kNYhCH3n9Fp2nE5XrswqQKaLwBayH6sKn2FxY2iYT96
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(66556008)(2906002)(6506007)(86362001)(38100700002)(5660300002)(4326008)(76116006)(64756008)(66946007)(66476007)(33656002)(66446008)(91956017)(54906003)(6916009)(8676002)(316002)(36756003)(71200400001)(186003)(508600001)(6486002)(2616005)(38070700005)(83380400001)(53546011)(6512007)(8936002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6CCC93737239748AB047E2E8F0CDC3A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21812fe6-d496-4bc4-1f9f-08da01e47f90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46QGVojVc/eCe0kJlma/uhDmRfVYuOBBd1vdwFZ3H5VmHeL21JmTrrdawCJeHhDnz4g/bco+7DdnEg+bmhAy3TJYZMS1DNvCqjWdLGLUVTHJQ7S5IuvqupXlf9OrJR1No1jFWtM7TQtnO4gog8SjVFQU8lIHzUY/2rpV7iONm5M961g9EZFu0V4CLv6zTB5R3h49Pk0TtNjHILxiDEFLIkT5cIlEaLX7F/7FKoJXJek8puK9o/+acUrQ2wN1XdAzcwKdc7WESf5AZcN/A8fP/mng6NZfIwK0h6pkrqOXoXwAzY2D7e1g3zoI7pgJ3LZzBkjVRJb6Er1Dja10S+kYZ0eEN0J1rlOej1cQMNY2nW5HAr93Pb3fBbID6wzAC9H+uDOjElnOFwZd7T+ce8om0PZM9zZeNqy0UQvcohMXaTJNaH69QsfDDWj77+eCRFQK2PpGZWzE5kRMzBmxHpW4bQKvC8IGKyix/DP4PUgMswOSqFLLI8E600M3hqmW+q33rtOdviH4MrkYGGlL/bqlvEN9fe6ZoZUMKP2tS1tg8kuUYHCpwcIciP/sYRmLfbonWk5hlkYyxaEK4hVD0wvmKdmZdgOEQbtKCOzXGk5zrmUE5MVqUm9Bmu9JAzknBuZIWGk628roj6oD/2pNpobvPXKffNkYpIBUXmYiDS+xtqUtJCV4uRS8xdmIL5iQ+bbw1w0T/GcxIW5+jQMNi6QzKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6506007)(8676002)(4326008)(6862004)(54906003)(336012)(316002)(5660300002)(8936002)(70206006)(70586007)(508600001)(6486002)(2616005)(186003)(26005)(82310400004)(6512007)(63350400001)(63370400001)(53546011)(2906002)(83380400001)(33656002)(40460700003)(86362001)(47076005)(36860700001)(356005)(81166007)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:50:32.9998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78673165-26b8-4ac8-8f70-08da01e48b7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2895

SGkgSmFuLA0KDQo+IE9uIDkgTWFyIDIwMjIsIGF0IDEwOjE3IGFtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDMuMjAyMiAxMTowOCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBIaSBKYW4sDQo+PiANCj4+PiBPbiA0IE1hciAyMDIyLCBhdCA3OjIz
IGFtLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9u
IDAzLjAzLjIwMjIgMTc6MzEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4gT24gMSBNYXIgMjAy
MiwgYXQgMTo1NSBwbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+
Pj4+IE9uIDAxLjAzLjIwMjIgMTQ6MzQsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+PiBPbiAy
NCBGZWIgMjAyMiwgYXQgMjo1NyBwbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToNCj4+Pj4+Pj4gT24gMTUuMDIuMjAyMiAxNjoyNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+
Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYw0KPj4+Pj4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS92bXNpLmMNCj4+Pj4+Pj4+IEBAIC05MjUsNCArOTI1LDEwNiBAQCBpbnQg
dnBjaV9tc2l4X2FyY2hfcHJpbnQoY29uc3Qgc3RydWN0IHZwY2lfbXNpeCAqbXNpeCkNCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gIHJldHVybiAwOw0KPj4+Pj4+Pj4gfQ0KPj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4gK2ludCB2cGNpX21ha2VfbXNpeF9ob2xlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0K
Pj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBkZXYtPmRvbWFp
bjsNCj4+Pj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAr
ICAgIGlmICggIXBkZXYtPnZwY2ktPm1zaXggKQ0KPj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7
DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIC8qIE1ha2Ugc3VyZSB0aGVyZSdzIGEgaG9sZSBm
b3IgdGhlIE1TSVggdGFibGUvUEJBIGluIHRoZSBwMm0uICovDQo+Pj4+Pj4+PiArICAgIGZvciAo
IGkgPSAwOyBpIDwgQVJSQVlfU0laRShwZGV2LT52cGNpLT5tc2l4LT50YWJsZXMpOyBpKysgKQ0K
Pj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiArICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0ID0g
UEZOX0RPV04odm1zaXhfdGFibGVfYWRkcihwZGV2LT52cGNpLCBpKSk7DQo+Pj4+Pj4+PiArICAg
ICAgICB1bnNpZ25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIocGRldi0+
dnBjaSwgaSkgKw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2bXNpeF90YWJsZV9zaXplKHBkZXYtPnZwY2ksIGkpIC0gMSk7DQo+Pj4+Pj4+PiArDQo+Pj4+
Pj4+PiArICAgICAgICBmb3IgKCA7IHN0YXJ0IDw9IGVuZDsgc3RhcnQrKyApDQo+Pj4+Pj4+PiAr
ICAgICAgICB7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgcDJtX3R5cGVfdCB0Ow0KPj4+Pj4+Pj4g
KyAgICAgICAgICAgIG1mbl90IG1mbiA9IGdldF9nZm5fcXVlcnkoZCwgc3RhcnQsICZ0KTsNCj4+
Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBzd2l0Y2ggKCB0ICkNCj4+Pj4+Pj4+ICsg
ICAgICAgICAgICB7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgY2FzZSBwMm1fbW1pb19kbToNCj4+
Pj4+Pj4+ICsgICAgICAgICAgICBjYXNlIHAybV9pbnZhbGlkOg0KPj4+Pj4+Pj4gKyAgICAgICAg
ICAgICAgICBicmVhazsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBjYXNlIHAybV9tbWlvX2RpcmVj
dDoNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCBtZm5feChtZm4pID09IHN0YXJ0ICkN
Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KGQsIHN0YXJ0KTsNCj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICB9DQo+Pj4+Pj4+
PiArICAgICAgICAgICAgICAgIC8qIGZhbGx0aHJvdWdoLiAqLw0KPj4+Pj4+Pj4gKyAgICAgICAg
ICAgIGRlZmF1bHQ6DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIHB1dF9nZm4oZCwgc3RhcnQp
Ow0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICIlcHA6IGV4aXN0aW5nIG1hcHBpbmcgKG1m
bjogJSIgUFJJX21mbg0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICJ0eXBlOiAl
ZCkgYXQgJSNseCBjbG9iYmVycyBNU0lYIE1NSU8gYXJlYVxuIiwNCj4+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgbWZuX3gobWZuKSwgdCwgc3RhcnQpOw0KPj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICByZXR1cm4gLUVFWElTVDsNCj4+Pj4+Pj4+ICsgICAgICAg
ICAgICB9DQo+Pj4+Pj4+PiArICAgICAgICAgICAgcHV0X2dmbihkLCBzdGFydCk7DQo+Pj4+Pj4+
PiArICAgICAgICB9DQo+Pj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAg
cmV0dXJuIDA7DQo+Pj4+Pj4+PiArfQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gLi4uIG5vdGhpbmcgaW4g
dGhpcyBmdW5jdGlvbiBsb29rcyB0byBiZSB4ODYtc3BlY2lmaWMsIGV4Y2VwdCBtYXliZQ0KPj4+
Pj4+PiBmdW5jdGlvbnMgbGlrZSBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoKSBtYXkgbm90IGN1
cnJlbnRseSBiZSBhdmFpbGFibGUNCj4+Pj4+Pj4gb24gQXJtLiBCdXQgdGhpcyBkb2Vzbid0IG1h
a2UgdGhlIGNvZGUgeDg2LXNwZWNpZmljLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgd2lsbCBtYXliZSBi
ZSB3cm9uZyBidXQgd2hhdCBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgY29kZSBpcyB0aGF0IGZvciB4
ODYgDQo+Pj4+Pj4gaWYgdGhlcmUgaXMgbm8gcDJtIGVudHJpZXMgc2V0dXAgZm9yIHRoZSByZWdp
b24sIGFjY2Vzc2VzIHRvIHRoZW0gd2lsbCBiZSB0cmFwcGVkIA0KPj4+Pj4+IGludG8gdGhlIGh5
cGVydmlzb3IgYW5kIGNhbiBiZSBoYW5kbGVkIGJ5IHNwZWNpZmljIE1NSU8gaGFuZGxlci4NCj4+
Pj4+PiANCj4+Pj4+PiBCdXQgZm9yIEFSTSB3aGVuIHdlIGFyZSByZWdpc3RlcmluZyB0aGUgTU1J
TyBoYW5kbGVyIHdlIGhhdmUgdG8gcHJvdmlkZSANCj4+Pj4+PiB0aGUgR1BBIGFsc28gZm9yIHRo
ZSBNTUlPIGhhbmRsZXIuIA0KPj4+Pj4gDQo+Pj4+PiBRdWVzdGlvbiBpczogSXMgdGhpcyBqdXN0
IGFuIGVmZmVjdCByZXN1bHRpbmcgZnJvbSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24sDQo+Pj4+
PiBvciBhbiBpbmhlcmVudCByZXF1aXJlbWVudD8gSW4gdGhlIGZvcm1lciBjYXNlLCBoYXJtb25p
emluZyB0aGluZ3MgbWF5IGJlIGFuDQo+Pj4+PiBhbHRlcm5hdGl2ZSBvcHRpb24uDQo+Pj4+IA0K
Pj4+PiBUaGlzIGlzIGFuIGluaGVyZW50IHJlcXVpcmVtZW50IHRvIHByb3ZpZGUgYSBHUEEgd2hl
biByZWdpc3RlcmluZyB0aGUgTU1JTyBoYW5kbGVyLg0KPj4+IA0KPj4+IFNvIHlvdSBmaXJzdCBz
YXkgeWVzIHRvIG15ICJpbmhlcmVudCIgcXVlc3Rpb24sIGJ1dCB0aGVuIC4uLg0KPj4+IA0KPj4+
PiBGb3IgeDg2IG1zaXggbW1pbyBoYW5kbGVycyBpcyByZWdpc3RlcmVkIGluIGluaXRfbXNpeCgu
LikgZnVuY3Rpb24gYXMgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQNCj4+Pj4gb24geDg2IHRvIHBy
b3ZpZGUgR1BBIHdoZW4gcmVnaXN0ZXJpbmcgdGhlIGhhbmRsZXIuIExhdGVyIHBvaW50IG9mIHRp
bWUgd2hlbiBCQVJzIGFyZSBjb25maWd1cmVkDQo+Pj4+IGFuZCBtZW1vcnkgZGVjb2RpbmcgYml0
IGlzIGVuYWJsZWQgdnBjaV9tYWtlX21zaXhfaG9sZSgpIHdpbGwgY2xlYXIgdGhlIGlkZW50aXR5
IG1hcHBpbmcgZm9yIG1zaXgNCj4+Pj4gYmFzZSB0YWJsZSBhZGRyZXNzIHNvIHRoYXQgYWNjZXNz
IHRvIG1zaXggdGFibGVzIHdpbGwgYmUgdHJhcHBlZC4NCj4+Pj4gDQo+Pj4+IE9uIEFSTSB3ZSBu
ZWVkIHRvIHByb3ZpZGUgR1BBIHRvIHJlZ2lzdGVyIHRoZSBtbWlvIGhhbmRsZXIgYW5kIE1TSVgg
dGFibGUgYmFzZQ0KPj4+PiBhZGRyZXNzIGlzIG5vdCB2YWxpZCB3aGVuIGluaXRfbXNpeCgpIGlz
IGNhbGxlZCBhcyBCQVIgd2lsbCBiZSBjb25maWd1cmVkIGxhdGVyIHBvaW50IGluIHRpbWUuDQo+
Pj4+IFRoZXJlZm9yZSBvbiBBUk0gbW1pbyBoYW5kbGVyIHdpbGwgYmUgcmVnaXN0ZXJlZCBpbiBm
dW5jdGlvbiB2cGNpX21ha2VfbXNpeF9ob2xlKCkgd2hlbg0KPj4+PiBtZW1vcnkgZGVjb2Rpbmcg
Yml0IGlzIGVuYWJsZWQuDQo+Pj4gDQo+Pj4gLi4uIHlvdSBleHBsYWluIGl0J3MgYW4gaW1wbGVt
ZW50YXRpb24gZGV0YWlsLiBJJ20gaW5jbGluZWQgdG8NCj4+PiBzdWdnZXN0IHRoYXQgeDg2IGFs
c28gcGFzcyB0aGUgR1BBIHdoZXJlIHBvc3NpYmxlLiBIYW5kbGVyIGxvb2t1cA0KPj4+IHJlYWxs
eSB3b3VsZCBiZW5lZml0IGZyb20gbm90IG5lZWRpbmcgdG8gaXRlcmF0ZSBvdmVyIGFsbCByZWdp
c3RlcmVkDQo+Pj4gaGFuZGxlcnMsIHVudGlsIG9uZSBjbGFpbXMgdGhlIGFjY2Vzcy4gVGhlIG9w
dGltaXphdGlvbiBwYXJ0IG9mIHRoaXMNCj4+PiBvZiBjb3Vyc2UgZG9lc24ndCBuZWVkIHRvIGJl
IGRvbmUgcmlnaHQgaGVyZSwgYnV0IGhhcm1vbml6aW5nDQo+Pj4gcmVnaXN0ZXJfbW1pb19oYW5k
bGVyKCkgYmV0d2VlbiBib3RoIGFyY2hpdGVjdHVyZXMgd291bGQgc2VlbSB0byBiZQ0KPj4+IGEg
cmVhc29uYWJsZSBwcmVyZXEgc3RlcC4NCj4+IA0KPj4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGlm
IHdlIG1vZGlmeSB0aGUgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkgZm9yIHg4NiB0byBwYXNzIEdQ
QQ0KPj4gd2UgY2FuIGhhdmUgdGhlIGNvbW1vbiBjb2RlIGZvciB4ODYgYW5kIEFSTSBhbmQgYWxz
byB3ZSBjYW4gb3B0aW1pemUgdGhlIE1NSU8NCj4+IHRyYXAgaGFuZGxpbmcgZm9yIHg4Ni4NCj4+
IA0KPj4gV2hhdCBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgY29kZSBpcyB0aGF0IG1vZGlmeWluZyB0
aGUgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkgZm9yDQo+PiB4ODYgdG8gcGFzcyBHUEEgcmVxdWly
ZXMgYSBsb3Qgb2YgZWZmb3J0IGFuZCB0ZXN0aW5nLg0KPj4gDQo+PiBVbmZvcnR1bmF0ZWx5LCBJ
IGhhdmUgYW5vdGhlciBoaWdoIHByaW9yaXR5IHRhc2sgdGhhdCBJIGhhdmUgdG8gY29tcGxldGUg
SSBkb27igJl0IGhhdmUgdGltZQ0KPj4gdG8gb3B0aW1pc2UgdGhlIHJlZ2lzdGVyX21taW9faGFu
ZGxlcigpIGZvciB4ODYgYXQgdGhpcyB0aW1lLg0KPiANCj4gQWN0dWFsbHkgbWFraW5nIHVzZSBv
ZiB0aGUgcGFyYW1ldGVyIGlzIG5vdGhpbmcgSSB3b3VsZCBleHBlY3QgeW91IHRvDQo+IGRvLiBC
dXQgaXMganVzdCBhZGRpbmcgdGhlIGV4dHJhIHBhcmFtZXRlciBzaW1pbGFybHkgb3V0IG9mIHNj
b3BlIGZvcg0KPiB5b3U/DQo+IA0KDQpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHlvdSBhcmUg
YXNraW5nIHRvIG1ha2UgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkgZGVjbGFyYXRpb24NCnNhbWUg
Zm9yIHg4NiBhbmQgQVJNLiBZb3UgYXJlIG5vdCBhc2tpbmcgdG8gbW9kaWZ5IHRoZSB4ODYgTU1J
TyBoYW5kbGVyIGxvZ2ljIHRvDQp1c2UgR1BBIHRvIGZpbmQgdGhlIGhhbmRsZXI/DQoNCkFzIFJv
Z2VyIGFsc28gbWVudGlvbmVkIHRoYXQgdnBjaV9tYWtlX21zaXhfaG9sZSgpIGlzIHJlcXVpcmVk
IG9ubHkgZm9yIHg4NiB0byBjbGVhcg0KdGhlIGlkZW50aXR5IG1hcHBpbmcuIElmIHdlIG1ha2Ug
dGhlIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSBhcmNoLXNwZWNpZmljIHRoZXJlIGlzIG5vDQpuZWVk
IHRvIG1vZGlmeSB0aGUgcGFyYW1ldGVyIGZvciByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoKSwgYXMg
Zm9yIHg4NiBhbmQgQVJNDQpyZWdpc3Rlcl9tbWlvX2hhbmRsZXIoKSB3aWxsIGJlIGNhbGxlZCBp
biBkaWZmZXJlbnQgcGxhY2VzLg0KDQpGb3IgeDg2IHJlZ2lzdGVyX21taW9faGFuZGxlcigpIHdp
bGwgYmUgY2FsbGVkIGluIGluaXRfbXNpeCgpIHdoZXJlYXMgZm9yIEFSTQ0KcmVnaXN0ZXJfbW1p
b19oYW5kbGVyKCkgd2lsbCBiZSBjYWxsZWQgIGluIHZwY2lfbWFrZV9tc2l4X2hvbGUoKS4gSW4g
dGhpcyBjYXNlIHdlDQpoYXZlIHRvIG1vdmUgdGhlIGNhbGwgdG8gcmVnaXN0ZXJfbW1pb19oYW5k
bGVyKCkgYWxzbyB0byBhcmNoLXNwZWNpZmljIGZpbGVzLiBJZiB3ZSBtb3ZlDQp0aGUgcmVnaXN0
ZXJfbW1pb19oYW5kbGVyKCkgIHRvIGFyY2ggc3BlY2lmaWMgZmlsZSB0aGVyZSBpcyBubyBuZWVk
IHRvIG1ha2UgdGhlDQpmdW5jdGlvbiBjb21tb24uDQoNClJlZ2FyZHMsDQpSYWh1bCANCg0KPiBK
YW4NCg0K

