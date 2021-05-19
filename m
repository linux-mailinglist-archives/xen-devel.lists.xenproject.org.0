Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596F388826
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 09:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129907.243624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljGbv-0003ev-Il; Wed, 19 May 2021 07:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129907.243624; Wed, 19 May 2021 07:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljGbv-0003bk-F4; Wed, 19 May 2021 07:27:19 +0000
Received: by outflank-mailman (input) for mailman id 129907;
 Wed, 19 May 2021 07:27:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljGbt-0003be-Mj
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 07:27:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1846d52-9693-4657-827b-77b4930036cb;
 Wed, 19 May 2021 07:27:15 +0000 (UTC)
Received: from AM5PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:203:69::28) by DB7PR08MB3499.eurprd08.prod.outlook.com
 (2603:10a6:10:4b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 07:27:09 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::bb) by AM5PR0202CA0018.outlook.office365.com
 (2603:10a6:203:69::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend
 Transport; Wed, 19 May 2021 07:27:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:27:09 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 07:27:08 +0000
Received: from e37bf086faab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F85D0727-7E2D-4CAC-B057-0AF74B3B9432.1; 
 Wed, 19 May 2021 07:27:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e37bf086faab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 07:27:03 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4173.eurprd08.prod.outlook.com (2603:10a6:803:e8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 07:27:01 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:27:01 +0000
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
X-Inumbo-ID: c1846d52-9693-4657-827b-77b4930036cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p1owc7bEvWjg5Nl2oUmkysCRCk6ZAGC2+/X1Md/3qY=;
 b=j4BWsXo7oYlcs1O29nm7QIe28aWw9b1oN8z37jInc1Irx0CIZNFyl557YOyp5QSE5SnJBM/jQ85LSLFQM9oGODEpza5WwaQbCSVzqUKAG2NzesnZpjX1Sk6W/PEAHo2zL5BaQIN5/HKeQh+3kBo+qoGkIttL6p8KNFW6hooqsWo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0Zs+cZOIZy2HRBzJLpPbqwWFgowzCB5jG9519HgB9EoGGYq1kXQIo22EJiq0SCHasnRSoLdayfQ4QWslQr5otn+rDyk5zRXJC5shkkH7Bv2SFK9gfjVzHcm2SpGUjAbofxsoyu4vxSGjv4DkzzexDD11prDAqIKjt1bLZrYexvKVqVwjBn1alnwJhPRvltXM4laGu6+B4zl96q531AbCarCUz4U8WdEl91HJnxfYSjhhpqdN0OryNuAOJn95bu7CahQiWdiLlwg0sb80dBdR56V76VaV3bK7HT7HM+oKU2YXmWOAoJF6Kt5lGsyrOv71lT8H0gVa826a7rB9+13og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p1owc7bEvWjg5Nl2oUmkysCRCk6ZAGC2+/X1Md/3qY=;
 b=AHlNXKPZfbfIqThC3rHsp7gdZxyIqPESsP+u5Zj8+1BNWSThDHPfeadzGJw57elOrzKk0jmSZFBdcrt/7QeLImhVCZP1gPeWLlN9QSX/cSJzWPWRkWgNSzxTCuqFeh7Y/4nIxObRa8hhKwdpvKfYY6D3djWLeL3JpuNCbC+Cr7oMI+1Qi4dErGkoPqh24Wncb0yXe8mW4v7UG8XdEt3b1yr/Uszlxid6oIzkD19HeLBvR45q1fPJvnqBg2a4oS1NJEmFo5v7hioV0AwmpsDFnHoyxv648b9uA3h79A0s/qKfLMinZQanlRmnqhjmy1ykNSVuwIhqppYJoIqJrpLGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p1owc7bEvWjg5Nl2oUmkysCRCk6ZAGC2+/X1Md/3qY=;
 b=j4BWsXo7oYlcs1O29nm7QIe28aWw9b1oN8z37jInc1Irx0CIZNFyl557YOyp5QSE5SnJBM/jQ85LSLFQM9oGODEpza5WwaQbCSVzqUKAG2NzesnZpjX1Sk6W/PEAHo2zL5BaQIN5/HKeQh+3kBo+qoGkIttL6p8KNFW6hooqsWo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 10/10] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH 10/10] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXS6XHA2Y5LfY1BUmlVQXGKXjd9qrpJQIAgAE5LmA=
