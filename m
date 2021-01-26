Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63898303B11
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74834.134538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MB6-0000z5-2C; Tue, 26 Jan 2021 11:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74834.134538; Tue, 26 Jan 2021 11:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MB5-0000yi-Ub; Tue, 26 Jan 2021 11:06:31 +0000
Received: by outflank-mailman (input) for mailman id 74834;
 Tue, 26 Jan 2021 11:06:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55K9=G5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l4MB4-0000yc-1b
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:06:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id add1ce59-b34a-46f0-8f3b-43f7663d9533;
 Tue, 26 Jan 2021 11:06:27 +0000 (UTC)
Received: from AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) by PA4PR08MB6046.eurprd08.prod.outlook.com
 (2603:10a6:102:e4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 11:06:25 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::7b) by AM6PR01CA0051.outlook.office365.com
 (2603:10a6:20b:e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Tue, 26 Jan 2021 11:06:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 11:06:25 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Tue, 26 Jan 2021 11:06:24 +0000
Received: from a5e0a98c03aa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18E528B1-DAF4-4301-ACC3-9C5F0029F34A.1; 
 Tue, 26 Jan 2021 11:06:19 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5e0a98c03aa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jan 2021 11:06:19 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 11:06:17 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 11:06:17 +0000
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
X-Inumbo-ID: add1ce59-b34a-46f0-8f3b-43f7663d9533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MPQXDASd9pvLvWQ9AvBmvIXbuqMuS+G7+m13q15wK4=;
 b=XoONI0MFcb9E/ViygCaZrXiKupNDGjS4vU4GrYEiCfkWgUAE43fYhW9bZf9PWGxpBSbVtl06qp65hDwNg8xEq5C8e9AcRhj17n4lw4DCAuaDvtQBceOpmSGBT0jGn8ntMModOaEi81HIEm1QerNWJcHSEm2lLo1Y7gy0+MdJ7ck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64495a000aa77a2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWhwQNVUeqgPWSjdUIfQPpRIdifeGYNDbYfr6fAD9AqvgzTanGWuTzRerVmW/rSpdDHStpKGFNWB+4B6nsNs5ISmbm68SFtXjCha99C+/zlktfdcysSjLnGAGkmg+aWb24CxCr96vmNzcstZKp7ZbDO1MfGmLd1oPpdjQaTHAHsSQyfl6Eer7ttBQFe7jo3QUR4fqH8EHHm2Yby9H0KzNIc60c9mk2TmnGj3tCBUmG7VeZyU/dPOnNJ+IntHQENaFhxL+N1vakTjSbCffeVqTYb8TYMYLmiQlxpVjt2ZxagwVcq6WjReykpeC2bY/JTswpsCvrEo2tZa31X9EdUyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MPQXDASd9pvLvWQ9AvBmvIXbuqMuS+G7+m13q15wK4=;
 b=h6Mzg08Oq8aFd/Ea9TpIpkVf4dxgKm9/v39gyApGpfa8kWdyKfa4fAR2m4LW4iI5yPLyN7ObBRo3fUgCLW1ILhw3wyn3UQKvkLD3NaSlrI1BAnvbecsPTzvH04H2ETP3x08Kalc9Bm8FdIWvATiKr2UEnsR/KHYlIGquru9/6VNN9kMlWnVmbSf6tn70StU88CXxB1ZynYF1SBr0FottYj2eBwWvMElMQYDv1whQpW1TxxBSbuVvBLu1r1M9T9bckrOSMfV9wO9pAHVCMLLToSHc4K5xoKaQwHIijSs0qiSlyTuwXnHAPG/XKPNItFkcD7r3OmIKw7vWAM/6ydQeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MPQXDASd9pvLvWQ9AvBmvIXbuqMuS+G7+m13q15wK4=;
 b=XoONI0MFcb9E/ViygCaZrXiKupNDGjS4vU4GrYEiCfkWgUAE43fYhW9bZf9PWGxpBSbVtl06qp65hDwNg8xEq5C8e9AcRhj17n4lw4DCAuaDvtQBceOpmSGBT0jGn8ntMModOaEi81HIEm1QerNWJcHSEm2lLo1Y7gy0+MdJ7ck=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHW82EN9R2ynrmbqk6EAVX0Oyalkao5otWAgAAc8QA=
Date: Tue, 26 Jan 2021 11:06:17 +0000
Message-ID: <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
In-Reply-To: <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 436df05f-e3c2-484c-7d18-08d8c1ea6c37
x-ms-traffictypediagnostic: VI1PR08MB5423:|PA4PR08MB6046:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6046F5A76C54D2BD4538E4159DBC0@PA4PR08MB6046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zsn27aJHV+oS9Z+teRkUuRwowXTBP0gtjT1JlfcRZ+VVOxxu4khIIanANwL4OM3+PNDSn0Z1enHznbKHEqJQ7Uvjf94av6BBm0w2diTJf5gRRZ0H46mLteBHkXjqE5GvAuojhluZ3sDlSmv437ngQbmXMnqjA5izPTMs6W19kCMZIpoXU10hHMVmfHBX86LQAcu3HcEa6IjrnjUTqxTtMh8CSzl1MpYdMHcMKyK+ZkIg2Va4AApSszBePMyWCBvxE8p1cPFfq2D8agKLyj0E8Yy81FqcB6k5LN5bjHf0uy7UStMomJbwW01j5JiA/nvxf5pshX0Wr3wwofpZXMVd1AT5JfjE0HY/EA2XdcWBlHGw0Euo8HZQ5DjcIpKEecmZd6b8SmcoCrQsuXespB/lw7qvLV36+vYwsThzigB7U270A5zolvqtMq66aVeWB/TzIPq2WtccyTdFaskZfl7Tccez1jgW1ymxVFKwTTyi2DzRijuiOYqHABcSz6d+AiGmdeAVx3//AeYoCvEJokOW+6yj0tUQ8PTwJcj54JqLopM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(396003)(136003)(966005)(186003)(26005)(33656002)(55236004)(6916009)(83380400001)(6506007)(8936002)(36756003)(316002)(66476007)(5660300002)(66556008)(66446008)(91956017)(54906003)(66946007)(76116006)(4326008)(8676002)(64756008)(71200400001)(53546011)(478600001)(86362001)(6486002)(2906002)(2616005)(6512007)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NmVSNEF0Qkh6dk55akZzTTJXclBvTFRmOTlocmQyazFJZHk4RkJMd3lkVjFx?=
 =?utf-8?B?T0NaOXRNT2UzWlpwYjlqMS9VeTd6azNrT2VVUjJWV251ekdkLzUyVDE5ZUc1?=
 =?utf-8?B?S0dPWUZSL2NpTldwajMyMlQ0d01NUjJyc1ZsTHY1d0pJMkpYMFFoZmZLb0hV?=
 =?utf-8?B?c01hMGkzVzV6SGNkTENnSmsvNjd4SXAweWhjMUJ1MDdtUU9hZmZkOHNXUU4v?=
 =?utf-8?B?M3dXWWVkeDBOR0JxRExQeEZKeGI0c3R6TjZ5c3NEWHJjTkZCTUkwMXp0V2JO?=
 =?utf-8?B?ME5nRVlBOFNOdUlGMlBQdUN5cUdRWjlvZklWUEVZWDNlMHBVSlZQR1NNYjlR?=
 =?utf-8?B?MGc3bU9xSnhKeExLeFFlK2sxVGZTRC9Yc21tRGFIbGJhS0ZZNVJWaUlrYW9U?=
 =?utf-8?B?YTBoUVVIQklxMFN5YU1vSENONmJnNEx0TVdFbW9BbWdoc2oxT0ZmYTh6MGV5?=
 =?utf-8?B?di9DMHR6TGtWVFpsR1hFTXkwZUxSSzJxRFhxWThQK1Ezd2swWEpYWEx2clRX?=
 =?utf-8?B?ekc4dStwMEVDeE9PdkN1OVlqYms5aThRRlBtOUNDak5rTXQxekxOajNLRm5a?=
 =?utf-8?B?NVhlM2Z1QnVKYVFKYlNzUmR4ZmJBUGNpZjMvUHpWcFhKSDNWTW5BcTYvZHls?=
 =?utf-8?B?VXhNT0ZGT2cwc1p0NzRnTmNzNENqZTRSTXpISGk0NW5WdFZYU1JYVEV0Mmhi?=
 =?utf-8?B?UFpOT1RHK0N0ckdPQnl2cjVFa2VqWElubTRrWkxOK1hucUoxUEpDZWtaa00v?=
 =?utf-8?B?Q2RGWFovMDBFa1lJdDNsRjMxTHJJY2pncU1LaVNkMlJPR1p6SXEzSk9nSVo5?=
 =?utf-8?B?TmZxY1grdXU0MERmOTBucHNCM3d6OWVMcGF6NlVPclF3RlVWcU9Ia3o5dTdS?=
 =?utf-8?B?RnE0b0VtMHdoMnl2M0pSdlRhL1JtWWN2a1JKN1dQTkhIZjRrYU5rS1JrVSty?=
 =?utf-8?B?RlZJQmpjVEx6eUFVVGo2bXpZdjlybVpRUitwRFlSZ2xjSXQ3OGltM2l5blJJ?=
 =?utf-8?B?anl6T2phc0hwOEQrQU1WNU9HejlPQjd0dXFBTHhDZlZpamJiUnI1d1AyQlpI?=
 =?utf-8?B?Yk9CdXNtcTEyU2xLdFJYQVJ1WXZHckZFOHB5clUwc2tlMnJqYjRXOGNRMFNZ?=
 =?utf-8?B?TzB0bGdIUmZjelZoRHYxbFRRZEh3dmRjTkhaSDFNczJ2WXZReTVvRHRiaHcz?=
 =?utf-8?B?TkJCUkxZRmQrVGdCclBlRFBhc1Mxd2h6ZXBQUXNuWUxzV3JVOEZUWktwcWhY?=
 =?utf-8?B?dDhkb09rUmtpbXNrN0Rvd0lFaE9LR1hadGkzTEJCeEkvZ204bVdmb09DUnk2?=
 =?utf-8?B?ZjBKQlIrMWljbml5Q2l2ZkFwRjl5ZWRSKzI4bGpjV3NJVXFnZGdYaUYzRHp4?=
 =?utf-8?B?MmVVODB0VTZVUzcyWmRPTzFSTGQxWFlISGxzNkdKS1oxQnN6YWZMejdWcUF0?=
 =?utf-8?Q?7u7Sa/Q0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <26FD6B576166044F91FB3DCB37D86ADD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e66d61af-1fe3-48db-abda-08d8c1ea6795
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wW4qRkeQhGRWG+w9TFwyexMRc9jc6jWe5oVi4Tqq4VJ/+YoITUN+BX4eUJWH0pOCs52K0fCoF3/5y/oWTzwGYuabke+yqRV3ptS/4B1DDKntM6z0fsVZTbV7pka/kxc4LK13U6WwIQEneMXSkkg767p32D2CqM5gYQWdlY0oA9EkuUUlcBm68fKk4kVTjIPTx+jbrFxEFMtNimU6FtfF57KLODH4qqgEDaI+m0N4r0O4v09eRmLT5adF5qIjOu/mnKhLgm+RUHdE8LXgQ3oworbuH+okVu7nlaf89U+rcuah2EueY47K0r1CUqOaPCVO2sUqeRHoZjs11N6jji7igX7t8LlPNa+X7wy4e/j0zDqVU0z70y90+010JgrzrMh7AIGJetK34zrsO32/Ebj+7TZH+7y3FoOzziXGA1aiv514KbtWOEE3MUcOzXavyN1lBZ206rFFeYCZ5lG6z0bRdIADpRaACXUU20IKpZi2ZRrd459OFCTiCU5D1hQQmBG/SEWNxfM4yKFNkjiMwPYPSvvMUIIQ0rf5de11duMWgiHR3hQpVgslm3LidJvR+gB5jr97m24EfmxluZEc84SKExZ0rkh4c4vzPI4EWIaA71RslKISqHOis4JGSdJpSNsG5NQwxoHx8r7VMOXoxaNpxXDtBtIdvn6JBDUpOzt40IJpIzCaJBtkMgjnFw8ZuEf45XqtvMwMd66FqLiocAAAHQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(83380400001)(54906003)(70586007)(6486002)(2616005)(966005)(8936002)(6512007)(8676002)(82740400003)(81166007)(5660300002)(356005)(53546011)(6506007)(36756003)(4326008)(55236004)(186003)(82310400003)(26005)(6862004)(47076005)(86362001)(336012)(478600001)(70206006)(33656002)(316002)(2906002)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:06:25.3239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 436df05f-e3c2-484c-7d18-08d8c1ea6c37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046

SGksDQoNCj4gT24gMjYgSmFuIDIwMjEsIGF0IDA5OjIyLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDEuMjAyMSAyMjoyNywgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4gQSByZWNlbnQgdGhyZWFkIFsxXSBoYXMgZXhwb3NlZCBhIGNvdXBs
ZSBvZiBpc3N1ZXMgd2l0aCBvdXIgY3VycmVudCB3YXkNCj4+IG9mIGhhbmRsaW5nIEVYUEVSVC4N
Cj4+IA0KPj4gMSkgSXQgaXMgbm90IG9idmlvdXMgdGhhdCAiQ29uZmlndXJlIHN0YW5kYXJkIFhl
biBmZWF0dXJlcyAoZXhwZXJ0DQo+PiB1c2VycykiIGlzIGFjdHVhbGx5IHRoZSBmYW1vdXMgRVhQ
RVJUIHdlIGtlZXAgdGFsa2luZyBhYm91dCBvbiB4ZW4tZGV2ZWwNCj4+IA0KPj4gMikgSXQgaXMg
bm90IG9idmlvdXMgd2hlbiB3ZSBuZWVkIHRvIGVuYWJsZSBFWFBFUlQgdG8gZ2V0IGEgc3BlY2lm
aWMNCj4+IGZlYXR1cmUNCj4+IA0KPj4gSW4gcGFydGljdWxhciBpZiB5b3Ugd2FudCB0byBlbmFi
bGUgQUNQSSBzdXBwb3J0IHNvIHRoYXQgeW91IGNhbiBib290DQo+PiBYZW4gb24gYW4gQUNQSSBw
bGF0Zm9ybSwgeW91IGhhdmUgdG8gZW5hYmxlIEVYUEVSVCBmaXJzdC4gQnV0IHNlYXJjaGluZw0K
Pj4gdGhyb3VnaCB0aGUga2NvbmZpZyBtZW51IGl0IGlzIHJlYWxseSBub3QgY2xlYXIgKHR5cGUg
Jy8nIGFuZCAiQUNQSSIpOg0KPj4gbm90aGluZyBpbiB0aGUgZGVzY3JpcHRpb24gdGVsbHMgeW91
IHRoYXQgeW91IG5lZWQgdG8gZW5hYmxlIEVYUEVSVCB0bw0KPj4gZ2V0IHRoZSBvcHRpb24uDQo+
PiANCj4+IFNvIHRoaXMgcGF0Y2ggbWFrZXMgdGhpbmdzIGVhc2llciBieSBkb2luZyB0d28gdGhp
bmdzOg0KPj4gDQo+PiAtIGludHJvZHVjZSBhIG5ldyBrY29uZmlnIG9wdGlvbiBVTlNVUFBPUlRF
RCB3aGljaCBpcyBjbGVhcmx5IHRvIGVuYWJsZQ0KPj4gIFVOU1VQUE9SVEVEIGZlYXR1cmVzIGFz
IGRlZmluZWQgYnkgU1VQUE9SVC5tZA0KPj4gDQo+PiAtIGNoYW5nZSBFWFBFUlQgb3B0aW9ucyB0
byBVTlNVUFBPUlRFRCB3aGVyZSBpdCBtYWtlcyBzZW5zZToga2VlcA0KPj4gIGRlcGVuZGluZyBv
biBFWFBFUlQgZm9yIGZlYXR1cmVzIG1hZGUgZm9yIGV4cGVydHMNCj4+IA0KPj4gLSB0YWcgdW5z
dXBwb3J0ZWQgZmVhdHVyZXMgYnkgYWRkaW5nIChVTlNVUFBPUlRFRCkgdG8gdGhlIG9uZS1saW5l
DQo+PiAgZGVzY3JpcHRpb24NCj4+IA0KPj4gLSBjbGFyaWZ5IHRoZSBFWFBFUlQgb25lLWxpbmUg
ZGVzY3JpcHRpb24NCj4+IA0KPj4gWzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZt
PTE2MDMzMzEwMTIyODk4MQ0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5k
IE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0KQW5zd2VyaW5nIHRvIEphbi4u
Lg0KDQo+IA0KPiBOb24tQXJtIGJpdHMNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gSG93ZXZlciwgSSBoYXZlIHF1ZXN0aW9ucyBvbiB0aGUgQXJtIG9u
ZXMgKHNvcnJ5IGZvciBub3Qgbm90aWNpbmcNCj4gZWFybGllciwgYXMgSSBhc3N1bWUgaXQgd2Fz
IHRoaXMgd2F5IGJlZm9yZSBhbHJlYWR5KToNCj4gDQo+PiBAQCAtNzcsNyArNzcsNyBAQCBjb25m
aWcgU0JTQV9WVUFSVF9DT05TT0xFDQo+PiAJICBTQlNBIEdlbmVyaWMgVUFSVCBpbXBsZW1lbnRz
IGEgc3Vic2V0IG9mIEFSTSBQTDAxMSBVQVJULg0KPj4gDQo+PiBjb25maWcgQVJNX1NTQkQNCj4+
IC0JYm9vbCAiU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzIERpc2FibGUiIGlmIEVYUEVSVA0KPj4g
Kwlib29sICJTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgRGlzYWJsZSAoVU5TVVBQT1JURUQpIiBp
ZiBVTlNVUFBPUlRFRA0KPj4gCWRlcGVuZHMgb24gSEFTX0FMVEVSTkFUSVZFDQo+PiAJZGVmYXVs
dCB5DQo+PiAJaGVscA0KPj4gQEAgLTg3LDcgKzg3LDcgQEAgY29uZmlnIEFSTV9TU0JEDQo+PiAJ
ICBJZiB1bnN1cmUsIHNheSBZLg0KPj4gDQo+PiBjb25maWcgSEFSREVOX0JSQU5DSF9QUkVESUNU
T1INCj4+IC0JYm9vbCAiSGFyZGVuIHRoZSBicmFuY2ggcHJlZGljdG9yIGFnYWluc3QgYWxpYXNp
bmcgYXR0YWNrcyIgaWYgRVhQRVJUDQo+PiArCWJvb2wgIkhhcmRlbiB0aGUgYnJhbmNoIHByZWRp
Y3RvciBhZ2FpbnN0IGFsaWFzaW5nIGF0dGFja3MgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JU
RUQNCj4+IAlkZWZhdWx0IHkNCj4+IAloZWxwDQo+PiAJICBTcGVjdWxhdGlvbiBhdHRhY2tzIGFn
YWluc3Qgc29tZSBoaWdoLXBlcmZvcm1hbmNlIHByb2Nlc3NvcnMgcmVseSBvbg0KPiANCj4gQm90
aCBvZiB0aGVzZSBkZWZhdWx0IHRvIHkgYW5kIGhhdmUgdGhlaXIgX3Byb21wdF8NCj4gY29uZGl0
aW9uYWwgdXBvbiBFWFBFUlQuIFdoaWNoIG1lYW5zIG9ubHkgYW4gZXhwZXJ0IGNhbiB0dXJuIHRo
ZW0NCj4gX29mZl8uIFdoaWNoIGRvZXNuJ3QgbWFrZSBpdCBsb29rIGxpa2UgdGhlc2UgYXJlIHVu
c3VwcG9ydGVkPyBPcg0KPiBpZiBhbnl0aGluZywgdHVybmluZyB0aGVtIG9mZiBpcyB1bnN1cHBv
cnRlZD8NCg0KLi4uWW91IGNvdWxkIHNlZSB0aGF0IGFzIEVYUEVSVC9VTlNVUFBPUlRFRCBvcHRp
b25zIGNhbiBvbmx5IGJlDQog4oCcbW9kaWZpZWTigJ0gZnJvbSB0aGVpciBkZWZhdWx0IHZhbHVl
IGlmIEVYUEVSVC9VTlNVUFBPUlRFRCBpcyBhY3RpdmF0ZWQuDQpTbyBJIGZpbmQgdGhlIGN1cnJl
bnQgc29sdXRpb24gb2suDQoNCklmIHRoaXMgaXMgYSBwcm9ibGVtIHdlIGNvdWxkIGFsc28gY2hh
bmdlIHRob3NlIG9wdGlvbnMgdG8gYmUgZGVmYXVsdCB0byBfb2ZmXyBieSByZW5hbWluZyB0aGVt
IHRvIGNvbmZpZyBESVNBQkxFX3h4eHgNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBKYW4N
Cg0K

