Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35D2FA6DA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69895.125280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Xqv-0005Jm-2d; Mon, 18 Jan 2021 16:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69895.125280; Mon, 18 Jan 2021 16:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Xqu-0005JN-V3; Mon, 18 Jan 2021 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 69895;
 Mon, 18 Jan 2021 16:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECrn=GV=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l1Xqt-0005JI-1j
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:58:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e30cff98-dd13-45be-9525-db0a83b8435e;
 Mon, 18 Jan 2021 16:58:00 +0000 (UTC)
Received: from MRXP264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::18)
 by DB8PR08MB4010.eurprd08.prod.outlook.com (2603:10a6:10:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 16:57:56 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::84) by MRXP264CA0030.outlook.office365.com
 (2603:10a6:500:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12 via Frontend
 Transport; Mon, 18 Jan 2021 16:57:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Mon, 18 Jan 2021 16:57:56 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Mon, 18 Jan 2021 16:57:55 +0000
Received: from 1e246cd12fc4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 252F75B0-8AEF-4643-8720-98C03D3A17CB.1; 
 Mon, 18 Jan 2021 16:57:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e246cd12fc4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jan 2021 16:57:49 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2152.eurprd08.prod.outlook.com (2603:10a6:4:83::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 16:57:46 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 16:57:46 +0000
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
X-Inumbo-ID: e30cff98-dd13-45be-9525-db0a83b8435e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT6AZ7nIHAcHt52d3sRP4EV3Sbisa3jGF6YxFhL2iDU=;
 b=XjIr9aw6qnBZzpY+tnfElasiQBwzFDQIFPoiDV85YWMgmZA8l7wQcrudse31+EUDA9DidMb+6eatXOIT5ElSdYfnunq6QaK7PECs37DccqcC3lNnZJbAaOB7vGKQ5l3jdmTsNHD7XdRUlYzPjo6GUCX66BRRvx41rmBTgC8P/f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90424da0e7cc22e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQnEZKiHeAlUWi04J2AUbwLP/fwpKyYhB8Q4Nh3NEtXw6A6mNdD21boLTnUci0TAHoksDdXPkP1QkmMySAWpaiUQDui5XULkWHZ8rd2PRFT+bN5e/cMUhlygne2/0GdYEiwQCgzpS55rEXkR7IRhWxfCiFlKpCF6KCH6h0vkyHV/NIfw197sLdJY8F8/GTBrcfTDYX4iNWlXYUEd5/ySuslmlIsm7eCB7g16oAUPW9L4OT4XPAIm9xMJGWBCDD+O9W8bGX39vnmR9BRoO+jwsrDaMQLbKQLcl33d+iKrMPfUiwvEl4I3bZBBs0F3yivfIwNLM3kIe0p9qXgzR1cxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT6AZ7nIHAcHt52d3sRP4EV3Sbisa3jGF6YxFhL2iDU=;
 b=Vct4WumNdtGmTAqUPIhed8EaEG4mwJsk9N+haFV2dE+jravgbBO+hFBk4ZhFzeXV+jah2QuloYtSd8/MHcY7Rmcyb3BC+jJcYnE8apjOgJSq+VwKcfZGM87TuEeiJJExTeoGZLLl89RINFBfmfJg8FP7SoYVITv7qI6XvYjuTTmnTUGoX803ItG0Q6lZSLLCHgGxSNI1ih8BFQBm0HPLrnJd/Bts1Bw9VQG1Dzs60kHWOH3FpXKMVJcsPSKHRdbnm2FiL/i41jqP0rtVXkGk55WV96WMsOh19Temoo6ccsreIudJLxIoxC8wH160VJLrVGe6MEDEMkiIjKIcmfJzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT6AZ7nIHAcHt52d3sRP4EV3Sbisa3jGF6YxFhL2iDU=;
 b=XjIr9aw6qnBZzpY+tnfElasiQBwzFDQIFPoiDV85YWMgmZA8l7wQcrudse31+EUDA9DidMb+6eatXOIT5ElSdYfnunq6QaK7PECs37DccqcC3lNnZJbAaOB7vGKQ5l3jdmTsNHD7XdRUlYzPjo6GUCX66BRRvx41rmBTgC8P/f0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW5c4BALh9w79bakGJi7B8FnwYpqoinLCAgAAIcQCACu3xgIAADRWAgAAKUwA=
Date: Mon, 18 Jan 2021 16:57:46 +0000
Message-ID: <5D0E2A07-4299-41D5-BB72-4D2A59E897AD@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
 <5405ECAE-F22F-4893-B302-5D48C57A8847@arm.com>
 <03135a22-676b-6642-0fb3-4e3bb62cf014@gmail.com>
In-Reply-To: <03135a22-676b-6642-0fb3-4e3bb62cf014@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06612d7e-f35e-4815-65d1-08d8bbd2340c
x-ms-traffictypediagnostic: DB6PR0802MB2152:|DB8PR08MB4010:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4010D4285D5D4D79A1387443FCA40@DB8PR08MB4010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6hzE+E6hLH35gaOgYFipvy7r8xPwE9kt0wBXRlumj+ruRwo+qS0IiIkG9TPDG3X+Xp01uG68qFg6vYZPGX5RNf8bFCZFbDbKIM8mWD3oYd3akhojEZCjJdCAge1cdRQLx15DMaAzkahBq93m4o+mgW55QyIx+3rwVMcwy1m2sNFj/3Ye/H3mJT9dTbrKlEfxF0Uhl+62iP4kq6/FM3TLIAv5heinoZiAlvM7TPlOXp4Og9jlFQRji+mhfQVQJ+NGdcthNOIQRkBgtyazmsrIwl7AOLRE4VemcAvcdTvkf3iacyhWx/i5sYyWPSxneT91yNib6EkogNjGd5cPFOHMMZEojp4V2EbtUcJm8Bg+LfVndyX5/UnPjkPGybDfLLkfXgOSHJDg/RuaUcDzebmp3kubEfvy/ydrojx8fdrzR+oezJ2bLp5cozvMyWmHDDLOI1NzP2lADF/vtQ3zZEeyhnTXYKW8N4TXFfLLRvFGYBF0lwy5HtBtHRF4jPm+ZEsRkuJrM45nM1bkP3WESmbUtKvCWIEtHMTrYXW41Jf2bf1CAVGHPw0luZ7k1K7pzi/VJcDDCZNVhN+c/KJNRu2eaLBAqSg7B9Zayaz7lpG4XhQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(36756003)(86362001)(71200400001)(2616005)(8936002)(7416002)(66946007)(5660300002)(6512007)(91956017)(186003)(76116006)(4326008)(2906002)(66556008)(478600001)(33656002)(8676002)(64756008)(316002)(66446008)(6486002)(6506007)(6916009)(83380400001)(53546011)(26005)(54906003)(66476007)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SUk1Y0VFSDNzaG4wT0VoMTVYRjlHeGVwc1M4SFdQbmVzNzN1Si9mME9ZWVJL?=
 =?utf-8?B?ayt1TkYvb1RYY3BTWGhzREJTQVdDMEh4NFFkWDhVZFc4VWJES3NxdDVzTUo2?=
 =?utf-8?B?bS9lT3hZbm9sRWp3dEp6OGpHQ3FZWjFscEFTRExhcXpiQ01qVk1UNkRyenBi?=
 =?utf-8?B?ZkNQNkhrdkdoN1YwK0drdVR0cHYxR1pTUytrbEZvS0VmNEpCTldMNFNoUmlr?=
 =?utf-8?B?dno1bDBtRlVzUFErQ0xyTTdmc0xaSnhRbnNrL05JVGFEYTVGOXhaYS8yaE5P?=
 =?utf-8?B?ZmwxVUNGWWFtVlBQcXp0Z1V0QWMrb2czZ0xaaytBZk5KQllrV1FqU0FIcVBz?=
 =?utf-8?B?NS8zOExDNVVwOUk0TEg4dWhqUDFmclllT255c3lLeUZwV3AyS2dydVNOK1BX?=
 =?utf-8?B?VnNseEFEc2RZeWQvM0N4QjVFVzVFekl5RUNGdGJBTm1KMzE4OXU5VTZnTVJM?=
 =?utf-8?B?YWhwWGd4akxtNVFoc3Q3UE95bktObVYxZ1lPU3RZamJIVzdKekRRR1U2aHgz?=
 =?utf-8?B?b3VhY2E5dEtvQjQvL3ZZazZGTWliVC83Z1N6NWN0Tjlua2E0VkdlaitKWHNO?=
 =?utf-8?B?REErSVRmNmxZYmhSaVlvU0pocnlLY3IxSnlnN1VLcWZJdGVxK0hwYnFPWStt?=
 =?utf-8?B?RlFmMS92LzNJemlwYzdWQlZyeWwzSSt5S0hCMFVQVlF0bVFkdS9KVU1kV3Fw?=
 =?utf-8?B?TmJoazlESWtoZExrQjZhaG1VRDRiWEdTVXErU1BobFV1cytDUHNYa0lRbWxn?=
 =?utf-8?B?S1AvLzZoQWFoeEdSQUFXc3QxRk1OaXk3M1c3Vm9FYVNqbHpWS3hMNnJQMzB2?=
 =?utf-8?B?YlNvZnBXNFVJbG5meThRZnM0TnF2M1NscGRPWktGaU5aZXpvNStmSkxsVk5N?=
 =?utf-8?B?WllabFdVeURvY3pvK1FrQ1lpakcwZG1PL29ZYytidzJhQzVYZG5lYmhZeEpY?=
 =?utf-8?B?VWlBMW4zbjA4VDl0NDVrMXNrTzhxRGtRdEFLZmwwdWc1Qm92V0JTQjArRzF6?=
 =?utf-8?B?VkxuOGdoM2JYN09sMWdGZDkyNmxCYjNlTHZiWEUxaTNCcktobDd6RVBzc250?=
 =?utf-8?B?OWZRUGNzYUZ4aXN0dis4VTVFK0pKYWJKMjlLQTc5K0ZPU3BrMjU3UFd4N0ZR?=
 =?utf-8?B?M2w0UG1ZbmEvSCs1cVJWZm81R1BJckRIUkhqaHloL3luMllJVmhERVQrM0s5?=
 =?utf-8?B?L3lsMCtpS0FDZldtWHp2WStHcFBpcXFWL1JiYm0xejBPUXhXUTA3R3NTcitV?=
 =?utf-8?B?UWZmYXNWZTJwV1hCODRHSUMvak14UDZ5V21FcjBLTWQyYmR6NUg1a2JQSWtH?=
 =?utf-8?B?MUNOM0xVMHNpSEtoTUFzYURJRWxOZ21nVU1OM1loYlkreVhQV0gveU9iUUFW?=
 =?utf-8?B?ZGRUZG5ULzdWRjFheHRna0NpOXdWekpLTWhraUptTHhGbFcvSk9xYW1Lc0Ey?=
 =?utf-8?Q?CuSmCRae?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <754CBF90C2DD4B4B9B9B62B9D8FE77C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2152
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f450adb1-65bb-4e2f-a75b-08d8bbd22e66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aRp3BxMfrEXFWmYcYZ4PLOnpzdldYrODBX9BBMurTneN/c6SJHHanw7yoUZYBW/lDDD8DFBiuvRwGzCGYR2yh2toZ4K12AFxto/0SFXz7nffgygk8QgVDglMR4MuUWHSNgb/cAeBgY416vaieg6rlXVrUpNuBjLAhN2Ng6um6G3m0FRr0fRr/ONyAryidJAZIJhfvXVxK6G2TTtFhr5Mou3Tv4lnKatX2uybxYC2+gho2DKHNs1MBVl/kq8Ak+OHnMMW5lxsIAdtaXhb3mZFSBJLJJ/AdEYkfetqPaSLQyG+dNcq+aAsYqToUGr+jHMjrHEet7HwQco50RnLynJBL1T4XTwGQ0dqPdFSye2197EV3NFBG+WNmZCXRxsBezmBJkiWe8V6+vvk6OobcXvImqGKeEnPbGbeLD65klJvwtcT+skFxGQPJ2eXbSfbgmDY7JyU/aA1Qyaw5quPDM5L14iZif45lg3Y6kksCdaPeko=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39850400004)(46966006)(8676002)(47076005)(6512007)(6486002)(2616005)(336012)(33656002)(2906002)(86362001)(36756003)(54906003)(6506007)(8936002)(53546011)(26005)(82740400003)(316002)(81166007)(186003)(83380400001)(4326008)(70206006)(70586007)(82310400003)(478600001)(6862004)(356005)(107886003)(5660300002)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 16:57:56.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06612d7e-f35e-4815-65d1-08d8bbd2340c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4010

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDE4IEphbiAyMDIxLCBhdCA0OjIwIHBtLCBPbGVrc2Fu
ZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDE4LjAxLjIxIDE3
OjMzLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhlbGxvIE9sZWtzYW5kciwNCj4+IA0KPj4+IE9u
IDExIEphbiAyMDIxLCBhdCA0OjM5IHBtLCBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+
IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IEhpIFJhaHVsDQo+IA0KPiBIaSBSYWh1bA0KPiANCj4g
DQo+Pj4gDQo+Pj4gDQo+Pj4+PiAtDQo+Pj4+PiAgIHN0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNl
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+PiAgIHsNCj4+Pj4+ICAg
ICAgIGludCBpcnEsIHJldDsNCj4+Pj4+IC0gICAgc3RydWN0IHJlc291cmNlICpyZXM7DQo+Pj4+
PiAtICAgIHJlc291cmNlX3NpemVfdCBpb2FkZHI7DQo+Pj4+PiArICAgIHBhZGRyX3QgaW9hZGRy
LCBpb3NpemU7DQo+Pj4+PiAgICAgICBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11Ow0KPj4+
Pj4gLSAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPj4+Pj4gLSAgICBib29s
IGJ5cGFzczsNCj4+Pj4+ICAgLSAgICBzbW11ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpz
bW11KSwgR0ZQX0tFUk5FTCk7DQo+Pj4+PiArICAgIHNtbXUgPSB4emFsbG9jKHN0cnVjdCBhcm1f
c21tdV9kZXZpY2UpOw0KPj4+Pj4gICAgICAgaWYgKCFzbW11KSB7DQo+Pj4+PiAtICAgICAgICBk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBhcm1fc21tdV9kZXZpY2VcbiIpOw0KPj4+
Pj4gKyAgICAgICAgZGV2X2VycihwZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGFybV9zbW11X2Rl
dmljZVxuIik7DQo+Pj4+PiAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+Pj4+PiAgICAgICB9
DQo+Pj4+PiAtICAgIHNtbXUtPmRldiA9IGRldjsNCj4+Pj4+ICsgICAgc21tdS0+ZGV2ID0gcGRl
djsNCj4+Pj4+ICAgLSAgICBpZiAoZGV2LT5vZl9ub2RlKSB7DQo+Pj4+PiArICAgIGlmIChwZGV2
LT5vZl9ub2RlKSB7DQo+Pj4+PiAgICAgICAgICAgcmV0ID0gYXJtX3NtbXVfZGV2aWNlX2R0X3By
b2JlKHBkZXYsIHNtbXUpOw0KPj4+Pj4gKyAgICAgICAgaWYgKHJldCkNCj4+Pj4+ICsgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+ICAgICAgIH0gZWxzZSB7DQo+Pj4+PiAgICAgICAg
ICAgcmV0ID0gYXJtX3NtbXVfZGV2aWNlX2FjcGlfcHJvYmUocGRldiwgc21tdSk7DQo+Pj4+PiAg
ICAgICAgICAgaWYgKHJldCA9PSAtRU5PREVWKQ0KPj4+Pj4gICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPj4+Pj4gICAgICAgfQ0KPj4+Pj4gICAtICAgIC8qIFNldCBieXBhc3MgbW9kZSBhY2Nv
cmRpbmcgdG8gZmlybXdhcmUgcHJvYmluZyByZXN1bHQgKi8NCj4+Pj4+IC0gICAgYnlwYXNzID0g
ISFyZXQ7DQo+Pj4+PiAtDQo+Pj4+PiAgICAgICAvKiBCYXNlIGFkZHJlc3MgKi8NCj4+Pj4+IC0g
ICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsN
Cj4+Pj4+IC0gICAgaWYgKHJlc291cmNlX3NpemUocmVzKSA8IGFybV9zbW11X3Jlc291cmNlX3Np
emUoc21tdSkpIHsNCj4+Pj4+IC0gICAgICAgIGRldl9lcnIoZGV2LCAiTU1JTyByZWdpb24gdG9v
IHNtYWxsICglcHIpXG4iLCByZXMpOw0KPj4+Pj4gKyAgICByZXQgPSBkdF9kZXZpY2VfZ2V0X2Fk
ZHJlc3MoZGV2X3RvX2R0KHBkZXYpLCAwLCAmaW9hZGRyLCAmaW9zaXplKTsNCj4+Pj4+ICsgICAg
aWYgKHJldCkNCj4+Pj4+ICsgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4+Pj4gKw0KPj4+Pj4g
KyAgICBpZiAoaW9zaXplIDwgYXJtX3NtbXVfcmVzb3VyY2Vfc2l6ZShzbW11KSkgew0KPj4+Pj4g
KyAgICAgICAgZGV2X2VycihwZGV2LCAiTU1JTyByZWdpb24gdG9vIHNtYWxsICglbHgpXG4iLCBp
b3NpemUpOw0KPj4+Pj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+Pj4gICAgICAgfQ0K
Pj4+Pj4gLSAgICBpb2FkZHIgPSByZXMtPnN0YXJ0Ow0KPj4+Pj4gICAgICAgICAvKg0KPj4+Pj4g
ICAgICAgICogRG9uJ3QgbWFwIHRoZSBJTVBMRU1FTlRBVElPTiBERUZJTkVEIHJlZ2lvbnMsIHNp
bmNlIHRoZXkgbWF5IGNvbnRhaW4NCj4+Pj4+IC0gICAgICogdGhlIFBNQ0cgcmVnaXN0ZXJzIHdo
aWNoIGFyZSByZXNlcnZlZCBieSB0aGUgUE1VIGRyaXZlci4NCj4+Pj4+ICsgICAgICogdGhlIFBN
Q0cgcmVnaXN0ZXJzIHdoaWNoIGFyZSBvcHRpb25hbCBhbmQgY3VycmVudGx5IG5vdCBzdXBwb3J0
ZWQuDQo+Pj4+PiAgICAgICAgKi8NCj4+Pj4+IC0gICAgc21tdS0+YmFzZSA9IGFybV9zbW11X2lv
cmVtYXAoZGV2LCBpb2FkZHIsIEFSTV9TTU1VX1JFR19TWik7DQo+Pj4+PiArICAgIHNtbXUtPmJh
c2UgPSBpb3JlbWFwX25vY2FjaGUoaW9hZGRyLCBBUk1fU01NVV9SRUdfU1opOw0KPj4+Pj4gICAg
ICAgaWYgKElTX0VSUihzbW11LT5iYXNlKSkNCj4+Pj4+ICAgICAgICAgICByZXR1cm4gUFRSX0VS
UihzbW11LT5iYXNlKTsNCj4+Pj4+ICAgLSAgICBpZiAoYXJtX3NtbXVfcmVzb3VyY2Vfc2l6ZShz
bW11KSA+IFNaXzY0Sykgew0KPj4+Pj4gLSAgICAgICAgc21tdS0+cGFnZTEgPSBhcm1fc21tdV9p
b3JlbWFwKGRldiwgaW9hZGRyICsgU1pfNjRLLA0KPj4+Pj4gKyAgICBpZiAoaW9zaXplID4gU1pf
NjRLKSB7DQo+Pj4+PiArICAgICAgICBzbW11LT5wYWdlMSA9IGlvcmVtYXBfbm9jYWNoZShpb2Fk
ZHIgKyBTWl82NEssDQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSTV9TTU1V
X1JFR19TWik7DQo+Pj4+PiAgICAgICAgICAgaWYgKElTX0VSUihzbW11LT5wYWdlMSkpDQo+Pj4+
PiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNtbXUtPnBhZ2UxKTsNCj4+Pj4+IEBAIC0y
NzY1LDE0ICszMTAxLDI2MiBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4+Pj4gICAgICAgICAgIHJldHVybiByZXQ7DQo+
Pj4+PiAgICAgICAgIC8qIFJlc2V0IHRoZSBkZXZpY2UgKi8NCj4+Pj4+IC0gICAgcmV0ID0gYXJt
X3NtbXVfZGV2aWNlX3Jlc2V0KHNtbXUsIGJ5cGFzcyk7DQo+Pj4+PiArICAgIHJldCA9IGFybV9z
bW11X2RldmljZV9yZXNldChzbW11KTsNCj4+Pj4+ICAgICAgIGlmIChyZXQpDQo+Pj4+PiAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+ICAgKyAgICAvKg0KPj4+Pj4gKyAgICAgKiBLZWVwIGEg
bGlzdCBvZiBhbGwgcHJvYmVkIGRldmljZXMuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIHF1ZXJ5DQo+
Pj4+PiArICAgICAqIHRoZSBzbW11IGRldmljZXMgYmFzZWQgb24gdGhlIGZ3bm9kZS4NCj4+Pj4+
ICsgICAgICovDQo+Pj4+PiArICAgIElOSVRfTElTVF9IRUFEKCZzbW11LT5kZXZpY2VzKTsNCj4+
Pj4+ICsNCj4+Pj4+ICsgICAgc3Bpbl9sb2NrKCZhcm1fc21tdV9kZXZpY2VzX2xvY2spOw0KPj4+
Pj4gKyAgICBsaXN0X2FkZCgmc21tdS0+ZGV2aWNlcywgJmFybV9zbW11X2RldmljZXMpOw0KPj4+
Pj4gKyAgICBzcGluX3VubG9jaygmYXJtX3NtbXVfZGV2aWNlc19sb2NrKTsNCj4+PiBMb29rcyBs
aWtlIHRoYXQgd2UgbmVlZCBzb21lIGtpbmQgb2YgbWFudWFsIHJvbGwtYmFjayBsb2dpYyBoZXJl
IGluIGNhc2Ugb2YgZXJyb3IgZHVyaW5nIHByb2JlICh0aGVyZSBpcyBubyByZWFsIGRldm1fKik6
DQo+Pj4gDQo+Pj4gaW91bm1hcCwgeGZyZWUsIGV0Yy4NCj4+IEkgYWdyZWUgd2l0aCB5b3UgdGhh
dCBtYW51YWwgcm9sbC1iYWNrIGxvZ2ljIGlzIGdvb2QgdG8gaGF2ZSBjbGVhbiBjb2RlIGJ1dCBp
biB0aGlzIHNjZW5hcmlvIHdoYXQgSSBoYXZlIGZvdW5kIG91dCB0aGF0IGlmIHRoZXJlIGlzIGFu
IGVycm9yIGR1cmluZyBwcm9iZSBhcm1fc21tdV9kZXZpY2VfcHJvYmUoKSB3aWxsIHJldHVybiBh
bmQgWEVOIHdpbGwgbm90IGNvbnRpbnVlIHRvIGJvb3QgKGNhbGwgcGFuaWMgZnVuY3Rpb24pICwg
aW4gdGhhdCBjYXNlIGlmIHdlIGZyZWUgdGhlIG1lbW9yeSBhbHNvIHRoZXJlIGlzIG5vIG11Y2gg
ZGlmZmVyZW5jZS4gVGhhdCB3aHkgSSBkZWNpZGVkIG5vdCB0byBtb2RpZnkgdGhlIGNvZGUgdGhh
dCB3ZSBwb3J0ZWQgZnJvbSBMaW51eC4NCj4+IA0KPj4gWEVOKSBJL08gdmlydHVhbGlzYXRpb24g
ZGlzYWJsZWQNCj4+IChYRU4pDQo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqDQo+PiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4+IChYRU4pIENvdWxkbid0
IGNvbmZpZ3VyZSBjb3JyZWN0bHkgYWxsIHRoZSBJT01NVXMuDQo+PiAoWEVOKSAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+PiAoWEVOKQ0KPj4gKFhFTikgTWFudWFs
IHJlc2V0IHJlcXVpcmVkICgnbm9yZWJvb3QnIHNwZWNpZmllZCkNCj4+IA0KPj4gRG8gd2UgaGF2
ZSBhIHJlcXVpcmVtZW50IHRvIGNvbnRpbnVlIHRvIGJvb3QgdGhlIFhFTiBpZiB0aGVyZSBpcyBh
biBJT01NVSBhdmFpbGFibGUgaW4gdGhlIHN5c3RlbSBhbmQgSU9NTVUgcHJvYmUgaXMgZmFpbGVk
PyBJZiB5ZXMgdGhlbiBJIHdpbGwgbW9kaWZ5IHRoZSBjb2RlIHRvIGZyZWUgYWxsIHRoZSByZXNv
dXJjZXMgaWYgdGhlcmUgaXMgZXJyb3IgZHVyaW5nIHByb2JlLg0KPiANCj4gWGVuIHdvbid0IGNh
bGwgcGFuaWMgaWYgSU9NTVUgZHJpdmVyIHJldHVybnMgLUVOT0RFViBhbmQgd2lsbCBjb250aW51
ZSB0byBib290LiBGb3IgZXhhbXBsZSwgaWYgdGhlIElPTU1VIGlzIHByZXNlbnQgYnV0IGNhbm5v
dCBiZSB1c2VkIGluIFhlbiBmb3Igc29tZSByZWFzb24gKGRvZXNuJ3Qgc3VwcG9ydCBwYWdlIHRh
YmxlIHNoYXJpbmcsIGV0YykNCg0KWWVzIHlvdSBhcmUgcmlnaHQgaW4gY2FzZSBvZiBJT01NVSBk
cml2ZXIgcHJvYmUgZmFpbGVkIGFuZCByZXR1cm4gLUVOT0RFViBYRU4gd2lsbCBjb250aW51ZSB0
byBib290LiANCg0KSSBhbSB0aGlua2luZyBvZiBpZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBj
b25maWd1cmluZyB0aGUgSU9NTVUgSFcgYW5kIHJldHVybiAtRU5PREVWIG9yICBmb3Igc29tZSBy
ZWFzb24gaWYgSU9NTVUgaXMgcHJlc2VudCBjYW5ub3Qgbm90IGJlIHVzZWQgaW4gWEVOIHdoeSB3
ZSBhcmUgc2lsZW50bHkgYWxsb3dzIFhFTiB0byBib290IGFuZCBtYWtlIHRoZSBzeXN0ZW0gaW5z
ZWN1cmUuDQpBcyBlbmQgdXNlciBtaWdodCBtaXNzIHRoZSBlcnJvciBsb2dzIGR1cmluZyBib290
IGFuZCB3aWxsIHRoaW5rIElPTU1VIGlzIGVuYWJsZWQgYW5kIHN5c3RlbSBpcyBzZWN1cmUgYnV0
IElPTU1VIGlzIGVpdGhlciBkaXNhYmxlIG9yIGlzIHdvcmtpbmcgaW4gYnlwYXNzIG1vZGUuIA0K
DQpJIG1pZ2h0IGJlIHdyb25nLCBpbiB0aGF0IGNhc2UgYXMgcGVyIG15IHVuZGVyc3RhbmRpbmcg
d2Ugc2hvdWxkIHJldHVybiBlcnJvciBhbmQgY2FsbCBwYW5pYyBhbmQgbGV0IHVzZXIgZGVjaWRl
IGVpdGhlciB0byBmaXggdGhlIGlzc3VlIG9uIG5leHQgYm9vdCBvciBib290IFhFTiB3aXRoIGNt
ZGxpbmUgb3B0aW9uICJpb21tdT1ub+KAnQ0KDQpSZWdhcmRzLA0KUmFodWwgICANCg0KPiANCj4g
DQo+IC0tIA0KPiBSZWdhcmRzLA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0K

