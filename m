Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F23571BC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 18:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106809.204229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAiq-0001rs-OA; Wed, 07 Apr 2021 16:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106809.204229; Wed, 07 Apr 2021 16:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAiq-0001rS-Jx; Wed, 07 Apr 2021 16:08:04 +0000
Received: by outflank-mailman (input) for mailman id 106809;
 Wed, 07 Apr 2021 16:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IknL=JE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lUAio-0001rL-Rg
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:08:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4f05e9a-e512-4e89-92fa-47e48650d165;
 Wed, 07 Apr 2021 16:08:01 +0000 (UTC)
Received: from AM6P194CA0102.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::43)
 by PA4PR08MB6288.eurprd08.prod.outlook.com (2603:10a6:102:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 16:07:50 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::3d) by AM6P194CA0102.outlook.office365.com
 (2603:10a6:209:8f::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 16:07:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 16:07:50 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 07 Apr 2021 16:07:49 +0000
Received: from 5ca2be969a24.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAE88B4D-9723-4EFD-98A1-50BA18D99236.1; 
 Wed, 07 Apr 2021 16:07:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ca2be969a24.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 16:07:43 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 16:07:41 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 16:07:41 +0000
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
X-Inumbo-ID: b4f05e9a-e512-4e89-92fa-47e48650d165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amgov6jNIxbtMFAnjEVxzR9nnPjqcmUb+nfviCse9VM=;
 b=RvYGhmepHaWozzoMwZU1wVDG+GTw7UR6AteC6thKGb5bZ4zFIPDinAYg9o4gpPyyO5rpjoVvLTS4/koZGo9z9EnsXis+iFRY+Ezrk+Mip7Twum2HEFGfMTRXmxUNLPl8fcjFZje6cIrBNh9/dtiFL0NFZ9InAUL95vD/6FwCuXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ace30db08d4518b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0zoPeOcJ5xnTLYGNXblnSC/jv1YrZjeQa6PQeNVmD8t5fOqams3WfBWYxk/6B0oUVEK+p/btg2hHyB0ri3NaiX8s6eweFYf/1MlZ1SAzG7RkZ1Q1iTl55/PcptFNyJHUqUj5LGE39Woj+gVwPm6CirvlvzFQ1f4lpo4tGMzVelbwySPi3YK6t3b6oJ79+5uzo4AH9znQSsFhWLUhA8A4QL0SeMOoopAxTNy8zBGZTpI+wAE9kEkHXPVXCd2TCRIH/hmerniYhdwcLWUpFzaZgXWuZSrUdU+BHWfrD3NGvHQGnpaq5P7sibUb3S0g0NTG5cipJs9095la7//gJeIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amgov6jNIxbtMFAnjEVxzR9nnPjqcmUb+nfviCse9VM=;
 b=JoWHKH94Vw8/18C76+QpBR1rMpT+pyA/Z69CMvQC+dgi8Z5zACDoYcpOa0RUNy6OgXrvONqB0/TvohCxm2H/vuswiXpGyNt6phh1J5SzAPfgVD0WCesd5zp9DqfU0255oDF7nhuzRpajeKIKS6wzB3YmtyNHxfzGsu3/PSZiPOOR2MICEDhgDa4XWnBu/6SPmjzKUAK2eSgy5bzq58CSX+27gLFvU1U0Ns/PNPA4k690drPkA+oVZEwdd1tV2vEOO767jbBWCNiYntj3HodiQ6gue/FiTmE4thjhJZ8dECXM9Vdlhfs5cnR3uEXFJ9SUPCapg5TeB+tQApsomX+OzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amgov6jNIxbtMFAnjEVxzR9nnPjqcmUb+nfviCse9VM=;
 b=RvYGhmepHaWozzoMwZU1wVDG+GTw7UR6AteC6thKGb5bZ4zFIPDinAYg9o4gpPyyO5rpjoVvLTS4/koZGo9z9EnsXis+iFRY+Ezrk+Mip7Twum2HEFGfMTRXmxUNLPl8fcjFZje6cIrBNh9/dtiFL0NFZ9InAUL95vD/6FwCuXg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
Thread-Topic: [PATCH 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
Thread-Index:
 AQHXKtDW6d1uIaHDNEirYTRFGCHHX6qpCgoAgAABvgCAACFYgIAAAteAgAAHEwCAAAOYAA==
Date: Wed, 7 Apr 2021 16:07:41 +0000
Message-ID: <EAF4C93B-F35C-42DA-9AE2-4F1B8D238B25@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <24685.52599.234444.705703@mariner.uk.xensource.com>
 <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
 <47b84686-faac-cfc4-44ae-d6f844bc7d0a@suse.com>
In-Reply-To: <47b84686-faac-cfc4-44ae-d6f844bc7d0a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [212.20.154.75]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b275db5f-d008-4249-7ffd-08d8f9df4af6
x-ms-traffictypediagnostic: VE1PR08MB5662:|PA4PR08MB6288:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB628806448925C02D58E0F57B9D759@PA4PR08MB6288.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hTLxhTBRich27T/zg5y674bM8ENYgm49rwmCd2ndV/YiYMR9APFVNdT6NdPQr7O3KHTBNlsZX+cBRpo+X/vskZo1/tmc8nyjfFFzPKB//TH0opkldNth2Qyph314osgXYFP0xUcUZhW84mHFAeX/1MHqox0yTifJbmYKGBE9abAVdRxt/rR5aWsFjsBOLxOMNknNuVb9eFKPDzd4/K3xj9SIxggMSz1RYZcrlM0ncvRaX63Wj7I2ge/X9i2wUVPuQeSLyck70DBG2N23j1MKTyMSu9Fzb8/nxIxZzcWiNxyKT35mGdyW2q77tMYZddayYN9mn8LEV24xhRSl432RUQjziyLM+hXqHwehRW8fCRRWjOueTUSOxfYFHjxFrwkEN7XbOgMs8uUDKs93IN3qI8Ml/Yz1hwMWjQ5+Xk0NanWldBhYOBwi25c1LZ3v/9qaKv6//SmatBTKPTIR2933UT2XImLt5b6VML18Wc3isUTqy0BGsMRj8mkKJj7Lokr4OY1CtYXmccK6P9wlY59Ci2UtGVTFgBUpMWtJ1QrFXShgYBs/4DCmpU+KHDM5U8Rr/lElB1VQbMBrtH9WUOAhbV7f+FQsDOYNJQiwIbnpHF38upxMA0A5JzCwAhwH01tuzw+n3r0qBVT/XjTzTkAirtYyKMGqP67FenfhMg5FB/anJF2qfveGos81WvYBps1C
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(6916009)(54906003)(5660300002)(6486002)(2906002)(38100700001)(316002)(478600001)(64756008)(33656002)(66476007)(66446008)(66556008)(66946007)(91956017)(76116006)(2616005)(26005)(186003)(8676002)(86362001)(71200400001)(36756003)(6506007)(53546011)(83380400001)(6512007)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UXQ5MzBrcDhadk51Q0pHeGE0VldrcllIb3dydENqVVQwWEdTVjQ1bUZLUzIz?=
 =?utf-8?B?SG95ZVBIb3JtdkNGQnYra3RZM0J2d3MyMjBsVWZIdWpSSStjVG44ZVhuWDMy?=
 =?utf-8?B?Q0lTM2pnZ0Q1UlJMN2ZQbnVZZ0RxZjBWcnE1Wjd5U2xWbk14cng1ZmpaWDdS?=
 =?utf-8?B?SU9pK25EcUNSN3hMQ2JqTWtPaDlsZDNJOGdORzVpVVlJeEhXRUVZeDJWWGpm?=
 =?utf-8?B?cHMrVnB1b2JHUHREazhUY3IrK1dHTE1EU3JMQ0VjVyszL2Vnc3VqeDA4STZz?=
 =?utf-8?B?VUJ4QkNhUEdkNmpVYU1FVWJQZEF5ak9qK3M3WWxxV2pkUEpNOFl2NWhZTFJ1?=
 =?utf-8?B?S3V1WmdFWTk2ZGR4NG0remV5K2h6ZU55N2FSR24yd2xSczhzQ3FmdC80VTFp?=
 =?utf-8?B?bEw5NjNMR3k1emRJRjhBUFExa1lHTHpwTU5qSnlDZjI2b0c1MkxERWNXbElk?=
 =?utf-8?B?VGhpeExEK1oxRjQzZm41TFdoeFFwV1BzWlRtcFJSUFdZM0VnajAvZ2tSWTdQ?=
 =?utf-8?B?Y1JUVXlRU0toNjNMeGhwVm5GY0NETzJ0WFRRaW5HNUQrNSt4TDI0aGRkWVNK?=
 =?utf-8?B?dUFxNi9yMjRKMGt1NmVVd3VRendqMUtYUFpNY041elNscHdRblAwNHl3NVNU?=
 =?utf-8?B?bG9IRVZSTmp6Z08rSHdWOWJsTzBtLzNmVzhONkZ1dHdBOThZYWt5dS81NUc0?=
 =?utf-8?B?bkh5RVVxZ3pLM3JzM0lvZU1STmRZSTRMY291eEk4bHg0WWlPV1FFWTlFQjNG?=
 =?utf-8?B?bU8zRWFneE1OTFNuamRnSXpEMEJITndiSjVOaGVtWE5xNkRBcUpEY2c0VWlt?=
 =?utf-8?B?a1lUcmIxak11UGNJZ0hXcWYwYUJMQTZiMmVrVldLMlJVcnBybm5aOXloY3k4?=
 =?utf-8?B?eWlRbU1NWUVjSXpVZ2RnQisyT3RNQTBVM0k5TEpsM05lN1IxV0Zwa1RkSXdp?=
 =?utf-8?B?UkpUODNyd1NnWlFKRk1BZmFScGt6ajQvTUVoVUZQQk5pdDBHbVNuWGtnZEVS?=
 =?utf-8?B?bVk4L0pia245VlUxcXIzbmcyemdFRVF1eVg0bmJOWFhlYitaNUZrVVVwejd3?=
 =?utf-8?B?djhENWM1YU9VNHlHdVVBMWw2dzVkbjhQZ29Gek9kVjZmdm5hbWUxVG5yTGYy?=
 =?utf-8?B?T04reFRmenlBR0M0cWVqSWE3WE9ObU1tK093RkNHaENrM29sN1E4ODJocXlG?=
 =?utf-8?B?QnpEZ1FRZmVtYkRRZWEvQXF0STBDSU9CYmVMS3l6Yi9ncHpGSy9tUjBaMnhJ?=
 =?utf-8?B?TzBjZnJZZU9UT2JXZk84NDZJSGZBak41YlVhbk1iUkJXMjYwanVlMFdQSXcv?=
 =?utf-8?B?amd3Y2l1cDdCNTRNRGRtUHIwckJrZnRIL015S3E0eDJHNnA3aWJoaFd1RHA4?=
 =?utf-8?B?WGtlY3RnM2RPQkZtV1gzVk9ER3RueU1OUFk0OWc2M3FUVXpmRDY0TUNRdFBx?=
 =?utf-8?B?OUtncERQNjd0Ti8xNEZjMjhHa21tWjROWFBvNTI4dkRuaHlkY0RFSWxsVnF6?=
 =?utf-8?B?UEgzSHhnR05xaTVXdWF1V2lFWmJqeU9XcTl3TkpxT0E0aGljcVFlOFVEa2Mx?=
 =?utf-8?B?NHZzMHljNUphZjhpMnFzTnRJTHRHZjZOaVdGaWRqR0gzL1V5Uk0zdmUraDZL?=
 =?utf-8?B?Ry9Na0J4d2Q2QlBabDhXVGk2TWdOTTg1c3RPcTZjdnNzKzM2czliaU96V1lE?=
 =?utf-8?B?WWxGYzl6d3lNRW1YcE9KbHJpeTViOXhjSEdaRVpKTE9pWjh4V2RwMGVuVFNm?=
 =?utf-8?Q?ofqCanRhzO22Hwjchi8tTFwXUTF1eQv+iA7duMP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C301CCDA199024EAFEAEF32CD2E5EFF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21f3a5bb-53e5-47a2-5f6c-08d8f9df45ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lZh4vEr//PW7xGnaHgcx2qbBhAP8mAihAiQgucbtNBWAvcE7yTwZy2wl0ojI8LJHsll97bPHyrL8qdB29wQf7bTfESPrffqZm6nThBWej3Dzm4b88fIuKAGra59tOzbqvmbW8PfKBJMwpCJFqwgDlFxNSpM4HK+v4phArnE6LbRFtcVntkeYwtN/ui5KjO3fspb/7o1OZv1rJU1vY2girAy8FNvBTsgzjUlNWQQDdF9+7edBfEmeDx/0d0CEyT3bj2noa4J4ki8lXLTn4d3vEOJESZyHY601d0TUKpIezzNEgfRYDkK0X5v7aio5squiJUK0kgJE4sTnqU6/+a7F+mItH5Bnd+zzRE4XvAECVhla+rubIlMaepPQ0xD5S9t4KkbMdmOR8w4LchrWa7rX86otMRXWcwCsFfvfuHwNkiOv7k0EwwbC/B73NYjrKOJmuzyaoeDxXrpDGOhs7nu+T2EMxzGEij6inNrZvCGbgVvPmvdJbx9qAWNGTIOS1cMugXjh7hQUVQCJ0JYw3c6o4W7B91kLThqaArIoRZkzsOKj/znV/JixZ4Aej+AqNbayJz/0tI/ngpwZ3E88JC4UCsVp+gm9FpDcOAAl6cVAvlyvans5oYXbPWWjCltuIa65ldt0IQZhaVW+e0tnZ/Q4r4krBcVsLRDXvH4HVbMl39g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(36756003)(2906002)(8676002)(4326008)(8936002)(336012)(81166007)(316002)(356005)(6512007)(82310400003)(33656002)(70206006)(70586007)(2616005)(36860700001)(26005)(53546011)(54906003)(478600001)(86362001)(5660300002)(6862004)(6486002)(186003)(47076005)(6506007)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:07:50.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b275db5f-d008-4249-7ffd-08d8f9df4af6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6288

SGksDQoNCj4gT24gNyBBcHIgMjAyMSwgYXQgMTY6NTQsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwNy4wNC4yMDIxIDE3OjI5LCBCZXJ0cmFuZCBNYXJx
dWlzIHdyb3RlOg0KPj4+IE9uIDcgQXByIDIwMjEsIGF0IDE2OjE5LCBJYW4gSmFja3NvbiA8aXdq
QHhlbnByb2plY3Qub3JnPiB3cm90ZToNCj4+PiANCj4+PiBMdWNhIEZhbmNlbGx1IHdyaXRlcyAo
IlJlOiBbUEFUQ0ggMy8zXSBkb2NzL2RveHlnZW46IGRveHlnZW4gZG9jdW1lbnRhdGlvbiBmb3Ig
Z3JhbnRfdGFibGUuaCIpOg0KPj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IERveHlnZW4gY2Fu4oCZ
dCBnZW5lcmF0ZSBwcm9wZXIgZG9jdW1lbnRhdGlvbiBmb3IgYW5vbnltb3VzIHVuaW9uL3N0cnVj
dHVyZSwgaXQgZW5kcyB1cCB3aXRoIHdhcm5pbmcgYW5kL29yIHByb2R1Y2luZyB3cm9uZyBkb2N1
bWVudGF0aW9uIGxpa2UNCj4+Pj4gY2hhbmdpbmcgbmFtZXMgb3IgZ2l2aW5nIGZpZWxkIGRlc2Ny
aXB0aW9uIHRvIHRoZSB3cm9uZyBmaWVsZC4NCj4+PiANCj4+PiBUaGlzIGRvZXMgbm90IHNlZW0g
bGlrZSBpdCB3b3VsZCBiZSBhbiBpbXBvc3NpYmx5IGhhcmQgZmVhdHVyZSB0byBhZGQNCj4+PiB0
byBkb3h5Z2VuLg0KPj4gDQo+PiBNb2RpZnlpbmcgZG94eWdlbiBpcyBub3QgcmVhbGx5IGluIG91
ciBwbGFubmVkIGVmZm9ydHMgYW5kIGlmIHNvbWVvbmUgZG9lcyBpdCB0aGF0IHdvdWxkIHB1dCBh
biBoYXJkIGNvbnN0cmFpbnQgb24gdGhlIHZlcnNpb24gb2YgZG94eWdlbiBwb3NzaWJsZSB0byB1
c2UuDQo+PiANCj4+IEJ1dCBpcyBhZGRpbmcgbmFtZXMgdG8gYW5vbnltb3VzIGVsZW1lbnRzIHJl
YWxseSBhbiBpc3N1ZSBoZXJlID8NCj4gDQo+IEl0J3MgY2x1dHRlciBpbiB0aGUgY29kZSBiYXNl
LCBtYWtpbmcgdGhpbmdzIGhhcmRlciB0byByZWFkIChldmVuIGlmDQo+IGp1c3Qgc2xpZ2h0bHkp
LiBJdCdzIGNlcnRhaW5seSBvZGQgdG8gbWFrZSBzdWNoIHNvdXJjZSBjaGFuZ2VzIGp1c3QNCj4g
Zm9yIGEgZG9jIHRvb2wuIElmIGNoYW5naW5nIGRveHlnZW4gaXMgbm90IGFuIG9wdGlvbiBmb3Ig
eW91LCBob3cNCj4gYWJvdXQgcHJlLXByb2Nlc3NpbmcgdGhlIGhlYWRlciBhbmQgaW5zZXJ0aW5n
IHRoZSBuYW1lcyB0aGUgdG9vbA0KPiB3YW50cywgYmVmb3JlIGhhbmRpbmcgdGhlIHJlc3VsdCBh
cyBpbnB1dCB0byBpdD8NCg0KSW50cm9kdWNpbmcgYSBuZXcgdG9vbCBvciBmaW5kIGEgcHJlLXBy
b2Nlc3Npbmcgc29sdXRpb24gaXMgZm9yIHN1cmUgcG9zc2libGUNCmJ1dCB3aWxsIGJlIG1vcmUg
Y29tcGxleCBhbmQgbGVzcyBlcnJvciBwcm9uZS4NCg0KQWxzbyBhcyBzYWlkIGluIG15IG1haWwg
dG8gSnVsaWVuLCBwYXNzaW5nIHRoaXMgaXNzdWUgb2YgYW5vbnltb3VzIGVudHJpZXMgbm93DQpt
aWdodCBqdXN0IHB1c2ggdGhlIHByb2JsZW0gYXMgd2UgbWlnaHQgaGF2ZSB0byBzb2x2ZSBpdCBs
YXRlciBpZiB3ZSB3YW50IHRvIGJlY29tZQ0KTUlTUkEgY29tcGxpYW50ICh3aGljaCBpcyBhbHNv
IHNvbWV0aGluZyB3ZSBhcmUgbG9va2luZyBpbiBGdVNhKS4NCg0KUmVnYXJkcw0KQmVydHJhbmQN
Cg0KPiANCj4gSmFuDQo+IA0KDQo=

