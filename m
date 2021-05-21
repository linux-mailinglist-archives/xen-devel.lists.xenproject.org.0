Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8638BFBF
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 08:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131133.245250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljyqz-0003sD-Pb; Fri, 21 May 2021 06:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131133.245250; Fri, 21 May 2021 06:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljyqz-0003p1-Lf; Fri, 21 May 2021 06:41:49 +0000
Received: by outflank-mailman (input) for mailman id 131133;
 Fri, 21 May 2021 06:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Lf9=KQ=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljyqy-0003ov-3H
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 06:41:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ea25986-c241-4d9d-b514-8d9387bf1014;
 Fri, 21 May 2021 06:41:45 +0000 (UTC)
Received: from AM6P192CA0092.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::33)
 by AM4PR08MB2817.eurprd08.prod.outlook.com (2603:10a6:205:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 06:41:42 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::a1) by AM6P192CA0092.outlook.office365.com
 (2603:10a6:209:8d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 06:41:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 21 May 2021 06:41:41 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Fri, 21 May 2021 06:41:41 +0000
Received: from 9cfdb7593ec0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58C94B55-E628-4F93-9CFE-28E502E7C5AC.1; 
 Fri, 21 May 2021 06:41:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cfdb7593ec0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 May 2021 06:41:35 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB2863.eurprd08.prod.outlook.com (2603:10a6:802:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 06:41:33 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 06:41:33 +0000
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
X-Inumbo-ID: 1ea25986-c241-4d9d-b514-8d9387bf1014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu1gW/13rg6QUg9hXG/eAtr0kFQa59kQ3VdXnfkN6LU=;
 b=86mx60bVbzFxWLN5Om1fWJbutMH6o8x+asI1dJOYJj+SWysY9DR17kaIeqWVJtf5R/w1x7Wn4cBFCeP/36PYc6cldJ8nlRqjLQHQXA6jpA665mJ/spwRE2YZyplOdRAX7YNTllUdTKzGDfy+KodO/D4qv6McVe2xul2zvAIgcOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu4MAFyyyalo5xSFzn38dM4XdYuaE6xZpWd/gC45IAiH51q/joW1JcJfYmEDChrxn0k3PDFLV25r4UaKsX7aX3LzWIbWq5QsfWdUodCEuUDL9rRCeNsuU5edW/AVv1qMuBlup2ixvfvQ6kGDcSgICHHRvqtkPDekmqD2jGyEkjBvtyRICjbuJ04rqZB7BXJKI2PDYbMfImBcnQ//jl1vkZq2sVYLB1BN3rl8E2MhhVJR6Qp7s3NWzOtEeT64d/d0oakM0v3wnejTJKODQ8qRmupA1/XfBsgbc+Z/7exsS6um+HlLQDnU+smNxustO4enYuR8bDWyOOzvxPn8ewM+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu1gW/13rg6QUg9hXG/eAtr0kFQa59kQ3VdXnfkN6LU=;
 b=hrOXUTOIEJZA87kleTc1Y5yfLAAwx1CPlEnv5ckpkX+FmN0GKMu83Iyuns/b03ekLBgt1R3gFxDtahM3CZYbkabmithLpRi8B2kKAzpd7DB1D2n7thW1Dh3BBHkhW9JO4eU2fqCgb9erWZ4ZcUzJgU4T08vwAGXKDX2/0/kO12tLGRV6Oa4U1Wm2P7e+PRhXYn/b/mujkPy0cRYsyoMCooQEtYl2yoe2ucKqzvpedgfumVZEafA3cBN6gtp/LhOXZMw8udOERy95o566BcT+6ZmcBMAGsvo2uXL0cNZ7arao1lGNK1ExBkaVF7Y/Is1rqKM/A7nzZQuyMtnITbp3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu1gW/13rg6QUg9hXG/eAtr0kFQa59kQ3VdXnfkN6LU=;
 b=86mx60bVbzFxWLN5Om1fWJbutMH6o8x+asI1dJOYJj+SWysY9DR17kaIeqWVJtf5R/w1x7Wn4cBFCeP/36PYc6cldJ8nlRqjLQHQXA6jpA665mJ/spwRE2YZyplOdRAX7YNTllUdTKzGDfy+KodO/D4qv6McVe2xul2zvAIgcOU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Topic: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Index: AQHXS6W/k/joZEkeaUiDjrfYH3jVEaro2ToAgAAR3sCAAC37gIAEZlqw
Date: Fri, 21 May 2021 06:41:32 +0000
Message-ID:
 <VE1PR08MB521538B39E6290BBA0842F97F7299@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4389b5be-7d23-31d7-67e0-0068cba79934@suse.com>
In-Reply-To: <4389b5be-7d23-31d7-67e0-0068cba79934@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4D7D3952DB29D044B8046A3D21197DBA.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ed7d618f-d683-4ee6-36da-08d91c237e66
x-ms-traffictypediagnostic: VI1PR08MB2863:|AM4PR08MB2817:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB28173ABABDF43E2404BCF81AF7299@AM4PR08MB2817.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uJ51OqEBXra8MZbrgvXvS1V9MHKSxpsFrEfVA3eHUubVUmkrKGGgtylXm2NXKRD9B1oOQLaXRFG7JFDBb67tiBSYfXOwLri24VbbHz8111Tpe4YMmC4GkuC0fv+m5A2ADS3QRqbcROUVH592OVw3TuLKGXF6ScKWYqb8TVUxY+kKskdaQyUFIpwaKHMvM3tq1HhIf+VbVnC+/nG7lMQry7RszgfnFLZn2kTQTIqj8oMzpdhTYMYmFtAWCIc4PFh9/tuZnsQUdd+De4mymg5DSAoW5+t1DK4ZKZXf8FTLoHQuRN3J+v8zxMh3/0aj5RMqCMk7aBVv0N2UHfRhfTfYJyY2ryNDpiT+Iu4wKk/fko3UoQh0OcSeloisOd5J4tbjhtrEIxbw7aQgIejSfHjOz9tJ2L2UychqAf5ciabtR2Zt5twiBQGF0/QEVTFvTzVqeVy9k8mYtzl3T9kYwmojuh2cbDu3e+CDv30QfyULWDs6nAJ8/UJhA59+LzUeqk9/2OV45HB/QK65INWR2N5rS2eRIhB5+8YY/j6S/RfAAATm5Gucq0qV9ZfdNUwWbnr24lU2S7aGVEKfNIfRSp8gmFTCiQxzm4tTsN7xJTaACUk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(316002)(478600001)(54906003)(33656002)(86362001)(8676002)(26005)(53546011)(7696005)(6506007)(8936002)(83380400001)(76116006)(9686003)(5660300002)(55016002)(52536014)(66946007)(38100700002)(6916009)(66476007)(66446008)(64756008)(66556008)(2906002)(186003)(71200400001)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Tmp4YXNmaTR5ZElvV1VtN05mekRudFd2WnJTQWIzSjU4MEJqVTYwb3FhMlA0?=
 =?utf-8?B?L0pNL3Z4WEFndndLK3M3dVE3KzI1VzhYczVFUHRNeG5Mbk5MRERuY3ZROU8r?=
 =?utf-8?B?WC95Wmc3Z21hSGlsbHA5WkNGTTZBTXVOZU90M0YvQXpjcXFQSHFPWHlDOXhl?=
 =?utf-8?B?aWl1Umtra1BQbnJnTllZZnJVTXdWRDFFUzgwNGRrRzU1V2lQSVM1bXdoQ1hm?=
 =?utf-8?B?UGVlUkZWcU1pYnpwYzNuSzlJSi9SSHNXbUhKMEdGd1ZhMHNjelBnMnF1YWFB?=
 =?utf-8?B?dVhKV2NnVG5CSWV4bkFHQUVnNzg2bjhRZXRvc3ZnN1pqNkYwVjUxQWhtQ0I2?=
 =?utf-8?B?UEExeEdZa0VHUTY0dE1CYTJnaVJDSmx2RU4rWEV3TXRNMmdGTCtlc3ZYS2lW?=
 =?utf-8?B?dmtheXpFaDlybXc0UGVLeTdLeUQ3Y1EvbXVGcUY5MTRwMWxaUkhrdkl6TWtY?=
 =?utf-8?B?alhKMzc3bDdrWE9hd2RoSEdCQjJPUEg5aGFEaG5qLzlBRUIyZmlpTDVIOHNs?=
 =?utf-8?B?MmVKZzFzZ3VJQ281aHoxNE9NQ1lXMmZ4UUhjd1VRcWN3SWNNdzZJNitiMlo4?=
 =?utf-8?B?a3RqckcvSFgrWnpCSjd6V01nUnQrd00vellFRlo0SFFuaUtKZVVyNU5rTDVj?=
 =?utf-8?B?T1BLang5QzB0b2NiNVJyTHZTUUlXWlFVbTdkT0pTV0ltR1NST3J1MExCV3hB?=
 =?utf-8?B?L3RSTXhQMFpYU1MwTTJqZG1Ma0lCWUtFTWJhTm80Q21XTmxvSXRQWlNkV0tt?=
 =?utf-8?B?cFBjRmxnbnVicmxZS0l6ZVNVYUovWDAyZHhVT0lOUUVPY24wMFpKOHZPdE81?=
 =?utf-8?B?NFo2RHJqZ09XcDVJK2JMWmZoeEhqQVlCRkpxRVNmWGhYSjlXY3BMNVFuaHN4?=
 =?utf-8?B?VDllcHNrd1lyT2FmaUprZWVnS1lwZ0dNMENPUFJvOSt6dm50eXJ5SEVHNTRs?=
 =?utf-8?B?RkNnM1B1cDZtV3BlcStHS2VseU5sN0RySTR2bENTSVVoZVY5MVo2d1VsVEkz?=
 =?utf-8?B?dzBMOHE0aThhaXZERklFQkNRcTI3ak5oam1hY0ZVQU84SzlaSDAxYlZxbFlr?=
 =?utf-8?B?cHdPaElWcW9OUEdVS3hKcmFOV2MwRGZBY282eVJrZ2poTmF6SFpoVXpaenV4?=
 =?utf-8?B?cDhjN2IyWHZjQXBJWE9TdnZ0c0VKT1lUOEl1aU83ZWF6NFEybEhSY2tBekc4?=
 =?utf-8?B?ekFnTUVSZzZ2MWJYaDhlNnA4Szh3Y1kyUldOTkhiaDhlaDg2Ky9zZUlFMGw1?=
 =?utf-8?B?RU5CWngycG1vN1ZnTWRxaXFxUUxyYU9HaEFZN3lNYkx0WlhuNHliTjh0V0p5?=
 =?utf-8?B?WGpkOTQrTGxmL0N2QzNrVWhGbGR1RlMzYzBoSFJKREJlc2x2dCtsWUJNTXk2?=
 =?utf-8?B?VW5DQ2t6WFM3T2RKRllQZmtEc3RqQndFeStjTmpmSnlpRTZla3R3Yy9MYkhR?=
 =?utf-8?B?UVNJWlhnWmp6V3hJckxiTGIwVHc2K3hNeXk5RkVpWEc1RDFjZ3VUZHJub3J4?=
 =?utf-8?B?dW1wcDkxNkZBNCthRnNieG5zd2N1OE96LzBaUEFZampBUnVyOVh5QTFuaUFr?=
 =?utf-8?B?YW9TQkx5dVdoNk5kcVF6cUZYZEpLSU9xZTRGZWl1a1l5UVFzN2c2Y2xBTXZF?=
 =?utf-8?B?Vy9XMWxpSk5xT2NNNUwzQ1loaGJtYmxsV2p6N2xFWFM5ZStBTXVmeGhrMVp2?=
 =?utf-8?B?cEorZ2hnREhBS3ZQa1hSUVc0a0daMHNpZms3NXRjVUxJV0VkY01ZMjJxeVVs?=
 =?utf-8?Q?Ne6/Hz8udU+vMPANi6I6DBInj2qAjTNRSHv1Mv8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2863
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebb90b85-b707-42eb-d4da-08d91c237932
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lDfahx7plQFs4K6e7Ha1yHE1uiCnNJ5bTrg+pkzMFDldXId1Mk9lgv5P7M+6Q34U6WTKAiYwcj4estTy0F5O5BvkAx4iD3SiQTriaw3cBT6yJYagN1iIOjLpVzAynanVlge34q2jqW43KRgjpo4ZY0/1avFMmw7LPF+djZTNMZqVHPXwGzk2Ni0rlsJcHtI7CvSwwCCzUF2jmjM0VWqB7OjJX/bzPSw4J/3dJ3sHZMhj2yatQ8FSUweKKxhk73x8J9Jm5F3mGOOEgm2s+VCjhTRXMwZzDMhA2wt1mmyLQiNrGM9U6AdAOEPpWTDPXs2S188kHP2lOFBYFta0bQvLvWs29ivJt1n2azH2Ng7iY2Az3KEqbOUXm8kU6tZyzZZ4sI321IpcOUQ8k06K9hpcWszL559W7mccW5MPdOx3ld9feg7eqc2xRBFqurmI9rA+SItwtPo7NJg9KpmgZwnGYbp865g3JyeJrw8jpBBpGcRb4JRU+0kPc3Htu+3QTAyJlZAooDhNnqbil0K5cjXYYMulW5KJB6TJp95MztIYB5yr3O8de8Q/RRdlNDyVMxzoPmn27DOMxbGd5ZKFwHyMCgwM1nMWSZRJ/FG7mLYPFfC4rj4VXvVQMSo8ag5KUJmaUxJUr55BER/pmMGGA14VF2KqzEu6+1h/wQTmZx0OJ0M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(36840700001)(46966006)(26005)(8936002)(53546011)(4326008)(6862004)(7696005)(316002)(54906003)(55016002)(6506007)(52536014)(5660300002)(70206006)(86362001)(70586007)(186003)(8676002)(336012)(478600001)(36860700001)(47076005)(83380400001)(81166007)(356005)(9686003)(33656002)(2906002)(82740400003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 06:41:41.9057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7d618f-d683-4ee6-36da-08d91c237e66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2817

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgNzoy
MyBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA3LzEwXSB4ZW4vYXJtOiBpbnRydWR1Y2UgYWxsb2NfZG9tc3RhdGlj
X3BhZ2VzDQo+IA0KPiBPbiAxOC4wNS4yMDIxIDEwOjU3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVz
ZGF5LCBNYXkgMTgsIDIwMjEgMzozNSBQTQ0KPiA+Pg0KPiA+PiBPbiAxOC4wNS4yMDIxIDA3OjIx
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
DQo+ID4+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+Pj4gQEAgLTI0NDcsNiAr
MjQ0Nyw5IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4+PiAgICAgIHsNCj4gPj4+ICAgICAgICAg
IEFTU0VSVChwYWdlX2dldF9vd25lcigmcGdbaV0pID09IE5VTEwpOw0KPiA+Pj4gICAgICAgICAg
cGFnZV9zZXRfb3duZXIoJnBnW2ldLCBkKTsNCj4gPj4+ICsgICAgICAgIC8qIHVzZSBwYWdlX3Nl
dF9yZXNlcnZlZF9vd25lciB0byBzZXQgaXRzIHJlc2VydmVkIGRvbWFpbiBvd25lci4NCj4gPj4g
Ki8NCj4gPj4+ICsgICAgICAgIGlmICggKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQp
ICkNCj4gPj4+ICsgICAgICAgICAgICBwYWdlX3NldF9yZXNlcnZlZF9vd25lcigmcGdbaV0sIGQp
Ow0KPiA+Pg0KPiA+PiBOb3cgdGhpcyBpcyBwdXp6bGluZzogV2hhdCdzIHRoZSBwb2ludCBvZiBz
ZXR0aW5nIHR3byBvd25lciBmaWVsZHMgdG8NCj4gPj4gdGhlIHNhbWUgdmFsdWU/IEkgYWxzbyBk
b24ndCByZWNhbGwgeW91IGhhdmluZyBpbnRyb2R1Y2VkDQo+ID4+IHBhZ2Vfc2V0X3Jlc2VydmVk
X293bmVyKCkgZm9yIHg4Niwgc28gaG93IGlzIHRoaXMgZ29pbmcgdG8gYnVpbGQgdGhlcmU/DQo+
ID4+DQo+ID4NCj4gPiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0IGl0IHdpbGwgZmFpbCBv
biB4ODYuDQo+ID4gQXMgZm9yIHRoZSBzYW1lIHZhbHVlLCBzdXJlLCBJIHNoYWxsIGNoYW5nZSBp
dCB0byBkb21pZF90IGRvbWlkIHRvIHJlY29yZCBpdHMNCj4gcmVzZXJ2ZWQgb3duZXIuDQo+ID4g
T25seSBkb21pZCBpcyBlbm91Z2ggZm9yIGRpZmZlcmVudGlhdGUuDQo+ID4gQW5kIGV2ZW4gd2hl
biBkb21haW4gZ2V0IHJlYm9vdGVkLCBzdHJ1Y3QgZG9tYWluIG1heSBiZSBkZXN0cm95ZWQsIGJ1
dA0KPiA+IGRvbWlkIHdpbGwgc3RheXMgVGhlIHNhbWUuDQo+IA0KPiBXaWxsIGl0PyBBcmUgeW91
IGludGVuZGluZyB0byBwdXQgaW4gcGxhY2UgcmVzdHJpY3Rpb25zIHRoYXQgbWFrZSBpdCBpbXBv
c3NpYmxlDQo+IGZvciB0aGUgSUQgdG8gZ2V0IHJlLXVzZWQgYnkgYW5vdGhlciBkb21haW4/DQo+
IA0KPiA+IE1ham9yIHVzZXIgY2FzZXMgZm9yIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiBh
cmUgcmVmZXJyaW5nIHRvIHRoZQ0KPiA+IHdob2xlIHN5c3RlbSBhcmUgc3RhdGljLCBObyBydW50
aW1lIGNyZWF0aW9uLg0KPiANCj4gUmlnaHQsIGJ1dCB0aGF0J3Mgbm90IGN1cnJlbnRseSBlbmZv
cmNlZCBhZmFpY3MuIElmIHlvdSB3b3VsZCBlbmZvcmNlIGl0LCBpdCBtYXkNCj4gc2ltcGxpZnkg
YSBudW1iZXIgb2YgdGhpbmdzLg0KPiANCj4gPj4+IEBAIC0yNTA5LDYgKzI1MTIsNTYgQEAgc3Ry
dWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygNCj4gPj4+ICAgICAgcmV0dXJuIHBn
Ow0KPiA+Pj4gIH0NCj4gPj4+DQo+ID4+PiArLyoNCj4gPj4+ICsgKiBBbGxvY2F0ZSBucl9wZm5z
IGNvbnRpZ3VvdXMgcGFnZXMsIHN0YXJ0aW5nIGF0ICNzdGFydCwgb2Ygc3RhdGljDQo+ID4+PiAr
bWVtb3J5LA0KPiA+Pj4gKyAqIHRoZW4gYXNzaWduIHRoZW0gdG8gb25lIHNwZWNpZmljIGRvbWFp
biAjZC4NCj4gPj4+ICsgKiBJdCBpcyB0aGUgZXF1aXZhbGVudCBvZiBhbGxvY19kb21oZWFwX3Bh
Z2VzIGZvciBzdGF0aWMgbWVtb3J5Lg0KPiA+Pj4gKyAqLw0KPiA+Pj4gK3N0cnVjdCBwYWdlX2lu
Zm8gKmFsbG9jX2RvbXN0YXRpY19wYWdlcygNCj4gPj4+ICsgICAgICAgIHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGxvbmcgbnJfcGZucywgcGFkZHJfdCBzdGFydCwNCj4gPj4+ICsgICAgICAg
IHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4gPj4+ICt7DQo+ID4+PiArICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBnID0gTlVMTDsNCj4gPj4+ICsgICAgdW5zaWduZWQgbG9uZyBkbWFfc2l6ZTsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgQVNTRVJUKCFpbl9pcnEoKSk7DQo+ID4+PiArDQo+ID4+PiArICAg
IGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX293bmVyICkNCj4gPj4+ICsgICAgICAgIG1lbWZsYWdz
IHw9IE1FTUZfbm9fcmVmY291bnQ7DQo+ID4+PiArDQo+ID4+PiArICAgIGlmICggIWRtYV9iaXRz
aXplICkNCj4gPj4+ICsgICAgICAgIG1lbWZsYWdzICY9IH5NRU1GX25vX2RtYTsNCj4gPj4+ICsg
ICAgZWxzZQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBkbWFfc2l6ZSA9IDF1bCA8PCBi
aXRzX3RvX3pvbmUoZG1hX2JpdHNpemUpOw0KPiA+Pj4gKyAgICAgICAgLyogU3RhcnRpbmcgYWRk
cmVzcyBzaGFsbCBtZWV0IHRoZSBETUEgbGltaXRhdGlvbi4gKi8NCj4gPj4+ICsgICAgICAgIGlm
ICggZG1hX3NpemUgJiYgc3RhcnQgPCBkbWFfc2l6ZSApDQo+ID4+PiArICAgICAgICAgICAgcmV0
dXJuIE5VTEw7DQo+ID4+DQo+ID4+IEl0IGlzIHRoZSBlbnRpcmUgcmFuZ2UgKGkuZS4gaW4gcGFy
dGljdWxhciB0aGUgbGFzdCBieXRlKSB3aGljaCBuZWVkcw0KPiA+PiB0byBtZWV0IHN1Y2ggYSBy
ZXN0cmljdGlvbi4gSSdtIG5vdCBjb252aW5jZWQgdGhvdWdoIHRoYXQgRE1BIHdpZHRoDQo+ID4+
IHJlc3RyaWN0aW9ucyBhbmQgc3RhdGljIGFsbG9jYXRpb24gYXJlIHNlbnNpYmxlIHRvIGNvZXhp
c3QuDQo+ID4+DQo+ID4NCj4gPiBGV0lULCBpZiBzdGFydGluZyBhZGRyZXNzIG1lZXRzIHRoZSBs
aW1pdGF0aW9uLCB0aGUgbGFzdCBieXRlLCBncmVhdGVyDQo+ID4gdGhhbiBzdGFydGluZyBhZGRy
ZXNzIHNoYWxsIG1lZXQgaXQgdG9vLg0KPiANCj4gSSdtIGFmcmFpZCBJIGRvbid0IGtub3cgd2hh
dCB5b3UncmUgbWVhbmluZyB0byB0ZWxsIG1lIGhlcmUuDQo+IA0KDQpSZWZlcnJpbmcgdG8gYWxs
b2NfZG9taGVhcF9wYWdlcywgaWYgYGRtYV9iaXRzaXplYCBpcyBub25lLXplcm8gdmFsdWUsIA0K
aXQgd2lsbCB1c2UgIGFsbG9jX2hlYXBfcGFnZXMgdG8gYWxsb2NhdGUgcGFnZXMgZnJvbSBbZG1h
X3pvbmUgKyAxLA0Kem9uZV9oaV0sIGBkbWFfem9uZSArIDFgIHBvaW50aW5nIHRvIGFkZHJlc3Mg
bGFyZ2VyIHRoYW4gMl4oZG1hX3pvbmUgKyAxKS4NClNvIEkgd2FzIHNldHRpbmcgYWRkcmVzcyBs
aW1pdGF0aW9uIGZvciB0aGUgc3RhcnRpbmcgYWRkcmVzcy4gICANCg0KPiBKYW4NCg0KQ2hlZXJz
DQoNClBlbm55DQo=