Date: Wed, 19 May 2021 07:27:00 +0000
Message-ID:
 <VE1PR08MB5215B4D187DFE8AE20DF2B95F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-11-penny.zheng@arm.com>
 <7e9bacde-8a1c-c9f8-a06d-2f39f2192315@xen.org>
In-Reply-To: <7e9bacde-8a1c-c9f8-a06d-2f39f2192315@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0C3D7B8FF800544084DBEF3E07B9D9B5.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9fb75c-e93d-4c39-dbd8-08d91a978348
x-ms-traffictypediagnostic: VI1PR08MB4173:|DB7PR08MB3499:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB34997142C04055A471C8F68AF72B9@DB7PR08MB3499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4fgaQKdIfd/K1O+Hz0Ucb65q7KpuZnxm04UbqlilTV9WIbgK1NNRFF9lgej0aRV88falV5lM5KsMXY2Y75elnuJNg2GC5P+sBj3xzXVOKq3h3xQrjbeck/YljxJXOeL+hFLBREb04+YE5AfPJArVf4aOJl5zzmnGptFYgnfoH4G7P/BIcpF/0TImqnZdgZEq3Krdxpsb5E0IuHUOfIWdNZl8loq6hHrqEG637uvWmDhPwuUSSCAIpgOqudQ5sGwavNhDIoFi4CxOtYX5J77QiLcCHeZfa9jgedFVeax4rIrPlGE6nvD2YDIIGtHo99N1YEI1F3K1JXbN2L64bi2xV/Eh4+LInC1YH6olAUK4Or0BpDIOmxTqZ3pt7/eaO8AoMJwwxCkBnj4HlBPTLSeG2gI2L+HTunqHKVkKjiEh+4/EaQGVAElQgXfvk6KqsODTdgMShBQWaiL5hqUmokEjzxr+kSJi2wjulziPrjpshotmeJdp1h8w45ypCDv4P2gV3WW+bKiw9r51txrP+33n5564kU8IK4gS7vRUHFxa6WLA1IBGdjm/8hoZknX/zb3MIycgJ3ajmULviSVYNx+2UGs+pr5XWkjEoqgyQGxEbug=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(316002)(110136005)(52536014)(33656002)(8676002)(8936002)(4326008)(26005)(122000001)(9686003)(38100700002)(6506007)(186003)(53546011)(66556008)(83380400001)(478600001)(71200400001)(55016002)(86362001)(7696005)(54906003)(76116006)(66946007)(64756008)(66446008)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WG1vdEszWWlvSVc1cFoxNFZMcmd1THpXaVBjZVlSN1dLL3BxczUyMWphamNs?=
 =?utf-8?B?L0FhZVQ4aExoQUZibGs0MkJHZkhKeXNyLzJSalhLKzVHS21nTDlocnFMU0hX?=
 =?utf-8?B?alFvYUgvdHYrcURtb2dtN3N0eWxpK09vdGk2NFBnTDh0c1prajVmOU9ibENB?=
 =?utf-8?B?OHJTZnNNck9CNk1OU0JOb1NTU2ZFdUJISE9UZTd3TFZTMStTZXU2QmhQeUZp?=
 =?utf-8?B?TTczbzN1Mmw5TDZxNEJMNnV0QThwKzJEbWRkSUxnL0t5QTEzdnVXVjJVL0tE?=
 =?utf-8?B?UTg4VE5DZ01ubURYcmUwTkN3dVA3aVFKT0ZPNHR1ZUJpNzlWaGNFaUlmVHlr?=
 =?utf-8?B?KzR4Ump6UGNTZFh0Q2Y1VGxhd2Q4cThJQi9MU3A1TUhDdUd1NDN1TGNSVmNy?=
 =?utf-8?B?VkoyQS9LbU9QS1VvOVdZSzNTYmtFNHdUTVQ2OXg5bXdLa3FSYUpQblVYeUpo?=
 =?utf-8?B?TVdUM2F4S3ZHbEczZzhHWFo5UzhyWnd0YktidVhtTjM5YkhhVzZTaU1rT2tD?=
 =?utf-8?B?SHg5ZVhRY21pVUxteDhPbjlKeUJvN3pONVF5UlJBQ2lkaEhEbTdzTEdTeVZw?=
 =?utf-8?B?dGNyNVRma2tZRUdIQ2VvSE5OMDRvZDVYSk91N0p3QUtuMkFCL3BQUm5JWE5t?=
 =?utf-8?B?NUZraGgxeGJzMHEzQmZrcm0xcHdZK3JMcVR4Kys0L0ZRekNzQXQrVU1LYTdt?=
 =?utf-8?B?MXYzZEl4dnZqMG40aXRLUy91anFpUFE1dEZ2M0hLMDlDMzR6ck9ONlZrSEtq?=
 =?utf-8?B?MklOZWt5dThHSys4QUVsZzF5VU5lTU4xMzVnMUQwRE1xUWlxTDBiNC9Cb0hh?=
 =?utf-8?B?RVI0NUlSOHllVWx3dTZoNmJab0dTZDc1QW8xOXE5K200VXJ5MmFjYzFza1F4?=
 =?utf-8?B?U3hVUHR6cWNOaEljSkF2OEFSMlNIb0Q0TjM3ckVVS0pmU20ySmhmVkJQejBa?=
 =?utf-8?B?N0pOd2pINUxLaXY0Z0dsWE5oWEJlM05ZQVlocGQvQ1VaVy82dlVsM0pCWENK?=
 =?utf-8?B?U1lNQmoyYUxTNEVlV0xUVHlPamFmNjdkV3E0R0ZqS3NoUkFwVGpDbjE5Yjdj?=
 =?utf-8?B?NWRIL2dzeGlRRnY4eE5VcGVienZiNTJHeHg1RkNTb21RM0JnS3hxTXlrcU84?=
 =?utf-8?B?dmhmeFErQTcyZmRsTjl4Q1kwK0k3Sms3bzJ6STZrZldnVDdzSmlwNEJxd2c0?=
 =?utf-8?B?R3FVbUhPdmxmalBYVEcwKytWc0tQUUQwaXd6V2lYYzJGelQ0d08vWFN4cUd1?=
 =?utf-8?B?ZG83Y0liRC81a1ZSTVNRV3FucnE3OFI4STQ0RjZQc0xkWFV6ZW9mNitkK0Jn?=
 =?utf-8?B?aFNMYTJmMDlMcGJIWUtTSndSV0NibTBFYXJ3Y2NCR29COGdLOHVlSkl2OEdV?=
 =?utf-8?B?ekdWU2VzangvRXN3UmlOWmhRaktkajRLaUc5TDNFRSthUXlYR1AxOWFvRVcr?=
 =?utf-8?B?SlA0ZGJaM2VFV0p3MDROZjV5VkltajBPbGtVcHNlb1I5SDZ6MHMvdkRkaVVG?=
 =?utf-8?B?eGRFbDYzK1c1U215TE5qdEc5SmVtT1lsWnNSQXUxMzR0WS9TWlBQZ1BtTFZh?=
 =?utf-8?B?WVpxTUNmQ0oxNGF3TDBHY2FMK05NOG9zWDJTUW0reVhyVlZKZmxkdU1LRGo2?=
 =?utf-8?B?Tkh3Kzh6YjdXQXFZODJSSVlsbkNQU2dmOCtqWFArUjVnQVdQeDEzbXJoTDVR?=
 =?utf-8?B?ckxRSTRFaVB0am5uSTlXUG1ZOVpua3ZBWXlNZ2dJQ0pocXZYemsyRUY4MVVk?=
 =?utf-8?Q?8ppWdHungC6s5zWpanpnitAkhN1kq9jaGBj6hPK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4173
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afcf4dd3-6642-4c7e-3216-08d91a977e40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QP6N4xhSog53DVHC+xRFBEhBJZF0p2u2EqLZ1EnJ2wfncnE+TxmzLdvMGWiVI41z3eEdRdsxmd/U/TN6f6zX61ogz9EmxGaaXM34uEE1DEGlQpHboyeqB0Mn4lxmNg06AfSnsylVV+WEdJnaNdYNHeAbgsu+RPN3TZBu+Y94lSvKGInsQK19XvWj8znTmriBbLT8eqmxdAptOiK2qHXzXiFaOSIGXz09kttzxpBXYySpZ/Fz6AZC2kNAtC69S6v93Io0zXJg1KJ6y0Xgcvy+wy0rIuZG6L5IyE3DPNLtWd/fInwHluJDHsHG7GBRzRsUb0c1/9zrklX0S2nPAUDPS8kGSiIGPLIWztEqBcmAFQ6hfUwPyFATRJJOLuHnqjhxdgK+H0e2JaRWK00niuzLTU6C48Ybgagphu5V6qSLPg+sf9un66K5DZcDnVWQ4QYx9HaCJmzVrn6+zZOrJZ3dU8ySUQE7lpf1/Ci/STxbSjFtV3iQfXCmTEdN2UKYHEV6WkheoF2VusXw4glRt8ukIKY+5zZhvj38nZ1C6L+D8LbedX8gRkQPFQHvjQVj+euXa2Vs7i3ZAgTLyV1F3HPYNgcCQqFsvx1LZqE/NrsEZ5vFAR/qICJtwec9T9vggzL4Bcfrk8QpB4d46efQO44y9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(36860700001)(8676002)(2906002)(70206006)(54906003)(70586007)(8936002)(186003)(110136005)(316002)(7696005)(52536014)(47076005)(5660300002)(4326008)(82740400003)(81166007)(55016002)(478600001)(86362001)(83380400001)(6506007)(53546011)(336012)(82310400003)(9686003)(33656002)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:27:09.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9fb75c-e93d-4c39-dbd8-08d91a978348
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3499

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDg6
MDYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDEwLzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWxsb2NhdGVfc3RhdGljX21lbW9yeQ0KPiANCj4g
SGkgUGVubnksDQo+IA0KPiBPbiAxOC8wNS8yMDIxIDA2OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGFsbG9jYXRlX3N0YXRpY19tZW1vcnkgdG8gYWxs
b2NhdGUgc3RhdGljDQo+ID4gbWVtb3J5IGFzIGd1ZXN0IFJBTSBmb3IgZG9tYWluIG9uIFN0YXRp
YyBBbGxvY2F0aW9uLg0KPiA+DQo+ID4gSXQgdXNlcyBhbGxvY19kb21zdGF0aWNfcGFnZXMgdG8g
YWxsb2NhdGUgcHJlLWRlZmluZWQgc3RhdGljIG1lbW9yeQ0KPiA+IGJhbmtzIGZvciB0aGlzIGRv
bWFpbiwgYW5kIHVzZXMgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSB0byBzZXQgdXAgUDJNDQo+ID4g
dGFibGUsIGd1ZXN0IHN0YXJ0aW5nIGF0IGZpeGVkIEdVRVNUX1JBTTBfQkFTRSwgR1VFU1RfUkFN
MV9CQVNFLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5n
QGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAx
NTcNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+ID4gaW5kZXggMzBiNTU1ODhiNy4uOWY2NjIzMTNhZCAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAtNDM3LDYgKzQzNyw1MCBAQCBzdGF0aWMgYm9vbCBfX2lu
aXQgYWxsb2NhdGVfYmFua19tZW1vcnkoc3RydWN0DQo+IGRvbWFpbiAqZCwNCj4gPiAgICAgICBy
ZXR1cm4gdHJ1ZTsNCj4gPiAgIH0NCj4gPg0KPiA+ICsvKg0KPiA+ICsgKiAjcmFtX2luZGV4IGFu
ZCAjcmFtX2luZGV4IHJlZmVyIHRvIHRoZSBpbmRleCBhbmQgc3RhcnRpbmcgYWRkcmVzcw0KPiA+
ICtvZiBndWVzdA0KPiA+ICsgKiBtZW1vcnkga2FuayBzdG9yZWQgaW4ga2luZm8tPm1lbS4NCj4g
PiArICogU3RhdGljIG1lbW9yeSBhdCAjc21mbiBvZiAjdG90X3NpemUgc2hhbGwgYmUgbWFwcGVk
ICNzZ2ZuLCBhbmQNCj4gPiArICogI3NnZm4gd2lsbCBiZSBuZXh0IGd1ZXN0IGFkZHJlc3MgdG8g
bWFwIHdoZW4gcmV0dXJuaW5nLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGJvb2wgX19pbml0IGFs
bG9jYXRlX3N0YXRpY19iYW5rX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJuZWxfaW5m
byAqa2luZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IHJhbV9pbmRleCwNCj4gDQo+IFBsZWFzZSB1c2UgdW5zaWduZWQuDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qg
cmFtX2FkZHIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2ZuX3QqIHNnZm4sDQo+IA0KPiBJIGFtIGNvbmZ1c2VkLCB3aGF0IGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gcmFtX2FkZHIgYW5kIHNnZm4/DQo+IA0KDQpXZSBuZWVkIHRvIGNvbnN0
cnVjdGluZyBraW5mby0+bWVtKGd1ZXN0IFJBTSBiYW5rcykgaGVyZSwgYW5kDQp3ZSBhcmUgaW5k
ZXhpbmcgaW4gc3RhdGljX21lbShwaHlzaWNhbCByYW0gYmFua3MpLiBNdWx0aXBsZSBwaHlzaWNh
bCByYW0NCmJhbmtzIGNvbnNpc3Qgb2Ygb25lIGd1ZXN0IHJhbSBiYW5rKGxpa2UsIEdVRVNUX1JB
TTApLiANCg0KcmFtX2FkZHIgIGhlcmUgd2lsbCBlaXRoZXIgYmUgR1VFU1RfUkFNMF9CQVNFLCBv
ciBHVUVTVF9SQU0xX0JBU0UsDQpmb3Igbm93LiBJIGtpbmRzIHN0cnVnZ2xlZCBpbiBob3cgdG8g
bmFtZSBpdC4gQW5kIG1heWJlIGl0IHNoYWxsIG5vdCBiZSBhDQpwYXJhbWV0ZXIgaGVyZS4NCg0K
TWF5YmUgSSBzaG91bGQgc3dpdGNoLi4gY2FzZS4uIG9uIHRoZSByYW1faW5kZXgsIGlmIGl0cyAw
LCBpdHMgR1VFU1RfUkFNMF9CQVNFLA0KQW5kIGlmIGl0cyAxLCBpdHMgR1VFU1RfUkFNMV9CQVNF
Lg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWZuX3Qgc21mbiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYWRkcl90IHRvdF9zaXplKSB7DQo+ID4gKyAgICBpbnQgcmVzOw0KPiA+ICsgICAg
c3RydWN0IG1lbWJhbmsgKmJhbms7DQo+ID4gKyAgICBwYWRkcl90IF9zaXplID0gdG90X3NpemU7
DQo+ID4gKw0KPiA+ICsgICAgYmFuayA9ICZraW5mby0+bWVtLmJhbmtbcmFtX2luZGV4XTsNCj4g
PiArICAgIGJhbmstPnN0YXJ0ID0gcmFtX2FkZHI7DQo+ID4gKyAgICBiYW5rLT5zaXplID0gYmFu
ay0+c2l6ZSArIHRvdF9zaXplOw0KPiA+ICsNCj4gPiArICAgIHdoaWxlICggdG90X3NpemUgPiAw
ICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIgPSBnZXRfYWxs
b2NhdGlvbl9zaXplKHRvdF9zaXplKTsNCj4gPiArDQo+ID4gKyAgICAgICAgcmVzID0gZ3Vlc3Rf
cGh5c21hcF9hZGRfcGFnZShkLCAqc2dmbiwgc21mbiwgb3JkZXIpOw0KPiA+ICsgICAgICAgIGlm
ICggcmVzICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X0VSUiwgIkZhaWxlZCBtYXAgcGFnZXMgdG8gRE9NVTogJWQiLCByZXMpOw0KPiA+ICsgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAq
c2dmbiA9IGdmbl9hZGQoKnNnZm4sIDFVTCA8PCBvcmRlcik7DQo+ID4gKyAgICAgICAgc21mbiA9
IG1mbl9hZGQoc21mbiwgMVVMIDw8IG9yZGVyKTsNCj4gPiArICAgICAgICB0b3Rfc2l6ZSAtPSAo
MVVMTCA8PCAoUEFHRV9TSElGVCArIG9yZGVyKSk7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsg
ICAga2luZm8tPm1lbS5ucl9iYW5rcyA9IHJhbV9pbmRleCArIDE7DQo+ID4gKyAgICBraW5mby0+
dW5hc3NpZ25lZF9tZW0gLT0gX3NpemU7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHRydWU7DQo+
ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCBfX2luaXQgYWxsb2NhdGVfbWVtb3J5KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbw0KPiAqa2luZm8pDQo+ID4gICB7DQo+
ID4gICAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gQEAgLTQ4MCw2ICs1MjQsMTE2IEBAIGZhaWw6
DQo+ID4gICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpa2luZm8tPnVuYXNzaWduZWRfbWVtID4+
IDEwKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICsvKiBBbGxvY2F0ZSBtZW1vcnkgZnJvbSBzdGF0aWMg
bWVtb3J5IGFzIFJBTSBmb3Igb25lIHNwZWNpZmljIGRvbWFpbg0KPiA+ICtkLiAqLyBzdGF0aWMg
dm9pZCBfX2luaXQgYWxsb2NhdGVfc3RhdGljX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJu
ZWxfaW5mbw0KPiA+ICsqa2luZm8pIHsNCj4gPiArICAgIGludCBucl9iYW5rcywgX2JhbmtzID0g
MDsNCj4gDQo+IEFGQUlDVCwgX2JhbmtzIGlzIHRoZSBpbmRleCBpbiB0aGUgYXJyYXkuIEkgdGhp
bmsgaXQgd291bGQgYmUgY2xlYXJlciBpZiBpdCBpcw0KPiBjYWxsZXIgJ2JhbmsnIG9yICdpZHgn
Lg0KPiANCg0KU3VyZSwgSeKAmWxsIHVzZSB0aGUgJ2JhbmsnIGhlcmUuDQoNCj4gPiArICAgIHNp
emVfdCByYW0wX3NpemUgPSBHVUVTVF9SQU0wX1NJWkUsIHJhbTFfc2l6ZSA9IEdVRVNUX1JBTTFf
U0laRTsNCj4gPiArICAgIHBhZGRyX3QgYmFua19zdGFydCwgYmFua19zaXplOw0KPiA+ICsgICAg
Z2ZuX3Qgc2dmbjsNCj4gPiArICAgIG1mbl90IHNtZm47DQo+ID4gKw0KPiA+ICsgICAga2luZm8t
Pm1lbS5ucl9iYW5rcyA9IDA7DQo+ID4gKyAgICBzZ2ZuID0gZ2FkZHJfdG9fZ2ZuKEdVRVNUX1JB
TTBfQkFTRSk7DQo+ID4gKyAgICBucl9iYW5rcyA9IGQtPmFyY2guc3RhdGljX21lbS5ucl9iYW5r
czsNCj4gPiArICAgIEFTU0VSVChucl9iYW5rcyA+PSAwKTsNCj4gPiArDQo+ID4gKyAgICBpZiAo
IGtpbmZvLT51bmFzc2lnbmVkX21lbSA8PSAwICkNCj4gPiArICAgICAgICBnb3RvIGZhaWw7DQo+
ID4gKw0KPiA+ICsgICAgd2hpbGUgKCBfYmFua3MgPCBucl9iYW5rcyApDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgYmFua19zdGFydCA9IGQtPmFyY2guc3RhdGljX21lbS5iYW5rW19iYW5rc10u
c3RhcnQ7DQo+ID4gKyAgICAgICAgc21mbiA9IG1hZGRyX3RvX21mbihiYW5rX3N0YXJ0KTsNCj4g
PiArICAgICAgICBiYW5rX3NpemUgPSBkLT5hcmNoLnN0YXRpY19tZW0uYmFua1tfYmFua3NdLnNp
emU7DQo+IA0KPiBUaGUgdmFyaWFibGUgbmFtZSBhcmUgc2xpZ2h0bHkgY29uZnVzaW5nIGJlY2F1
c2UgaXQgZG9lc24ndCB0ZWxsIHdoZXRoZXIgdGhpcw0KPiBpcyBwaHlzaWNhbCBhcmUgZ3Vlc3Qg
UkFNLiBZb3UgbWlnaHQgd2FudCB0byBjb25zaWRlciB0byBwcmVmaXggdGhlbSB3aXRoIHANCj4g
KHJlc3AuIGcpIGZvciBwaHlzaWNhbCAocmVzcC4gZ3Vlc3QpIFJBTS4NCg0KU3VyZSwgSSdsbCBy
ZW5hbWUgdG8gbWFrZSBpdCBtb3JlIGNsZWFybHkuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAg
IGlmICggIWFsbG9jX2RvbXN0YXRpY19wYWdlcyhkLCBiYW5rX3NpemUgPj4gUEFHRV9TSElGVCwg
YmFua19zdGFydCwNCj4gMCkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19FUlINCj4gPiArICAgICAgICAgICAgICAgICAgICAiJXBkOiBjYW5ub3QgYWxs
b2NhdGUgc3RhdGljIG1lbW9yeSINCj4gPiArICAgICAgICAgICAgICAgICAgICAiKDB4JSJQUkl4
NjQiIC0gMHglIlBSSXg2NCIpIiwNCj4gDQo+IGJhbmtfc3RhcnQgYW5kIGJhbmtfc2l6ZSBhcmUg
Ym90aCBwYWRkcl90LiBTbyB0aGlzIHNob3VsZCBiZSBQUklwYWRkci4NCg0KU3VyZSwgSSdsbCBj
aGFuZ2UNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICBkLCBiYW5rX3N0YXJ0LCBiYW5r
X3N0YXJ0ICsgYmFua19zaXplKTsNCj4gPiArICAgICAgICAgICAgZ290byBmYWlsOw0KPiA+ICsg
ICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBCeSBkZWZh
dWx0LCBpdCBzaGFsbCBiZSBtYXBwZWQgdG8gdGhlIGZpeGVkIGd1ZXN0IFJBTSBhZGRyZXNzDQo+
ID4gKyAgICAgICAgICogYEdVRVNUX1JBTTBfQkFTRWAsIGBHVUVTVF9SQU0xX0JBU0VgLg0KPiA+
ICsgICAgICAgICAqIFN0YXJ0aW5nIGZyb20gUkFNMChHVUVTVF9SQU0wX0JBU0UpLg0KPiA+ICsg
ICAgICAgICAqLw0KPiANCj4gT2suIFNvIHlvdSBhcmUgZmlyc3QgdHJ5aW5nIHRvIGV4aGF1c3Qg
dGhlIGd1ZXN0IGJhbmsgMCBhbmQgdGhlbiBtb3ZlZCB0bw0KPiBiYW5rIDEuIFRoaXMgd2Fzbid0
IGVudGlyZWx5IGNsZWFyIGZyb20gdGhlIGRlc2lnbiBkb2N1bWVudC4NCj4gDQo+IEkgYW0gZmlu
ZSB3aXRoIHRoYXQsIGJ1dCBpbiB0aGlzIGNhc2UsIHRoZSBkZXZlbG9wcGVyIHNob3VsZCBub3Qg
bmVlZCB0byBrbm93DQo+IHRoYXQgKGluIGZhY3QgdGhpcyBpcyBub3QgcGFydCBvZiB0aGUgQUJJ
KS4NCj4gDQo+IFJlZ2FyZGluZyB0aGlzIGNvZGUsIEkgYW0gYSBiaXQgY29uY2VybmVkIGFib3V0
IHRoZSBzY2FsYWJpbGl0eSBpZiB3ZSBpbnRyb2R1Y2UNCj4gYSBzZWNvbmQgYmFuay4NCj4gDQo+
IENhbiB3ZSBoYXZlIGFuIGFycmF5IG9mIHRoZSBwb3NzaWJsZSBndWVzdCBiYW5rcyBhbmQgaW5j
cmVtZW50IHRoZSBpbmRleA0KPiB3aGVuIGV4aGF1c3RpbmcgdGhlIGN1cnJlbnQgYmFuaz8NCj4g
DQoNCkNvcnJlY3QgbWUgaWYgSSB1bmRlcnN0YW5kIHdyb25nbHksIA0KDQpXaGF0IHlvdSBzdWdn
ZXN0IGhlcmUgaXMgdGhhdCB3ZSBtYWtlIGFuIGFycmF5IG9mIGd1ZXN0IGJhbmtzLCByaWdodCBu
b3csIGluY2x1ZGluZw0KR1VFU1RfUkFNMCBhbmQgR1VFU1RfUkFNMS4gQW5kIGlmIGxhdGVyLCBh
ZGRpbmcgbW9yZSBndWVzdCBiYW5rcywgaXQgd2lsbCBub3QNCmJyaW5nIHNjYWxhYmlsaXR5IHBy
b2JsZW0gaGVyZSwgcmlnaHQ/DQoNCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg0KQ2hlZXJzDQoNClBlbm55IFpoZW5nDQo=

