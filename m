Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD913FA358
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 05:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174173.317759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJowA-00028Q-4N; Sat, 28 Aug 2021 03:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174173.317759; Sat, 28 Aug 2021 03:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJowA-00025u-1F; Sat, 28 Aug 2021 03:23:18 +0000
Received: by outflank-mailman (input) for mailman id 174173;
 Sat, 28 Aug 2021 03:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJow9-00025o-1q
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 03:23:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 332925d3-9693-47c4-9810-1dd99c46fbaa;
 Sat, 28 Aug 2021 03:23:14 +0000 (UTC)
Received: from AM6PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::14)
 by DB6PR08MB2648.eurprd08.prod.outlook.com (2603:10a6:6:17::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Sat, 28 Aug
 2021 03:23:11 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::b2) by AM6PR10CA0001.outlook.office365.com
 (2603:10a6:209:89::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Sat, 28 Aug 2021 03:23:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 03:23:10 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Sat, 28 Aug 2021 03:23:10 +0000
Received: from 71d6ce147481.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D56EDF01-5DE9-4E2E-9F3F-0F35CC91CCB0.1; 
 Sat, 28 Aug 2021 03:22:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71d6ce147481.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 03:22:59 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (10.141.135.71) by
 DB6PR08MB2934.eurprd08.prod.outlook.com (10.170.220.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20; Sat, 28 Aug 2021 03:22:57 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 03:22:57 +0000
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
X-Inumbo-ID: 332925d3-9693-47c4-9810-1dd99c46fbaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdW5LUbKSohvr1VGur+vvw+tZt9sW/MDjmK8yQ4D5BI=;
 b=MYAV+PpiSGWbu1OguwanIoxJwzX+Z2xxZeHx+v76fhfYMJrS/cIK1GkSZxHMBNwoKF2RXO2M4nCpsvldoNJOs/pO9vsEK7q/NI1f7OxdXonSd0hpOY1owMmyt9nQoDS0ubybco7DvPP72kayy0YZNLXQb7xHUTxYVlDSXazE80U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X72/TC+XvofyRZ9ifSZB5D+6TFjEqS/lR9mEcBGLb6QDNdHvUv6be2zpZkDbv1x3QEo8U3ZDLbtudjqTtwlW+XW8tMdlJM6Jp66gBt02mXNcTe1ksuzicuTYYpcsAxcB8KLaY/cREl4wXiLTzAox0snG47dQ0ZUVF99N1GmGAt8A/pw60IwAH48anEKU0peifQNkFDI2kOJStQrp1RJnzpfyngFj3Fr2c4qgFHOk+UWlWe3JJophGtGPzpIDALY7r8/dUVRNO/4lHA18fUjb5NFVBp3WFpC24rqFukf/6AVa84I/GQ7aZR2L8wm6TegTjFuUQ1dwVQvZY5F5aZhm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdW5LUbKSohvr1VGur+vvw+tZt9sW/MDjmK8yQ4D5BI=;
 b=Fhc3He3FBkyuV2bZJL+APR+iwFc6OeCUeuPJrpoIKByL0Fs0nLe1ieq1NsHECavHL/1K7bDTyZut7RWNVhz5XSBYgmOnHFJ/nenarvg9YTUbNjq2kJxFboph85sxGOgxQMJV5xQmBsDVEdCik/9TwQ4wxnR/DiPNTavzABYx5YqGnidEMKsXT9FHzEGS3Lhm2TTyzdsjyZsa6vXE1aMsScovWzUOHXPHy3xx8bpGg86rRxqTl9e3Cyg2nZY83DQDVyIqlFfLmK8J1NDT8h1WZh1CtaXZRu4+woQhCJDljnrDLPYYqNwhBPUFnLh7uMeF62awx5/wxfwP1DeS1utPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdW5LUbKSohvr1VGur+vvw+tZt9sW/MDjmK8yQ4D5BI=;
 b=MYAV+PpiSGWbu1OguwanIoxJwzX+Z2xxZeHx+v76fhfYMJrS/cIK1GkSZxHMBNwoKF2RXO2M4nCpsvldoNJOs/pO9vsEK7q/NI1f7OxdXonSd0hpOY1owMmyt9nQoDS0ubybco7DvPP72kayy0YZNLXQb7xHUTxYVlDSXazE80U=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
Thread-Topic: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to
 support NUMA switch in command line
Thread-Index: AQHXjptVFJvPelB8mUqFa8hfwTS7pauHhPgAgADUYQA=
Date: Sat, 28 Aug 2021 03:22:57 +0000
Message-ID:
 <DB9PR08MB6857330F8618D32218F711309EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-40-wei.chen@arm.com>
 <4759ddf5-fabb-ebca-9271-38ed5d69b970@xen.org>
In-Reply-To: <4759ddf5-fabb-ebca-9271-38ed5d69b970@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8DB17B203BA4C444B143162AB7D6286D.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c8ba4bb1-2c14-40f0-9372-08d969d329c1
x-ms-traffictypediagnostic: DB6PR08MB2934:|DB6PR08MB2648:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2648EC11E352C952BF119E479EC99@DB6PR08MB2648.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZtXHr+pC/ilYWlb9WeQdMbOycLrdK/B40Eq0QCaOC3MezM0RVqYFOVxMpjJOJ1MfLdCZQj5uZQx76CBkr3i5daZ/Vgy35M5/tongv+kDkD4JEmXx8ExFCLJQNfRd3WTSN7go1cqe6WqygWWZXE2juQZquFY+VNcOCte7Bf05TQPbQwBIYVGcIXWCD8MiRzxodlGm3Z2rVl3pTFmWe9/RZTFR3Kuom6vx4ux4+qprIKfC4u+lZfp5pk+GUC1imejYZ5mRrISRc85C+WM0lOoVQ5icGMC+wwHST7efQEUtlq1CcKGxn1wKo0fLUMPtJ5BrqT3krH5CbWs9lmOQuG3A7UqOR317yh489LNtOPA6x68ld0aA0AduKWWvOyEDnHq6q45o6C3DpXMBQWXjgLh+NUSJqOMYnPsnawrN8kMOQwyySuAN08MwrG6hUdBKpy88xT2dadlg4zhLO+6vSDi+WTyK0Qvejr1tAWBgGoy5zD73NQ9ZKRaGiJXuzLliTVn8nQhBssu92hL92e4ilY7tvXoK5r8bG7C3qYS2T5FW1jLemOP/awWHMVgtgLqr9RY9nGnvBEWyiczNScb8BgiMPNO11O+XHvBylE+g6oXF9WS7uZxItCUOAxm/YrxP/rFpmxgNycyj1eYVIsmxy5tyBtOaaqBhPMG2vZM7uNrByWCkj+C9ElYKuKY+jVPAf8eWLNZNCw5z3/F6jN9QTERvWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(396003)(376002)(366004)(53546011)(33656002)(26005)(55016002)(38070700005)(66556008)(64756008)(66476007)(186003)(9686003)(6506007)(478600001)(5660300002)(122000001)(83380400001)(2906002)(71200400001)(86362001)(66446008)(38100700002)(8936002)(8676002)(52536014)(316002)(66946007)(110136005)(76116006)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NlZXU0VQM3BJMmk3MEZ3d09LaUpPaStSSWZtc0VZMTIwc3ozNTErNStydXJM?=
 =?utf-8?B?K2dPN3NrVjFBTjBId3IvbFZlcjVMZnBDSGFaVzlOSkhYRzRUK3A3bSt4QXFr?=
 =?utf-8?B?QVNiU29LcmdoMFdhd1Q4ZHhjMGhVL1RKNGdIdDBrM1NId1Zsc213a1B0Zis5?=
 =?utf-8?B?cUZ1OU9KYUFzZzlsb2dhNUMzNEpFSzhYbzBtbVNOZGNMandFcTZoVG91SUxR?=
 =?utf-8?B?R0YyUWIwQWR1K1BpbktRK3p3bjlXVjUwdjhQVEs3OXpSRnFTRmMweXNPbUc5?=
 =?utf-8?B?MnRpTGxOdjdaSDM2MVcyeVN1NWhaREgrVTBvMmVLZ0IvS2hqOFhOSi9GWUk1?=
 =?utf-8?B?OEI4TWVCSGEveTZJVEhWbkFjTTNpOU1JRm83UHh1WUhEZ2NMcmV0ais2azRV?=
 =?utf-8?B?Z0NwRWRWRWdqbDMzNDhDeVRhZTBjU0hvVmpNUFJ5YU9Qa2FHSkF6NDVFU0VN?=
 =?utf-8?B?Z0dEMGJseGZORGdnMWszNGw5TVVZR2FTK0tFZ05LVzhpQmc1ZHVpNkt6cTRZ?=
 =?utf-8?B?TGFDd0FNellWZ2Q1VWNGWlV0VEd1a1lZMU5Tc3lqcm1pa2JwZnNhWERhdzRr?=
 =?utf-8?B?ZVBCSnl3cUxwWktXVllLMU9GU2dEdFVsNU41OXFtcW03N0JROUhhSFp6cDFO?=
 =?utf-8?B?aDBIMFhMM094aGNpWFR4dnZiQmV4ZnI4b0RzQnJrS0t6M0tyZ0dWRUQxdWFk?=
 =?utf-8?B?cC9PVytYOENKUnNXcmh6YWVmZ2dxaThwY2ZNTlIxTjNOODcyVE55TGUwTjdM?=
 =?utf-8?B?b1psSzI5bitwSEdNeG5SUkZPNVhDTXlHcHRGMkJvUU5oU2MySmFERjhZSGRt?=
 =?utf-8?B?Wm5taTRNSDUxZXVIemtJUURDbWhtZThUMDZraWpnc09JdWp5anhrajYycklQ?=
 =?utf-8?B?V28vcUtLK3poYWRVZlhNRTF1SzZJRHVCcENiR0RxY3EwWHFBTVBKei9xSVVQ?=
 =?utf-8?B?aWt5SnFKREQxRmJKbWJWZTYwc1FDZzI4UzdCbkhsL1pmZm5CMEF3a2haaFJC?=
 =?utf-8?B?cndtZ1dsOU0wZytQYXk5Z2JtYnJMRXZ1ZDNQVldWem5PcndDQVVVeXpmMW55?=
 =?utf-8?B?UmpXTVp0TGlFMGVlUHBlZzJxRytkZ1BvWHQ3a3A5Vk9wbExLQW1wSzBPQkEr?=
 =?utf-8?B?Tmp3VzBnemc0ejBjV2xTVm8ya3BDN0xmdmlpMG9xWEFaL0RmUTJNSW5SNU1F?=
 =?utf-8?B?OC94S05xc2l3VFF5WFRWTG5WTXh4RFV0R0FwQ1UzUW42cGR0MXlMNEVGZFFL?=
 =?utf-8?B?OE5KN2F6aGw5YmpsNHhpS3pySk16NW1OLzhsZDl4YnoyYVBINzB5SnZNQ0xp?=
 =?utf-8?B?RmtITTlSeWpJVFRZNWJlSG5IQzBwaUJDTmljT3BldWlSVXpBdW1mbm9mNXI0?=
 =?utf-8?B?azJTa0ZFWUpLb2FHNW95OU5zQ0lSTURYeVpZeEkxSGpUY1g1RVRKUkNLdG1s?=
 =?utf-8?B?OWhDa0l4TXlVZ2lGUlc5SXNzd29JRVcwbTh0ckZqVDVMUnZPN04remoySHlU?=
 =?utf-8?B?OWVqUVc1R0Z4NGxlZDJGTkxuTWkrQ0JxRmFjL05Cc0UwblBVWFdGeVpKN0Zl?=
 =?utf-8?B?bnVTT2JrMFJxc1JVbmphV0tLU05Kclg1c1ZkY29JbytkYXpLRDZ4LzAwTVBu?=
 =?utf-8?B?UnppQWtsV2RaS0p4bGRxR1pleW50b2Y4L1FFQ2dCT3ZteEJpMHcwZklPRzQ1?=
 =?utf-8?B?SzJmZEFSUHM4ZDEwVUdzZjc0K01Tb1VPVUdqaEloWEdBTjA1UW03UWdIOS9l?=
 =?utf-8?Q?2Vg5MK4YFaeqjfIP0lmGAS+6CUUEdsS21QobY8a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2934
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d5206cc-64e7-4b70-c08f-08d969d321fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r7xresBOybmR07TZW/gG/EdV5GNF5q++WrqmiyL9Cez+yzUTl0kNVYrC6DVokNpX29/BDc1ZqJ7jJ0N8R048AQtIcxXKhkDusC/2Pdu09bzG6mnHoQBeJtiq1ZPV/nM/weKkpuWSi45s1VS2fmFGLe4WgIU9orhemiUkYo/w6+FaAErJPVEshZ2YBDmTHHibDegi+R30kKBiaqPwViWkNroIRFW2oJWwiVzovk1MCVinWYjm0duibrX4yiWAUWAYc6wHwf5gKfOnpMMzjcUCeF4fbTZWDrExOpJld9VudDdSg96NDk3yqAv5t2C3DhMn24MJEiygNVHTTjzJwwwV+MSwZASBfhjV2MUTUb9+BCQkLcYQyMl0JjisM1iu7p9IplrbZ/5wWu5RT3SZAv8Xe1UP6dIc1sGCJGFUwyS5rOVlcqLakANBhYp9B7xbuCnhao3AVN8y0Boqs0RGqgcPnqxVMp80xAqOUJKKD4unoQ2fqmd/xnnE7lDI2ZxkI53q3S/7D8w7mnmh3QEUDhP5c/mYyN8cbjDjaimnD18lvjRAcjNY5ZnutRdoYs6VuuTg1tTjpnMbEcG3uTnwvWYEkk2TxpM7pB1TaJl1exqB86idMJHomxaeohUixDL2c3GopoWCJcKn3YtZrKOjIe52N2jNAHVpcagIaS3ao2zakm/Bm2kn1hEOQg5Ch0jFJE0b/vOxR+Q1O7lLsoI8y/GbhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(36840700001)(46966006)(6506007)(52536014)(53546011)(70586007)(47076005)(70206006)(316002)(8936002)(478600001)(356005)(82310400003)(110136005)(82740400003)(81166007)(36860700001)(33656002)(2906002)(336012)(7696005)(83380400001)(55016002)(186003)(4326008)(8676002)(86362001)(5660300002)(26005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 03:23:10.8484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ba4bb1-2c14-40f0-9372-08d969d329c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2648

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MzgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzkvNDBdIHhlbi94ODY6IG1vdmUgbnVtYV9zZXR1cCB0
byBjb21tb24gdG8NCj4gc3VwcG9ydCBOVU1BIHN3aXRjaCBpbiBjb21tYW5kIGxpbmUNCj4gDQo+
IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
IFhlbiB4ODYgaGFzIGNyZWF0ZWQgYSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyICJudW1hIiBhcyBO
VU1BIHN3aXRjaCBmb3INCj4gPiB1c2VyIHRvIHR1cm4gb24vb2ZmIE5VTUEuIEFzIGRldmljZSB0
cmVlIGJhc2VkIE5VTUEgaGFzIGJlZW4gZW5hYmxlZA0KPiA+IGZvciBBcm0sIHRoaXMgcGFyYW1l
dGVyIGNhbiBiZSByZXVzZWQgYnkgQXJtLiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBtb3ZlDQo+ID4g
dGhpcyBwYXJhbWV0ZXIgdG8gY29tbW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENo
ZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC94ODYvbnVtYS5j
ICAgIHwgMzQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgeGVuL2Nv
bW1vbi9udW1hLmMgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
DQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oIHwgIDEgLQ0KPiA+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAzNCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbnVtYS5jIGIveGVuL2FyY2gveDg2L251bWEuYw0KPiA+IGluZGV4
IDhiNDNiZTRhYTcuLjM4MGQ4ZWQ2ZmQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L251
bWEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9udW1hLmMNCj4gPiBAQCAtMTEsNyArMTEsNiBA
QA0KPiA+ICAgI2luY2x1ZGUgPHhlbi9ub2RlbWFzay5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9u
dW1hLmg+DQo+ID4gICAjaW5jbHVkZSA8eGVuL2tleWhhbmRsZXIuaD4NCj4gPiAtI2luY2x1ZGUg
PHhlbi9wYXJhbS5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi90aW1lLmg+DQo+ID4gICAjaW5jbHVk
ZSA8eGVuL3NtcC5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9wZm4uaD4NCj4gPiBAQCAtMTksOSAr
MTgsNiBAQA0KPiA+ICAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiA+ICAgI2luY2x1ZGUgPHhl
bi9zb2Z0aXJxLmg+DQo+ID4NCj4gPiAtc3RhdGljIGludCBudW1hX3NldHVwKGNvbnN0IGNoYXIg
KnMpOw0KPiA+IC1jdXN0b21fcGFyYW0oIm51bWEiLCBudW1hX3NldHVwKTsNCj4gPiAtDQo+ID4g
ICAjaWZuZGVmIERwcmludGsNCj4gPiAgICNkZWZpbmUgRHByaW50ayh4Li4uKQ0KPiA+ICAgI2Vu
ZGlmDQo+ID4gQEAgLTUwLDM1ICs0Niw2IEBAIHZvaWQgbnVtYV9zZXRfbm9kZShpbnQgY3B1LCBu
b2RlaWRfdCBub2RlKQ0KPiA+ICAgICAgIGNwdV90b19ub2RlW2NwdV0gPSBub2RlOw0KPiA+ICAg
fQ0KPiA+DQo+ID4gLS8qIFtudW1hPW9mZl0gKi8NCj4gPiAtc3RhdGljIF9faW5pdCBpbnQgbnVt
YV9zZXR1cChjb25zdCBjaGFyICpvcHQpDQo+ID4gLXsNCj4gPiAtICAgIGlmICggIXN0cm5jbXAo
b3B0LCJvZmYiLDMpICkNCj4gPiAtICAgICAgICBudW1hX29mZiA9IHRydWU7DQo+ID4gLSAgICBl
bHNlIGlmICggIXN0cm5jbXAob3B0LCJvbiIsMikgKQ0KPiA+IC0gICAgICAgIG51bWFfb2ZmID0g
ZmFsc2U7DQo+ID4gLSNpZmRlZiBDT05GSUdfTlVNQV9FTVUNCj4gPiAtICAgIGVsc2UgaWYgKCAh
c3RybmNtcChvcHQsICJmYWtlPSIsIDUpICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBudW1h
X29mZiA9IGZhbHNlOw0KPiA+IC0gICAgICAgIG51bWFfZmFrZSA9IHNpbXBsZV9zdHJ0b3VsKG9w
dCs1LE5VTEwsMCk7DQo+ID4gLSAgICAgICAgaWYgKCBudW1hX2Zha2UgPj0gTUFYX05VTU5PREVT
ICkNCj4gPiAtICAgICAgICAgICAgbnVtYV9mYWtlID0gTUFYX05VTU5PREVTOw0KPiA+IC0gICAg
fQ0KPiA+IC0jZW5kaWYNCj4gPiAtI2lmZGVmIENPTkZJR19BQ1BJX05VTUENCj4gPiAtICAgIGVs
c2UgaWYgKCAhc3RybmNtcChvcHQsIm5vYWNwaSIsNikgKQ0KPiA+IC0gICAgew0KPiA+IC0gICAg
ICAgIG51bWFfb2ZmID0gZmFsc2U7DQo+ID4gLSAgICAgICAgYWNwaV9udW1hID0gLTE7DQo+ID4g
LSAgICB9DQo+ID4gLSNlbmRpZg0KPiA+IC0gICAgZWxzZQ0KPiA+IC0gICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiA+IC0NCj4gPiAtICAgIHJldHVybiAwOw0KPiA+IC19DQo+ID4gLQ0KPiA+ICAg
LyoNCj4gPiAgICAqIFNldHVwIGVhcmx5IGNwdV90b19ub2RlLg0KPiA+ICAgICoNCj4gPiBAQCAt
Mjg3LDQgKzI1NCwzIEBAIHN0YXRpYyBfX2luaXQgaW50IHJlZ2lzdGVyX251bWFfdHJpZ2dlcih2
b2lkKQ0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICAgX19pbml0Y2FsbChyZWdp
c3Rlcl9udW1hX3RyaWdnZXIpOw0KPiA+IC0NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9u
dW1hLmMgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IGluZGV4IDg4ZjE1OTQxMjcuLmM5OGViOGQ1
NzEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9udW1hLmMNCj4gPiArKysgYi94ZW4vY29t
bW9uL251bWEuYw0KPiA+IEBAIC0xNCw4ICsxNCwxMiBAQA0KPiA+ICAgI2luY2x1ZGUgPHhlbi9z
bXAuaD4NCj4gPiAgICNpbmNsdWRlIDx4ZW4vcGZuLmg+DQo+ID4gICAjaW5jbHVkZSA8eGVuL3Nj
aGVkLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4gPiAgICNpbmNsdWRlIDxhc20v
YWNwaS5oPg0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgbnVtYV9zZXR1cChjb25zdCBjaGFyICpzKTsN
Cj4gPiArY3VzdG9tX3BhcmFtKCJudW1hIiwgbnVtYV9zZXR1cCk7DQo+ID4gKw0KPiA+ICAgc3Ry
dWN0IG5vZGVfZGF0YSBub2RlX2RhdGFbTUFYX05VTU5PREVTXTsNCj4gPg0KPiA+ICAgLyogTWFw
cGluZyBmcm9tIHBkeCB0byBub2RlIGlkICovDQo+ID4gQEAgLTMyNCw3ICszMjgsNyBAQCBpbnQg
X19pbml0IG51bWFfc2Nhbl9ub2Rlcyh1NjQgc3RhcnQsIHU2NCBlbmQpDQo+ID4gICB9DQo+ID4N
Cj4gPiAgICNpZmRlZiBDT05GSUdfTlVNQV9FTVUNCj4gPiAtaW50IG51bWFfZmFrZSBfX2luaXRk
YXRhID0gMDsNCj4gPiArc3RhdGljIGludCBudW1hX2Zha2UgX19pbml0ZGF0YSA9IDA7DQo+ID4N
Cj4gPiAgIC8qIE51bWEgZW11bGF0aW9uICovDQo+ID4gICBzdGF0aWMgaW50IF9faW5pdCBudW1h
X2VtdWxhdGlvbih1NjQgc3RhcnRfcGZuLCB1NjQgZW5kX3BmbikNCj4gPiBAQCAtNDA5LDMgKzQx
MywzMiBAQCB2b2lkIF9faW5pdCBudW1hX2luaXRtZW1faW5pdCh1bnNpZ25lZCBsb25nDQo+IHN0
YXJ0X3BmbiwgdW5zaWduZWQgbG9uZyBlbmRfcGZuKQ0KPiA+ICAgICAgIC8qIGFyY2hpdGVjdHVy
ZSBzcGVjaWZpZWQgZmFsbGJhY2sgb3BlcmF0aW9ucyAqLw0KPiA+ICAgICAgIGFyY2hfbnVtYV9p
bml0X2ZhaWxlZF9mYWxsYmFjaygpOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyogW251bWE9b2Zm
XSAqLw0KPiANCj4gVGhlIGRvY3VtZW50YXRpb24gYWxzbyBuZWVkcyBiZSBiZSB1cGRhdGVkIHRv
IHJlZmxlY3QgdGhhdCBmYWN0cyB0aGlzDQo+IG9wdGlvbiBpcyBub3QgYXJjaGl0ZWN0dXJlLWFn
bm9zdGljLg0KPiANCg0KT2ssIEkgd2lsbCB1cGRhdGUgdGhlIHJlbGF0ZSBkb2N1bWVudCBpbiBu
ZXh0IHZlcnNpb24uDQoNCj4gPiArc3RhdGljIF9faW5pdCBpbnQgbnVtYV9zZXR1cChjb25zdCBj
aGFyICpvcHQpDQo+ID4gK3sNCj4gPiArICAgIGlmICggIXN0cm5jbXAob3B0LCJvZmYiLDMpICkN
Cj4gPiArICAgICAgICBudW1hX29mZiA9IHRydWU7DQo+ID4gKyAgICBlbHNlIGlmICggIXN0cm5j
bXAob3B0LCJvbiIsMikgKQ0KPiA+ICsgICAgICAgIG51bWFfb2ZmID0gZmFsc2U7DQo+ID4gKyNp
ZmRlZiBDT05GSUdfTlVNQV9FTVUNCj4gPiArICAgIGVsc2UgaWYgKCAhc3RybmNtcChvcHQsICJm
YWtlPSIsIDUpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBudW1hX29mZiA9IGZhbHNlOw0K
PiA+ICsgICAgICAgIG51bWFfZmFrZSA9IHNpbXBsZV9zdHJ0b3VsKG9wdCs1LE5VTEwsMCk7DQo+
ID4gKyAgICAgICAgaWYgKCBudW1hX2Zha2UgPj0gTUFYX05VTU5PREVTICkNCj4gPiArICAgICAg
ICAgICAgbnVtYV9mYWtlID0gTUFYX05VTU5PREVTOw0KPiA+ICsgICAgfQ0KPiA+ICsjZW5kaWYN
Cj4gPiArI2lmZGVmIENPTkZJR19BQ1BJX05VTUENCj4gPiArICAgIGVsc2UgaWYgKCAhc3RybmNt
cChvcHQsIm5vYWNwaSIsNikgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIG51bWFfb2ZmID0g
ZmFsc2U7DQo+ID4gKyAgICAgICAgYWNwaV9udW1hID0gLTE7DQo+ID4gKyAgICB9DQo+ID4gKyNl
bmRpZg0KPiANCj4gTG9va2luZyBhdCB0aGlzIGNvZGUsIEkgYW0gbm90IHF1aXRlIHRvbyBzdXJl
IHRvIHVuZGVyc3RhbmQgdGhlDQo+IGRpZmZlcmVuY2UgYmV0d2VlbiBiZXR3ZWVuICJudW1hPW5v
YWNwaSIgYW5kICJudW1hPW9mZiIuDQo+IA0KPiBJbiBmYWN0LCBJIGFtIHRlbXB0ZWQgdG8gc2F5
IHRoaXMgb3B0aW9uIHNob3VsZCBkaXNhcHBlYXIgYmVjYXVzZSB0aGlzDQo+IGlzIG9kZCB0byBo
YXZlIGEgZmlybXdhcmUgc3BlY2lmaWMgb3B0aW9uIGp1c3QgZm9yIEFDUEkgYnV0IG5vdCBEVC4g
RXZlbg0KPiBpZiB3ZSBoYXZlIG9uZSBmb3IgZWFjaCwgdGhpcyBtYWtlcyB0aGluZ3MgYSBiaXQg
bW9yZSBjb21wbGljYXRlZCBmb3INCj4gdGhlIGFkbWluLg0KPiANCg0KWWVzLCBJIGFncmVlLiBJ
IHdvdWxkIGNvbnNpZGVyIGEgcHJvcGVyIHdheSB0byBhZGRyZXNzIGl0IGluIG5leHQgdmVyc2lv
bi4NCklmIHg4NiBtYWludGFpbmVycyBjYW4gZ2l2ZSBzb21lIGJhY2tncm91bmQgb2YgdGhlc2Ug
dHdvIG9wdGlvbnMgd291bGQgYmUNCmJldHRlci4NCg0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmggYi94ZW4vaW5jbHVkZS94ZW4v
bnVtYS5oDQo+ID4gaW5kZXggYjliNWQxYWQ4OC4uYzY0N2ZlZjczNiAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL251bWEu
aA0KPiA+IEBAIC04Myw3ICs4Myw2IEBAIGV4dGVybiB2b2lkIG51bWFfaW5pdG1lbV9pbml0KHVu
c2lnbmVkIGxvbmcgc3RhcnRfcGZuLA0KPiB1bnNpZ25lZCBsb25nIGVuZF9wZm4pOw0KPiA+ICAg
ZXh0ZXJuIHZvaWQgbnVtYV9zZXRfbm9kZShpbnQgY3B1LCBub2RlaWRfdCBub2RlKTsNCj4gPiAg
IGV4dGVybiBpbnQgbnVtYV9zY2FuX25vZGVzKHU2NCBzdGFydCwgdTY0IGVuZCk7DQo+ID4gICBl
eHRlcm4gYm9vbCBudW1hX29mZjsNCj4gPiAtZXh0ZXJuIGludCBudW1hX2Zha2U7DQo+ID4gICBl
eHRlcm4gczggYWNwaV9udW1hOw0KPiA+DQo+ID4gICBleHRlcm4gdm9pZCBzZXR1cF9ub2RlX2Jv
b3RtZW0obm9kZWlkX3Qgbm9kZWlkLCB1NjQgc3RhcnQsIHU2NCBlbmQpOw0KPiA+DQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

