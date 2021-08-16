Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A161F3ECEEB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 09:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167188.305156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWcO-0005sg-01; Mon, 16 Aug 2021 07:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167188.305156; Mon, 16 Aug 2021 07:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWcN-0005pr-T3; Mon, 16 Aug 2021 07:01:07 +0000
Received: by outflank-mailman (input) for mailman id 167188;
 Mon, 16 Aug 2021 07:01:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/vaJ=NH=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mFWcM-0005pl-8v
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 07:01:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b820fa04-fe5f-11eb-a444-12813bfff9fa;
 Mon, 16 Aug 2021 07:01:03 +0000 (UTC)
Received: from DB6PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::14)
 by VI1PR08MB4591.eurprd08.prod.outlook.com (2603:10a6:803:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 07:01:01 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::43) by DB6PR1001CA0004.outlook.office365.com
 (2603:10a6:4:b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Mon, 16 Aug 2021 07:01:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 07:01:01 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Mon, 16 Aug 2021 07:01:01 +0000
Received: from dff8ee2b4aec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1B6E372-DA83-4032-9A84-360A65E19198.1; 
 Mon, 16 Aug 2021 07:00:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dff8ee2b4aec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 07:00:55 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4572.eurprd08.prod.outlook.com (2603:10a6:10:b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 07:00:54 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:00:54 +0000
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
X-Inumbo-ID: b820fa04-fe5f-11eb-a444-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgbgecN/jUL3ruQrEfCmnS27o6FWHsQS+xkrzBDVlc=;
 b=FAn62FsPKjv3eXE8gmbID7zqRJaw1pEewiTdbMskA8jho0yrhkdEIuBHVy6o6VUZYBYlGqU5Oy4kUXnwZaIPXobSnUdFnV0ZxZx4DxMdp+DHRT0FLtIktzPHRMY3do9Mb3I7nnjTnUR5TyjgaliNgkUWxkMcUgs9D/rAPuwKnCY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUaq1wjgDIy8p8R9wWVrqqbZff/eCjyBenpy5Vp+puY/cD0K9DLqvjAOYmoZDrOxtDrE4x7IhYGYWtADHCNxdMGdkywKlpO7NSUuR281flx9njxIxuD4BSay48XwGosq0+SECjn/I/tl8+FeYzIO1YhRzg7vJG/osbTc/aZ6303Bt4MO3RWot1Fx+qTorP7o+AC3B64yALrYh7BRMIBei9R3NmK3D/8YF7l4D6NBrd2RR2QwJ2s9MEsjwVWpQrE2M7qsj+/gFyJtZLeHPosjPpTp0xslC4U4bv4NMfMyqjCoI8HLVYubaRlKhAGV/NLTHdyh+AfK0RHCitWW38jUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgbgecN/jUL3ruQrEfCmnS27o6FWHsQS+xkrzBDVlc=;
 b=bwEjjX+/n23RRm2ip/Zsq+V2vbrXvbtNtK0UTclp7H6wo5izjnPBufs02lbSqDr9NlMIQU4LrGFHHYMpyMqcDXWp1WkhbzJsmfEjMvBvDm9JcitQWHyubw0ZT2ou3L0zu1WHBDITzcuhYxMMcqFrlVDIjX4QLKJd9I4ax1siwmle33a81x0b5PSnuLkCVUPF9r/+aOVmU0eVn09ucT1I9KrqD3+x+w+yMQN4PmfOReAPCJmbtBK0r2iB6lnQEkqcRhEElqIymnusqcXPEu4ajbquPg3uECbz4fgxkcUjoeASeX8sCLE36YOBL6z+H8+0FVvryTErYeAbxVsCmQjJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgbgecN/jUL3ruQrEfCmnS27o6FWHsQS+xkrzBDVlc=;
 b=FAn62FsPKjv3eXE8gmbID7zqRJaw1pEewiTdbMskA8jho0yrhkdEIuBHVy6o6VUZYBYlGqU5Oy4kUXnwZaIPXobSnUdFnV0ZxZx4DxMdp+DHRT0FLtIktzPHRMY3do9Mb3I7nnjTnUR5TyjgaliNgkUWxkMcUgs9D/rAPuwKnCY=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH V4 05/10] xen/arm: static memory initialization
Thread-Topic: [PATCH V4 05/10] xen/arm: static memory initialization
Thread-Index: AQHXg5tWhKjEMj8fikey5jo8McJgaKtxeOUAgARWM0A=
Date: Mon, 16 Aug 2021 07:00:54 +0000
Message-ID:
 <DB9PR08MB6857FEB31CB6AEB6753519FF9EFD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-6-penny.zheng@arm.com>
 <0fb3df68-c94c-c4da-bcd1-f1fbdf429d37@xen.org>
In-Reply-To: <0fb3df68-c94c-c4da-bcd1-f1fbdf429d37@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D1C48AFAA24311448A4F381BF8E1FB87.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3af97044-354a-4a29-6503-08d960839b52
x-ms-traffictypediagnostic: DB8PR08MB4572:|VI1PR08MB4591:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB459122D812FBAF45BDFC547C9EFD9@VI1PR08MB4591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8uSg6yxrYli8W84qY//sgtupU7RrfXsFfk3qW9mVBVv+uPtglKJSPrFL8dka5nTMXFZ85M+xaBrdC5MlXGhCN0Bh6yX0M6vIiClQvZRz5lripkr/4DBC2Rsi8sKr+1/yhZUSnS7yn4Qo8MQO5QgkSwYk1BD/EIn6snatbHr702UgcSbhDn9VHtgK2NqNVX88c8DnRAVHufsQ+aAAkjOgffykYuTJLBt5VU0meYiX4R7ZDmyxdljCuuivRYjwX1VbOPax5zWcE9Q31sdGHwHJFez/0qqdxVjhNLnOyoNq9ARX51BpTl+HWur7cswOpnogXr3tbfzPMt62wdkkmBbZ4Q0FISRtuo4avCJvGryuy5oCeXpaF0nkYefCWqDoMj4tYvB93bHBuI8UcIF6MUddapAvh/xfnY+U8buDmkIuRAJfIPyUXWAQakaQysOGJvUnzCzK3ycyrGuxHLozCHs+KSoI+QV3Ivoe++nz+ixPPBVJl/1Sru1qWLKFkVsa7iEiLQ2FpjLHRWg5nJVlAlZXHzOh3L0BGuXGW47+shD3FNGo1AzbNeFRJrspsev0cd9xizE02fK5iL+pk/GsGOTA0bOWt6B2HVT//jzQ0wQMAyc3oAwINdO4f86Mz1X+2Nr976PM/YKos7UorxwiyQ3XTBXhBk0JxqabZDXmTTVoo3DIx+Ci3qHpUmbgKDlnueNah5uXVBQuvl5zxQGWPUDHVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(2906002)(478600001)(4326008)(8676002)(83380400001)(26005)(38100700002)(71200400001)(76116006)(186003)(122000001)(316002)(66476007)(66556008)(52536014)(64756008)(66446008)(54906003)(8936002)(38070700005)(55016002)(66946007)(9686003)(110136005)(6506007)(86362001)(53546011)(33656002)(5660300002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXRod25pODdCUU5YeURTbzNUMW16WGp1bTNGODBveS93Y2RuMjdKU0NyVEly?=
 =?utf-8?B?SDB1b0o5aEF2c3ZOSVpUQkpqaWdDeHRnMEJVOHVueElOT3RzMGgwTGVkc3Fw?=
 =?utf-8?B?N3h6SFROdVNSVjFDVlYvY0F0UE1oZFNKRWVXZUpnN3FiWkpiWlpoMHNBcDY4?=
 =?utf-8?B?U3AyeUg0Tm9NcHlISGRMYTQ3M0FlcUprY0NvYlU4L2ZpMzZ4WFoyK1YxOW9y?=
 =?utf-8?B?TUxJTFhWVzdWNUJFSnYxd0g2Nm1XdjJNWFM4MXRIdXFYWmZCWGJYMkRON2JV?=
 =?utf-8?B?d3oydytyQndmcTd1Ti9kTjdlWlZmU3FOK1ZGQ3JBcWtUaENCK2VhVnBLNDR5?=
 =?utf-8?B?WExoUit0em1qb1V2c2Jka2ZGcGtxdVQxdWkxZVRqbnd1N0V5bFNtaTRxOU02?=
 =?utf-8?B?VVBmR2FMcU41UHBkOVRqZmg2cnRqSzlnL3JhWVJ0TUtYWVE1cGI3THdpaXVE?=
 =?utf-8?B?ZmNrYkh4M3dDbnNFMVgxbEJhcisrSkZlazhQcG4vUlQxaWxuNjQzM0w3VWox?=
 =?utf-8?B?dUQxVEZyNjR5ci9nU2ZZaGFFU2R2eTNMQ3pYNG83WlhSUkFoLzVhbTkrMnhu?=
 =?utf-8?B?K21RS2pYL2l5dHU5VEdZb2JWRk9vbUhZRFJYSVQ4YjB3MlNzcTA2YXZWN24v?=
 =?utf-8?B?eGxvVEljaDBqNkdhSUg5UjUzbjZLOE0vMEowUmNUZVMzK0NtazdzOHUycUhw?=
 =?utf-8?B?RzMrMmhsc1NETDFpWGdvQkY4TWQ3WHdqanRGYWM4R3ByM09PWE5uZEpnRnU2?=
 =?utf-8?B?OTlsV0dwbW9zSkRpRFpObXk5M2xwbzY2TWhkcXJucmg2OHUrcjZGL0N0RjAy?=
 =?utf-8?B?djE5RWcvMlcreTNFMWZIQUVHSk5NK2RPV2FxSjVhOU8wR09UTzVYYXNWZ25i?=
 =?utf-8?B?ZFREZlZ0WFJkRmZiYnU5dUF2dmppN1k0VU4yK3lsUng2aENOVkpXQWM0RFVE?=
 =?utf-8?B?YjRTOHd4RHBTTlF2RlZ5Qmk3YVBvdC9TM0ZvWDRlNkJPNEVQU01ZQXpLbDVE?=
 =?utf-8?B?VnhDZE0rL0J5OHVjSGxNSDkrK0tNb0I0UnpWNTN4LzZGMDhQVElvaXJ0SW55?=
 =?utf-8?B?MDdFTDNYeVpVRFl5Ni9PVC9ZdlNuOVFjNGVRWHFZMDBBdzgzb2VrYUVwdFox?=
 =?utf-8?B?VWtwWGFFN2RxMlFxdy9nS3pFeDlFNTNWSWhza2pRcklDeU42YU9VTVJyQWdE?=
 =?utf-8?B?dkc4eVk1SHBoK0t1elZzcGdkZzBXMTh0TGhsUEliSWJJYWw5OXkwbjhYeXVo?=
 =?utf-8?B?K3BhcUVWMVRrOXF0RFdwNjdPbTdpZnBJOHVrMVF5akdpZEJTSjlkWGVvdTE4?=
 =?utf-8?B?QjFsM2xSTFNOWmxSRGdZaTVLYVpYQkQyTzFXZk1IOTNJOW5OUmVodXl6c2Nk?=
 =?utf-8?B?VzBycGF5VGowZ1lKc2hkRER6bE5mQnZyckZnVGN1V2k3a2syYXhtQjRHQzF4?=
 =?utf-8?B?ZmtEbE9Ob09sdENXY2hKV0pqemIycEYvNXY0S0tTdnRiOWhKRHpUOWdYNGZF?=
 =?utf-8?B?UVh1RUFHZnY5VmZNQm5RM3JDS2VQL0lkQTBjZ2hRbE1GUzdIejZBQmExaUF2?=
 =?utf-8?B?aXc3TmoxQkpVaFpqVDE4WVRFNHF0NXpGMTIzcC9tZFJ1WHZueHFhYnV6di9S?=
 =?utf-8?B?T1U3OS8rdC8yaVZRaWFkUW9id2VpVndjanY5TUtUR0tVd3p6S1U4MFl3eTB3?=
 =?utf-8?B?WjJINmpzSEkyTGpHc0lBYTBDT043WVhBUkZvVHJveEQvSkhMY3lRaXFCYjd2?=
 =?utf-8?Q?zAHBoMKQzexd6FHTVevbnYcHP1k0VzTI6Gl8ytt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4572
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb1647b1-e6cb-427a-0fcb-08d960839734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZODKgpiqCQRaA61OvWkjF5q6NY5nWXpa35aG4on/EV9MVXRwWt0ewVaQ3w8BILJv+DcNOGzpbtFes5xTQS9ekzBGDam31FeIyESu7WIAPlBsKnQEUDbef/ArWbIpHNQu6NeLVckPr4XpBprGwvciTbWyCrdZbqpTi1ttmj26BA/B51LXaagGkAMVkJdcrTRfJ+tL0O4eCMDlHMD1aG9Qs5y/nus3kXa+nubAt7XO4O325m+cMI+XNcwWyU7JXSG9CwQ1BgUBskte9SLxcYWIG59Xi8KMekw18AdkrbgTKmUMJ8nCZ7+BnFQ1jAgJE0/Mxaxyxbe6FZ6QslhB/DGr3/atN322+rpIPO7maPYUhGLpCd81aB1PipCwlNKEKL5iMWqs/Hzfi0LEtVpBMQcQcJDUT8RMI9buLF59go38CEJehNFyykhd5ahQB9wG1nJXZkxUdtzGG/CX/izBMxQ7/Hfjj2M1tmfrV7dww3UYwIprOlKXnTXfkt0hrUuNaV750cc/d773HaQHndZr90wQrjB3MwjZL+Eomr3nGoZv7jcHFj9m7N9nzmht3BGcxGnlFM7t82caUnPQ/gNG+l1YAf2M8JHWbROJUy2A4zjb9AI1vwQh2QBeRgtW66vD6nrqwnyR4Bq3uCigvqj2QQMzLtp9bMDGfIm/yvCB3tDmOZqulS7jzRiRnlY8bld1Ev6XLgKtkuJxnV4ll5Fq9ASEkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(36840700001)(46966006)(52536014)(6506007)(9686003)(86362001)(7696005)(53546011)(55016002)(356005)(54906003)(110136005)(26005)(2906002)(36860700001)(5660300002)(81166007)(316002)(70206006)(478600001)(70586007)(186003)(4326008)(33656002)(47076005)(83380400001)(82310400003)(8936002)(336012)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:01:01.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af97044-354a-4a29-6503-08d960839b52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4591

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTPml6UgMjA6MzgN
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNo
ZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDA1
LzEwXSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uDQo+IA0KPiBIaSBQZW5u
eSwNCj4gDQo+IE9uIDI4LzA3LzIwMjEgMTE6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ICsv
KiBTdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uICovDQo+ID4gK3N0YXRpYyB2b2lkIF9faW5p
dCBpbml0X3N0YXRpY21lbV9wYWdlcyh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBp
bnQgYmFuazsNCj4gPiArDQo+ID4gKyAgICAvKiBUT0RPOiBDb25zaWRlcmluZyBOVU1BLXN1cHBv
cnQgc2NlbmFyaW8uICovDQo+IA0KPiBJIGZvcmdvdCB0byBhc2sgYWJvdXQgdGhpcy4gV2hhdCBk
byB5b3UgZXhwZWN0IHRvIGJlIGRpZmZlcmVudCB3aXRoIE5VTUE/DQo+IA0KDQpGcm9tIG91ciBj
dXJyZW50IE5VTUEgaW1wbGVtZW50YXRpb24sIEkgdGhpbmsgdGhlcmUgaXMgbm8gZGlmZmVyZW5j
ZQ0KYmV0d2VlbiBOVU1BIGFuZCBOb24tTlVNQSBzeXN0ZW0gZm9yIHN0YXRpYyBhbGxvY2F0aW9u
LiBNYXliZSBpbiB0aGUNCmZ1dHVyZSwgd2Ugd2lsbCBhZGQgc29tZSBjaGVja3MgdG8gd2Fybmlu
ZyB1c2VyIGFib3V0IGNyb3NzLW5vZGVzDQpjb25maWd1cmF0aW9uLiBCdXQgbm93LCBJIHRoaW5r
IGl0J3MgYmV0dGVyIGZvciBQZW5ueSB0byByZW1vdmUgdGhpcw0KY29tbWVudC4NCg0KPiA+ICsg
ICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8uc3RhdGljX21lbS5ucl9iYW5rczsg
YmFuaysrICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGJhbmtfc3Rh
cnQgPQ0KPiBQRk5fVVAoYm9vdGluZm8uc3RhdGljX21lbS5iYW5rW2JhbmtdLnN0YXJ0KTsNCj4g
PiArICAgICAgICB1bnNpZ25lZCBsb25nIGJhbmtfc2l6ZSA9DQo+IFBGTl9ET1dOKGJvb3RpbmZv
LnN0YXRpY19tZW0uYmFua1tiYW5rXS5zaXplKTsNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25n
IGJhbmtfZW5kID0gYmFua19zdGFydCArIGJhbmtfc2l6ZTsNCj4gPiArDQo+ID4gKyAgICAgICAg
aWYgKCBiYW5rX2VuZCA8PSBiYW5rX3N0YXJ0ICkNCj4gPiArICAgICAgICAgICAgcmV0dXJuOw0K
PiA+ICsNCj4gPiArICAgICAgICBmcmVlX3N0YXRpY21lbV9wYWdlcyhtZm5fdG9fcGFnZShfbWZu
KGJhbmtfc3RhcnQpKSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiYW5rX3Np
emUsIGZhbHNlKTsNCj4gPiArICAgIH0NCj4gPiArfQ0KPiA+ICsNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

