Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9753F96CE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173511.316588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJY5j-0003px-Fu; Fri, 27 Aug 2021 09:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173511.316588; Fri, 27 Aug 2021 09:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJY5j-0003oA-Cf; Fri, 27 Aug 2021 09:24:03 +0000
Received: by outflank-mailman (input) for mailman id 173511;
 Fri, 27 Aug 2021 09:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zv0+=NS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJY5h-0003o4-9I
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:24:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bcaf874-450f-4b5b-ad61-d03d8461d7e8;
 Fri, 27 Aug 2021 09:23:58 +0000 (UTC)
Received: from AM6P194CA0107.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::48)
 by AM6PR08MB4833.eurprd08.prod.outlook.com (2603:10a6:20b:ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 09:23:56 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::4d) by AM6P194CA0107.outlook.office365.com
 (2603:10a6:209:8f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 09:23:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:23:55 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 27 Aug 2021 09:23:54 +0000
Received: from 7634b0c5fa4f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CE03F89-95B1-45CD-A10F-D688F904F350.1; 
 Fri, 27 Aug 2021 09:23:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7634b0c5fa4f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Aug 2021 09:23:49 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB2037.eurprd08.prod.outlook.com (2603:10a6:4:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Fri, 27 Aug
 2021 09:23:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 09:23:46 +0000
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
X-Inumbo-ID: 5bcaf874-450f-4b5b-ad61-d03d8461d7e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/dgzqWrOHjZ7rsW8BNm6AeKS0e5SxwYmzSQqTo1Y80=;
 b=qfC58wDNytI6+QPgRr7ZYIWHk9f3jCPdaa5Ggi+WW8CLYPoZW86Ji/VJTNdyg+CkEHQdFJ2k9qMKzWQFzVoVbdI8G/+ESh3vYoL4a1VItG4vI/fJhvrDhLO0W8Fs5rG/ScsVQy43hZwrQC9sjaxsg1F2kV0EOy7mVjMG1qqDJH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asgyrE9QDwdb35ncOMkucxT6awreiGhpF8AHQ/YuC1o6Um98eWYfeyAbMUBIz78NBrjvqq1yX9P1g4bmdWqzX7wuVhzaNsJPM2hv/Z/g0ptSN/mnp5SEbG0GjHKSA8a+w87jAhxQmUax0bbREemkRy2cWrnzI66WBxH2JsSnYt8aVzF5p4EdJxWqo2LmpLeQhngdVIUTAYKEHA2APftGCFUQBXGywMuLYjWXjhhhwcLL2J2+W5i9vE4Bz8YoJygLWnv9+qbNcbXGMwc4xml9I453s/SiwYecIWkKRVM2w5YWfiRc9C3WJt7f5TA76WIZQSMcHpp7n5DWEJWBN0YBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/dgzqWrOHjZ7rsW8BNm6AeKS0e5SxwYmzSQqTo1Y80=;
 b=muhLISF0pM0hiob/duNvy3mNR5yKPFnbEiQ9zMZOXoj5/8aDjEdrlYcvbSYgGJ9Eso6vG3WVmKFA2qb053g43VROMXP5ziWKUaHJ9lrQcFkN3xwMS+dRQMszbApMR8wnVddPJX31M2+otsKjEMlwts9ZOVfk7aohVuMjJortWWDsLLc0Evjss12x73iDo4F20VxoYYTnD9lJ8SnV2Op7BXOPKf2o89GZPYuBpKPUCd7X1rQxWDDyKq5dbTpuawOiTv3tg/COGKoJaC+n1lIhNxKS3OoXqO/oQSKYjSE7p/kHgdkwi0y9LCiXTc6VsDVmRP8L5RdX7ZEo3vk8wxov9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/dgzqWrOHjZ7rsW8BNm6AeKS0e5SxwYmzSQqTo1Y80=;
 b=qfC58wDNytI6+QPgRr7ZYIWHk9f3jCPdaa5Ggi+WW8CLYPoZW86Ji/VJTNdyg+CkEHQdFJ2k9qMKzWQFzVoVbdI8G/+ESh3vYoL4a1VItG4vI/fJhvrDhLO0W8Fs5rG/ScsVQy43hZwrQC9sjaxsg1F2kV0EOy7mVjMG1qqDJH8=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
Thread-Topic: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
Thread-Index: AQHXjptJE815hXcKO0qqVfBN7cbO2auGhemAgAAfq8A=
Date: Fri, 27 Aug 2021 09:23:46 +0000
Message-ID:
 <DB9PR08MB6857EB87F9CA75CA71A085FF9EC89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-19-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261622500.24433@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108261622500.24433@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5C07ACE86169644BA1F02F1058CD806.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 910a4c54-8fe8-4b34-94e3-08d9693c647e
x-ms-traffictypediagnostic: DB6PR0801MB2037:|AM6PR08MB4833:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4833C3423E7FBD69A9044BB49EC89@AM6PR08MB4833.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mo5FG/D+rb8Aw9sPrfFK+aRJ6rA1cGjbHF4zx5KOt2WljlCGf79Bt6nJlbxDj+SLRkL26MCbrgOEbT5BRdQe1fGz/frmS72fesSz+SPbaAg+iJgCOAgw1LKblizSqUKT7u33utfIKjdzx/ZLFlSUtI5shISDidt4LkS5CUguhesYoGIW1OiIZOUHOv//zriTYRR71k/CnsMaImhlj6Kq9plQYK7p9EHLrLl0nydoIuEUfPkFYVY7Lf6BWA6a8j5Ohe4u87EkSU4rztEKXYotL+qHaGZcrD1nxZa+7O6KTr1xiwSd9WSPcN5L0JkdShGGwnolsGeIg5vUNqhzS/4z2ZNwvV15AkVByzOIBrNDYk6PJYY8h+jEXPJQ+zhma0N4T3VXWbR5B3RJd5W6CNQBf/es12H85DuL6YqHvY5ktscikmuNt9h9l8Sx3doY+2EXc5/QtlFOdO6+1n/CuOQ/AR+JVL0s+p1GMeE6o7iaRnZqK+3KY3hp/vX4ARyn+guJdpoweU9pP3rnQYv12FJzeZGiWpp8sYAS2gL82G2SJUpJhR/Fh1lQXyPF+W6T6MLQ0epksHpUgk7mPhmurovHZNDKGlduFgk9zeYm78L1yiHQA+rBVpsCaY8WtexNZFP4HE2g5js8bgLoHa6orB+y78qb4YV4b41a9GG/2Kuq2BqtKbil+a0xOX6LC7bcxfVPk951y4hyL0sYlWUUlfwlOw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6506007)(55016002)(5660300002)(38100700002)(4326008)(122000001)(83380400001)(53546011)(186003)(478600001)(8936002)(2906002)(38070700005)(66446008)(6916009)(54906003)(66946007)(66476007)(33656002)(52536014)(7696005)(66556008)(86362001)(76116006)(64756008)(8676002)(316002)(71200400001)(26005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZEJVSzRSVUpYT2x0aFJLUEQ4YTFBTXhqQ3pmdXB5L3JLLzRES25UL3p4amJ5?=
 =?gb2312?B?UUI4a0JJZWNRSUJuUXJ0S2lkTVA1OTRUMHZTakpveE11TXp2YnFSK2pkeTZY?=
 =?gb2312?B?elhoMFZweDVMaHdOLy9HN1JuM09MTDN1WmJoajZjTVhCcGU1N0tYQXdER3J5?=
 =?gb2312?B?eGI4aWt2TkxtQThrQ2I2eDkrSmI2ZUJzaHcvU0J3TTB4WVlIckg2K01vYWpF?=
 =?gb2312?B?OEY3UHhiWkNwQzhFdG9YOEVtSmdGbEpPVjYrM0VPTzU3WGsvVVBockVnL3Np?=
 =?gb2312?B?SmVPaTZHY2VSeDB1WVE1MUw4Vy9ZdGNjT2gxZC9nUjFPOW5ocmR3RUFjL21G?=
 =?gb2312?B?ZDVyWFl0ZGR5MnZSeTJUdFZVeUJHUEhSNWorZXdTTGhFRVpZWlA3T1lFVThY?=
 =?gb2312?B?cjB1L254K3RWZDhDRjNqbXN3TGVzNXV3MXRqNWZ5Mk4vQy9MN1kzWTM2SDBu?=
 =?gb2312?B?TUlXRHROVjMxektWYWxxempiL0NOaGV3eFdUbTVhMm9SVndTZFBBeGJ2RkIv?=
 =?gb2312?B?SjZldjdBYmRRSE1HNk80WWxVUGZzaWp4TWdpK0tHNTkrSUdwUlh6WVJsT2c0?=
 =?gb2312?B?Ylp4STlycHpONTFucHdLRENyVk9CNjB6NDFZcnQ4dGJkMFl6TDB2OXpXcUYv?=
 =?gb2312?B?ak4zdjdBaXRJN1NEQ3hQSmVDeXZtQTVsbUlGc1JpWE9rMUlZcngwSGFBL1Qv?=
 =?gb2312?B?VU4yRnhjVEt4aDlSTisycjhnQ09qTURVMkI1SGZjVUF6VktvY0JJVlNuOTdU?=
 =?gb2312?B?d01RMXh2cDM3RDNhNW1JREJ5YjR0RmVnNFNPaXlZa05kTytLYnpsNng3ZmtI?=
 =?gb2312?B?cGpYM1hsUitjdG1JZjNwZXYza0JiWldvWGROandHaGFTcGRhR1MrandIVGJG?=
 =?gb2312?B?a051Q3oxZ2dCVkp4bisxeXFsQ3ZHS2VHbk5RUHdqU2JjMlRxWkhYa2Y0Rm5B?=
 =?gb2312?B?a0kwaUZJLzJLQW45SzBMbEJnNWJibVJiOHdQS1RwYk1ITkNaUk9wZzJFcGZG?=
 =?gb2312?B?bldIandKSlV0dnhuMVZVVkdEb3hMVDhXTEZYSmlmL0RyeGx6SjNvUzFrWTJy?=
 =?gb2312?B?M2V3b2FqUDEvaTF6SVpKcUU0a2YyQVlHZ1JBc0REN2VxQ2VyQ2pDTGUrOGtw?=
 =?gb2312?B?dzV3b1ZBRWlUTFFrN1FqTzNlNHdJYXFqb01KUXE0QjhyaVFDdzdURVJuMjIr?=
 =?gb2312?B?aVlvYm1FZndlZnFKM1h6TDUxUU8vMEhOQ1RpNVZPblhCSTJVTlN0V3FVa0lH?=
 =?gb2312?B?RndmWnJGTW9nbkRIempVRkpMeGdPTlNhM1NuVmFzZlJPM2hjNGFhVGFPQkR1?=
 =?gb2312?B?emllNWhuNjhXTExCTVp5U2lLWlpXUzFBb2o5SUQ3WjVUdTdDZTFyZ09uUGx3?=
 =?gb2312?B?VitBajVyeUZCdGlwL21uRFViQkpqaXZ3QWZ2VTlteWlWb2wrS21jaUhnNFEx?=
 =?gb2312?B?YVhxZmlZZTQ3dGxGbmg2N3JCa0pzQXdmRm53R0RLZWdkQXQyQ0JIT1NCSFFL?=
 =?gb2312?B?S05tazlabk1aNFE5c1ZsdW9qNHNtU0Vsalc0bjhJWXBOZ1BtM21FNzgrVlFa?=
 =?gb2312?B?V1E3NlpkMWI3N3VqRGhYcllLSGhOUzRPbjdWemFnWk8zVWsxdDJQRTVTQkEy?=
 =?gb2312?B?ZWdqNGMweW02TmY2clgzRHZGZUNVRStLWVl2akFWcGREU2dLTWQrNWNiejEz?=
 =?gb2312?B?eEtwem1EMmRBNDlNR3NDVmRsekYvUGtlVFdQdkxHb1RuL2sxUUsyZlVGTlNY?=
 =?gb2312?Q?IOgfcuJpDEY8czpbyV+tbDv1Plwh5Qcldbxwbmk?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2037
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a44e1137-891f-4ef6-2b7e-08d9693c5f55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mPDL7Id34tTiZibcJg/zwnoXBCrlIzasVueWGtOfWIC+aF+kTZCe6fYHo2F3CbD6iITNueOwZz50BcwO1QpB1aep4OipF9bze/WGNSlN+H8Q3NtofrSAl6/67cTszfsjMxB4RKiA5jqPcKEa+M2v+hIsYcdYAzKrW1yNzM16Q1JvvroclpBnsCrCj5NIjudg0wRYoCTONuLsghZZ4n5Kiu9QvliFW+woqTtuzSYZNmo0o8+/85yd8M31MzGpA1wdEioo2j+Mjp+SiAtud9IsQAlNU0rEzoksP+OYP/hoaAlXBihED/bU2m39sH4ycBmlLKUVB83m2KZNiQWNwKHl7pxZkTxnEf4vtFhYNacnECQsRPz/YR5NImjXLSZ/F2mrC34eBsF7M+6CDJVe31ELKHRoUesxFJbZfpZdLReCPf8Zky7NDgxs02y2m66iWDWHAhsZzj04zBKuYYfKepwLaN9Xq5k0W4B1+Zjr6umFQkRWXuNCg3GrmYto/GMzxcTdv+1gC2bR4CeMCC/wbrXKFr4i8GkMEzSErOWLO93R0ycW25QOTPZZS5tYy2zsrUeUHkfEftd/RTD/KsIs957sCwLlIK49pwi5rOdqFdO7MQXhRzCvv1YVfkW//iJtnnGaBIWpPhN/eg5FL1mlKQ/46EGe1lkaaB1u+DIJlxaWcIgEy1MAl2wmx577Nnbd2Ishy+JK0wvRaGhKP/EGM+pI/0Q1JTPHBnYDxX4SWTpoKis=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(33656002)(6862004)(54906003)(508600001)(8676002)(55016002)(47076005)(86362001)(2906002)(36860700001)(316002)(52536014)(5660300002)(70586007)(186003)(9686003)(6506007)(81166007)(53546011)(82310400003)(83380400001)(356005)(8936002)(26005)(7696005)(336012)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:23:55.3767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 910a4c54-8fe8-4b34-94e3-08d9693c647e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4833

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI3yNUgNzoyNQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMTgvNDBd
IHhlbi9hcm06IEtlZXAgbWVtb3J5IG5vZGVzIGluIGR0YiBmb3INCj4gTlVNQSB3aGVuIGJvb3Qg
ZnJvbSBFRkkNCj4gDQo+IE9uIFdlZCwgMTEgQXVnIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
IEVGSSBjYW4gZ2V0IG1lbW9yeSBtYXAgZnJvbSBFRkkgc3lzdGVtIHRhYmxlLiBCdXQgRUZJIHN5
c3RlbQ0KPiA+IHRhYmxlIGRvZXNuJ3QgY29udGFpbiBtZW1vcnkgTlVNQSBpbmZvcm1hdGlvbiwg
RUZJIGRlcGVuZHMgb24NCj4gPiBBQ1BJIFNSQVQgb3IgZGV2aWNlIHRyZWUgbWVtb3J5IG5vZGUg
dG8gcGFyc2UgbWVtb3J5IGJsb2NrcycNCj4gPiBOVU1BIG1hcHBpbmcuDQo+ID4NCj4gPiBCdXQg
aW4gY3VycmVudCBjb2RlLCB3aGVuIFhlbiBpcyBib290aW5nIGZyb20gRUZJLCBpdCB3aWxsDQo+
ID4gZGVsZXRlIGFsbCBtZW1vcnkgbm9kZXMgaW4gZGV2aWNlIHRyZWUuIFNvIGluIFVFRkkgKyBE
VEINCj4gPiBib290LCB3ZSBkb24ndCBoYXZlIG51bWEtbm9kZS1pZCBmb3IgbWVtb3J5IGJsb2Nr
cyBhbnkgbW9yZS4NCj4gPg0KPiA+IFNvIGluIHRoaXMgcGF0Y2gsIHdlIHdpbGwga2VlcCBtZW1v
cnkgbm9kZXMgaW4gZGV2aWNlIHRyZWUgZm9yDQo+ID4gTlVNQSBjb2RlIHRvIHBhcnNlIG1lbW9y
eSBudW1hLW5vZGUtaWQgbGF0ZXIuDQo+ID4NCj4gPiBBcyBhIHNpZGUgZWZmZWN0LCBpZiB3ZSBz
dGlsbCBwYXJzZSBib290IG1lbW9yeSBpbmZvcm1hdGlvbiBpbg0KPiA+IGVhcmx5X3NjYW5fbm9k
ZSwgYm9vdG1lbS5pbmZvIHdpbGwgY2FsY3VsYXRlIG1lbW9yeSByYW5nZXMgaW4NCj4gPiBtZW1v
cnkgbm9kZXMgdHdpY2UuIFNvIHdlIGhhdmUgdG8gcHJ2ZW50IGVhcmx5X3NjYW5fbm9kZSB0bw0K
PiA+IHBhcnNlIG1lbW9yeSBub2RlcyBpbiBFRkkgYm9vdC4NCj4gPg0KPiA+IEFzIEVGSSBBUElz
IG9ubHkgY2FuIGJlIHVzZWQgaW4gQXJtNjQsIHNvIHdlIGludHJvZHVjZWQgYSB3cmFwcGVyDQo+
ID4gaW4gaGVhZGVyIGZpbGUgdG8gcHJldmVudCAjaWZkZWYgQ09ORklHX0FSTV82NC8zMiBpbiBj
b2RlIGJsb2NrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICB8ICA4ICsr
KysrKystDQo+ID4gIHhlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaCB8IDI1IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIHwgIDYgKysr
KysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9h
cmNoL2FybS9ib290ZmR0LmMNCj4gPiBpbmRleCA0NzZlMzJlMGY1Li43ZGYxNDlkYmNhIDEwMDY0
NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gPiArKysgYi94ZW4vYXJjaC9h
cm0vYm9vdGZkdC5jDQo+ID4gQEAgLTExLDYgKzExLDcgQEANCj4gPiAgI2luY2x1ZGUgPHhlbi9s
aWIuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9rZXJuZWwuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9p
bml0Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vZWZpLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vZGV2
aWNlX3RyZWUuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+DQo+ID4gICNp
bmNsdWRlIDx4ZW4vc29ydC5oPg0KPiA+IEBAIC0zMzUsNyArMzM2LDEyIEBAIHN0YXRpYyBpbnQg
X19pbml0IGVhcmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQsDQo+ID4gIHsNCj4gPiAgICAg
IGludCByYyA9IDA7DQo+ID4NCj4gPiAtICAgIGlmICggZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVz
KGZkdCwgbm9kZSwgIm1lbW9yeSIpICkNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJZiBzeXN0
ZW0gYm9vdCBmcm9tIEVGSSwgYm9vdGluZm8ubWVtIGhhcyBiZWVuIHNldCBieSBFRkksDQo+ID4g
KyAgICAgKiBzbyB3ZSBkb24ndCBuZWVkIHRvIHBhcnNlIG1lbW9yeSBub2RlIGZyb20gRFRCLg0K
PiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGRldmljZV90cmVlX25vZGVfbWF0Y2hlcyhmZHQs
IG5vZGUsICJtZW1vcnkiKSAmJg0KPiA+ICsgICAgICAgICAhYXJjaF9lZmlfZW5hYmxlZChFRklf
Qk9PVCkgKQ0KPiA+ICAgICAgICAgIHJjID0gcHJvY2Vzc19tZW1vcnlfbm9kZShmZHQsIG5vZGUs
IG5hbWUsIGRlcHRoLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRy
ZXNzX2NlbGxzLCBzaXplX2NlbGxzLA0KPiAmYm9vdGluZm8ubWVtKTsNCj4gPiAgICAgIGVsc2Ug
aWYgKCBkZXB0aCA9PSAxICYmICFkdF9ub2RlX2NtcChuYW1lLCAicmVzZXJ2ZWQtbWVtb3J5Iikg
KQ0KPiANCj4gDQo+IElmIHdlIGFyZSBnb2luZyB0byB1c2UgdGhlIGRldmljZSB0cmVlIGluZm8g
Zm9yIHRoZSBudW1hIG5vZGVzIChhbmQNCj4gcmVsYXRlZCBtZW1vcnkpIGRvZXMgaXQgbWFrZSBz
ZW5zZSB0byBzdGlsbCByZWx5IG9uIHRoZSBFRkkgdGFibGVzIGZvcg0KPiB0aGUgbWVtb3J5IG1h
cD8NCj4gDQo+IEkgd29uZGVyIGlmIHdlIHNob3VsZCBqdXN0IHVzZSBkZXZpY2UgdHJlZSBmb3Ig
bWVtb3J5IGFuZCBpZ25vcmUgRUZJDQo+IGluc3RlYWQuIERvIHlvdSBrbm93IHdoYXQgTGludXgg
ZG9lcyBpbiB0aGlzIHJlZ2FyZD8NCg0KV2UgZG9uJ3QgdXNlIGRldmljZSB0cmVlIGZvciBtZW1v
cnkgbWFwIG9uIEVGSSBib290LiBXZSBqdXN0IHJlcGx5IG9uDQpkZXZpY2UgdHJlZSB0byBwcm92
aWRlIG1lbW9yeSBOVU1BIG5vZGUgaW5mby4gQmVjYXVzZSBFRkkgc3lzdGVtIHRhYmxlDQpkb2Vz
bid0IGNvbnRhaW4gdGhpcyBraW5kIG9mIGRhdGEuDQoNCkkgaGF2ZSBhIHF1aWNrIGxvb2sgaW50
byBMaW51eC4gTGludXggZWZpIHN0dWIgaGFzIGEgdXBkYXRlX2ZkdCBmdW5jdGlvbiBpbjoNCmRy
aXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvZmR0LmMuIEluIHRoaXMgZnVuY3Rpb24sIGVmaSBz
dHViIG9ubHkgZGVsZXRlDQpyZXNlcnZlIG1lbW9yeSBub2Rlcy4gVXNhYmxlIG1lbW9yeSBub2Rl
cyB3aWxsIG5vdCBiZSB0b3VjaGVkIGluIHRoaXMgZnVuY3Rpb24uDQoNCkJlZm9yZSBMaW51eCBl
ZmlfaW5pdCwgZWFybHlfaW5pdF9kdF9zY2FuIHdpbGwgYmUgaW52b2tlZC4gVGhpcyBtZWFucywg
aWYgdGhlDQplZmkgc3R1YiBkb2Vzbid0IHJlbW92ZSB0aGUgbm9ybWFsIG1lbW9yeSBub2Rlcywg
dGhlc2Ugbm9kZXMgd2lsbCBiZSBmb3VuZCBhbmQNCmFkZGVkIHRvIG1lbWJsb2NrIGJ5IGVhcmx5
X2luaXRfZHRfYWRkX21lbW9yeV9hcmNoKCk7DQoNCkxhdGVyLCBpbiBlZmlfaW5pdCwgc3l0ZW10
YWJsZS0+bWVtb3J5X2Rlc2NyaXB0aW9uIHdpbGwgYWxzbyBiZSBwYXJzZWQsDQp0aGUgbWVtb3J5
IGJsb2NrIHdpbGwgYmUgYWRkZWQgdG8gbWVtYmxvY2sgYnkgZWFybHlfaW5pdF9kdF9hZGRfbWVt
b3J5X2FyY2guDQpTbyB0aGUgZHVwbGljYXRlZCBtZW1vcnkgbm9kZXMgd2lsbCBiZSBtZXJnZWQv
aWdub3JlZCBpbiBtZW1ibG9ja19hZGQuDQoNCkluIExpbnV4IE5VTUEgaW5pdCwgaWYgQUNQSSBp
cyBvZmYsIHRoZSBOVU1BIGluZm8gd2lsbCBiZSBwYXJzZWQgZnJvbSBEVC4NCg0KU28gSSB0aGlu
ayBpbiBFRkkgYm9vdCwgd2UgdXNlIHN5c3RlbSB0YWJsZSB0byBwYXJzZSBtZW1vcnksIGJ1dCB1
c2UNCkRUIHRvIHBhcnNlIE5VTUEgaW5mby4gSXQgZG9lc24ndCBzZWVtIHBhcnRpY3VsYXJseSBz
dHJhbmdlIDogKQ0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQoNCg0K

