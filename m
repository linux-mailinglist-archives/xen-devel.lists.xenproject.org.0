Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7435D053
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 20:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109408.208843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW1Gq-0006t2-PC; Mon, 12 Apr 2021 18:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109408.208843; Mon, 12 Apr 2021 18:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lW1Gq-0006sd-LC; Mon, 12 Apr 2021 18:26:48 +0000
Received: by outflank-mailman (input) for mailman id 109408;
 Mon, 12 Apr 2021 18:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZ2i=JJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lW1Go-0006sF-N3
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 18:26:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebf599da-710c-43fd-87c9-7bf734b14c15;
 Mon, 12 Apr 2021 18:26:43 +0000 (UTC)
Received: from MRXP264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::35)
 by DB8PR08MB5257.eurprd08.prod.outlook.com (2603:10a6:10:e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 18:26:38 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::bd) by MRXP264CA0023.outlook.office365.com
 (2603:10a6:500:15::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 18:26:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 18:26:38 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Mon, 12 Apr 2021 18:26:37 +0000
Received: from ac80d0ec7a38.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D2794B2-8643-4C05-BB49-5ED286361218.1; 
 Mon, 12 Apr 2021 18:26:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac80d0ec7a38.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Apr 2021 18:26:31 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB9PR08MB7037.eurprd08.prod.outlook.com (2603:10a6:10:2cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 18:26:30 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 18:26:30 +0000
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
X-Inumbo-ID: ebf599da-710c-43fd-87c9-7bf734b14c15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWEKw9xf8ipLCjW5vGcClhSy6q7BtMT+krZEH/M3o4U=;
 b=9F3W8pymBRBvca1XM1stDIfJK2GQabp6wAakFVTov3Ns+OgnB4QSUqvMqhZM5+mAsp/1Oyi7EDwdJvMvoCELzpUsLuegCdGR/qV/FS7vA7/Zwb2sDCRoA2cSZpVOmgv9gPL+giD7eq6pv+czJU7GehHS33lcDPYPJg1lPtI5YnU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2de7741502428a06
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtyCfugHseJfqabfHQYCmdmRZZZ2z/9QioH9+CIg3ihFHPJXee5tQqdbSBumtyoB5WsoXdouTEqGrAWX8SV6YdSeQs9k8nBPCplvUxf5KM65VIYgJIPnWysTSJstiNF5kYzUNHEnKyO3KQeWhwd3TP1i0Q2R4GoUzQEOsy+IqALu55a1bDN6MsbHKH4qW9mRVTlDs+q0idba/Tl8ks4KB+DQZ79obc8edSM2kwBU3Si6TMCFDm/pxubdGVvda7r6UMJNRy+Wh8ggZFpLWPbuO/BVpAA9xvJ8Lni3fS9MRFuvoaqdzhQTponaVtd0DwBe0Uk4OHytSNchD1K1LfhN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWEKw9xf8ipLCjW5vGcClhSy6q7BtMT+krZEH/M3o4U=;
 b=azSv3v4rPH/8znJbVBSsTxTCBr9TbHgfNQw0cutITW1xOExKt+bwNug9fv6glGQl/vPfB90/hrapenUfMCY0yCO2l6ACx/X2C2qoOuQbtNx7ILMKXEjufAY5e+ahvBkaCiMYz5ALSPCoOf4//3PPdoR8TewzW/fAjmyvx9AMW3Soq87evdeaHnLIjh8V3P1eyu13IiM3M9c2gp7x5PB9J1i9hwMKeMyFIPMyVh4UHMB8a0dKL+Q7Ui0y+MkkceK6TYhG3gTN1tlh/MtJ0xCzCNFEO12q0+YKx+d8U/wk9B23jVMAsCdrkfAxKCahpLFBFP7pHKCQNBGNuH3YA4+FbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWEKw9xf8ipLCjW5vGcClhSy6q7BtMT+krZEH/M3o4U=;
 b=9F3W8pymBRBvca1XM1stDIfJK2GQabp6wAakFVTov3Ns+OgnB4QSUqvMqhZM5+mAsp/1Oyi7EDwdJvMvoCELzpUsLuegCdGR/qV/FS7vA7/Zwb2sDCRoA2cSZpVOmgv9gPL+giD7eq6pv+czJU7GehHS33lcDPYPJg1lPtI5YnU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index: AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAAK8YCAAHTTgA==
Date: Mon, 12 Apr 2021 18:26:28 +0000
Message-ID: <9518F24F-EDA3-4C0E-B2A6-DB4A0F868EC3@arm.com>
References:
 <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <7f7383a5-a678-0dbd-cf9f-8a9239f6d391@suse.com>
In-Reply-To: <7f7383a5-a678-0dbd-cf9f-8a9239f6d391@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 478f52f0-e2f7-46a7-cbba-08d8fde082eb
x-ms-traffictypediagnostic: DB9PR08MB7037:|DB8PR08MB5257:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5257AAA37F32CE3F2BA5B005FC709@DB8PR08MB5257.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JvOIr5SeOeQha8dluHe32saSx33F6I/IuXINC4z3UL/JQckWfeHXXL7zRT8JmFjL/ToNZ2LwqiWZeoSm4faSj0LUKQEHjh1pBOei0jnymcCvEISLAmZgEOPKrUoNEiY0073/pNRcynF6P6nmLczAZdZemFxNUcrCRjJgTt9qaFrA8+At/f7VEzjDXWSKp1IYJxNSwdbESvhkTSVTyMl+41mSrkcwCwK7ukBv29Fic0RU4VmuicpP8HFiYD1R+eU0grwuALy9eCjnQzM0/fKjv9tDvBaFWUICLCk1vy1mzvzfFOv7wg/Z7AWShjfpLXVY25f9UM/HymaQasPNIb4x1HuMHTXZ8yVecO+WgEKc8yoXLVoNkG6fyUINRCv7o/QmYboEUBcot4YktmCeLi7mQuR2KpOh7sFOhbpvtJ+X3I5LZxjwpmGCwFpt/yTqk0krrqd8udJuAZ3k5zi/dnklb6vsa0um9rxBQ/UEAKFYDmbbsEK2gE7/p6vAaamzDoyreoqX6NiTZT/Q2caNyaDXxzrCwoDVj3P3NWcV2RhdbQoZvQeibAYRgwf1TGzfj+XkA5cuzycckF5xNMOKxLq9WwxlZc60WrgUchZgfGSTHat3cucNR4kK4JQpKYxs5EkSfzhjMynqCP7nKGH/uJzIjalQ7vekq4+rJwAFZDJF4o7sz/CKQx0LaCUWsIl6yIe/tV7k0juoGM3v+Z6Uk8YmRQV+iRzthZ1g12eThi9XiMD11EXrPOCXkwbNHvZIYzVJWF/MlATq3P0mQSBQGVRRrw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(86362001)(8936002)(83380400001)(2906002)(6916009)(316002)(26005)(4326008)(33656002)(186003)(76116006)(91956017)(64756008)(66556008)(66446008)(36756003)(5660300002)(6506007)(53546011)(478600001)(2616005)(71200400001)(8676002)(7416002)(66476007)(66946007)(54906003)(38100700002)(6486002)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SEZVMmNYQksva2UzSGN4RG5aUEZLTjg0NXpjdU1vN05qSDBqeXlkV25pakZD?=
 =?utf-8?B?RnhCU2FhUnNlYSttYVZjT0tiREFGTkp5c3pobFk1dS9zQjlOekJOaDZPZERm?=
 =?utf-8?B?NW5heHZSZ0pVTE45eFl2QXBGTmxaU2psdUtzakdld3g1RHF3SWRUWWlkbzBE?=
 =?utf-8?B?aTN6VXd0bUlHYTdHRHJhWkd2Z1F1aVFmeUdYQVZWd1FuSU00UUpaWndFMkRw?=
 =?utf-8?B?VWdGNnJBWkVXMGRvaVliVzhBU0JmZm1lc09BN2JnV0grdUVLNXFsOFp2VnV3?=
 =?utf-8?B?d2wzeHpQdWZ1bUhPWnVwRjdKNnpRQ1hpZFlCdFpnTmlRU09iZmhiUUpmZFEx?=
 =?utf-8?B?SDFHQStWRjBCWEUwejV4YStPZFArNFlqWGtsY0xDRUl6WGxhcXIvSklSRExW?=
 =?utf-8?B?anBuK2VtT1hlQWprVDN6aGxvYkhtSnI3YlZuaysyalhSUE00QlpFUEtxYnFP?=
 =?utf-8?B?RjdGck0zbzAyak5zUEJwYWQyOFJJdndVN1Y5TkE4UmRuVmx0QmU1N3lQa0tu?=
 =?utf-8?B?ZUQ5b05XVzBteFgyUWFtbjFPY2xPL29XV3oyQjRDSFZhY3BCUmVSb1hhMC9U?=
 =?utf-8?B?TzRDQzVhTi9FKzA1Y281aGRtejB2TVV2NHhsZnRoYzdqMmxOUnhaUDBWWFZn?=
 =?utf-8?B?SGt3eFJjS1E5eHB1RTRITjlrWitLWW55VDVYQmJFRmtxeEtRcjg5R0NPeHRx?=
 =?utf-8?B?Z2N0TmFaSnBrZ2ZZbnNMSm8zUVljako1c3IwcFFvL0FWbHZWUTVUemgvUTJ6?=
 =?utf-8?B?cFJQVDBDc3Z2YUFLTlU4YkFjQ3l3aGJHV2dsM29JVWttTE1WZW8xVFhNUGdJ?=
 =?utf-8?B?eWJTS3NyTlQyckZYNlVnNG9LVUFxMUFTT2NISlhRalpieDlQWHJWZ01WRDJy?=
 =?utf-8?B?TmlyL3c3ajI1NW04Z2IzUW50WXVGTkRrOVUwZmQ2RjNQYnlkRkxac3hSQmwx?=
 =?utf-8?B?L3IycnFBTkRFYmNmZk1STS9kR3N3N2VqMVYzU1FtdklBZ3A2N05uNGU3Yy9r?=
 =?utf-8?B?QXpmaUhhNjZYUU9TVGVKZ0wxNXRyNHVDQmc4VmJkaWdPYmZZYnYyZFZGaFhR?=
 =?utf-8?B?Z2ZOSUQ0c0FKb21uMUxCbkdCemt5aVExWmlJd0srT05YRC9IVlp5OWlacGxN?=
 =?utf-8?B?a0F2S3JQVDRyWEVhMEEvRDA2MUlkQWdQbzlxNnRKbENZT3lFN25Ea1lkRXZ5?=
 =?utf-8?B?QzFQOCs2WFIxZ2lPR0Y2ek1OVXJxSGg3bkNwODdFNXFVOHNQaVdsQjdlbFBS?=
 =?utf-8?B?YXlzSzVzckR4eUVqcTNjUDFqVzc0djBheFFXckFzM2c3ZjREMk4rYlJIbHV6?=
 =?utf-8?B?ZmhVNUdVME45N1hoZ2VEUVVYdzJIZHJRNFJpbk1IL3RZZENWN3FGTEJyL1JJ?=
 =?utf-8?B?YUthSGpHbGNGRnVyTTdaUjAyUjM0eVd6b0VzT21IaVkrbXJrZVlGbjA5aXdO?=
 =?utf-8?B?YmZDdnZFUVhzYllzeFlVNVFSWUswRnY4V3FKbGNBVFA1Z3hYWm45dkJ6b2x4?=
 =?utf-8?B?ZWsxUmtOc1FIbm1vQlVnMkVlbVBxN0IxVWZncUlmQUJMSEpjZFRuWDN3Zm51?=
 =?utf-8?B?YkhwU2srcXFvbmRZVW5DVXhoSVNFU0MxVG9Semc5UGMrMnluSWlhUXl3cE5T?=
 =?utf-8?B?T05Uei9WTEdCbVhBY0xCTmhGWm5ETWczZ2dJZGdhQzBGVnhhYmsyYzhta2hE?=
 =?utf-8?B?dElUREZkZkdnazhMVXFaUHl0S1RVb2srZExKNVZnM05wKzZGQXlTZWZKcG1t?=
 =?utf-8?Q?/5jYLWYkyjLp5ZjFlNZeRrwXKPzyrFvNOGN1sqZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <769801748A7FDE48879B2A1828AD5223@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7037
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3a8e1a5-2054-4cf8-8f88-08d8fde07dff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XYnv2M6xRd9kNi6hsBeNiZc5Am7fuc8CyIDpK/G41XAFiI11Zgd2mJ0nDVPQ3DoVk4Y9iMZ2j/vDJsepYKHAVMqD6VSsXSPnlBtGDJRqd6md0EDhlIganK3K1kcqvGwhPW+AJc5WUYsosgSeRavmLTy4UlwxiYTx/hSdQMENRuK79DnJlAi7x+WZ0iMhHkEbmFnMt5EKrVsx9kCvdRobVM//CjxZIvarRCeQnmN+/W35maobD5BukbSU6/i4z59brBF3wbF6Xr6kLsn8UsC+2pBcxnGgSB+G8rI2qA7sMZJK047yrXxdS32ZzWlQH8f6pqF0YdoU2TIrZjABpBFCmCM7o5HTNBXi788TJYpU4Een0qiBy69MWfCK3Muc18kru9kp4hH5X1RMUaZOKokjXnv0S3NfYvCCWZogQGN8dq4lwKCeJzVTBv61f3WXYLfe4Bq3kuonnXO6osBNzxKxC8AV54l8f81mAvlOyN0H57+ihF4wKjEAw5JXPiXkJLB77c8gfqND6iXbR9sbTrqw4pPXhVyOK0NdKhuWbLSIysskDm/9AmUrZiZGjt6mYMo6PTOvFyJyK8qYJkLAWqyP+qJFDW6TNbiYIWYvR4dODi+c2Xvr0YU0/UJma3esLXv183xnAwWjpzSBw/STBZ6/7h4UOa7+evIEvCwAM5EsJ7NQ8b9Ff9nGqX7uIzovKIavKBhBgtATfIIAxTdgOMjIVE8s0rZFKzfJts6kaetTJ5aaR+7EXZgKeQNeM8BfU10s
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(316002)(36860700001)(82740400003)(478600001)(356005)(54906003)(53546011)(4326008)(82310400003)(81166007)(6486002)(47076005)(83380400001)(8936002)(6862004)(86362001)(26005)(5660300002)(70586007)(2616005)(336012)(70206006)(8676002)(6506007)(6512007)(33656002)(36756003)(2906002)(186003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 18:26:38.2178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478f52f0-e2f7-46a7-cbba-08d8fde082eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5257

SGkgSmFuLA0KDQo+IE9uIDEyIEFwciAyMDIxLCBhdCAxMjoyOCBwbSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEyLjA0LjIwMjEgMTI6NDksIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBGcmksIEFwciAwOSwgMjAyMSBhdCAwNTowMDo0MVBN
ICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMN
Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvbXNpLmMNCj4+PiBAQCAtMTQxMSw2ICsxNDExLDcwIEBA
IHZvaWQgX19pbml0IGVhcmx5X21zaV9pbml0KHZvaWQpDQo+Pj4gICAgICAgICByZXR1cm47DQo+
Pj4gfQ0KPj4+IA0KPj4+ICtpbnQgYWxsb2NfcGNpX21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+IA0KPj4gSSB3b3VsZCByYXRoZXIgbmFtZSBpdCBwY2lfbXNpX2luaXQuLi4NCj4gDQo+IE9y
IG1heWJlIHBkZXZfbXNpX2luaXQoKSwgYXMgcGNpX21zaV9pbml0KCkgbG9va3MgbW9yZSBsaWtl
IGEgb25lLQ0KPiB0aW1lLCBnbG9iYWwgaW5pdCBmdW5jdGlvbj8NCj4gDQpPay4gSSB3aWxsIHVz
ZSBwZGV2X21zaV9pbml0KCkuDQoNCj4+PiArdm9pZCBmcmVlX3BjaV9tc2koc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+PiANCj4+IC4uLmFuZCBwY2lfbXNpX2ZyZWUuDQo+IA0KPiBUaGUgY291bnRl
cnBhcnQgb2YgImluaXQiIHJlYWxseSB3b3VsZCBiZSAiZGVpbml0IiwgSU9XIEknZCBsaWtlIHRv
DQo+IGFzayBmb3IgZWl0aGVyIGFsbG9jL2ZyZWUgb3IgaW5pdC9kZWluaXQuDQoNCk9rLiBJIHdp
bGwgdXNlIHBkZXZfbXNpX2RlaW5pdCgpLg0KPiANCj4+PiArew0KPj4+ICsgICAgeGZyZWUocGRl
di0+bXNpeCk7DQo+IA0KPiBDb3VsZCB0aGlzIG1heWJlIGJlY29tZSBYRlJFRSgpIGF0IHRoaXMg
b2NjYXNpb24/DQoNCk9rLg0KPiANCj4+PiAraW50IHBjaV9hc3NpZ25fbXNpeF9pbml0KHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gDQo+PiBUaGlzIGtpbmQgb2Yg
YSBjb25mdXNpbmcgbmFtZSAtIHdoYXQgYWJvdXQgcGNpX21zaXhfYXNzaWduPw0KPj4gDQo+Pj4g
K3sNCj4+PiArICAgIGludCByYzsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIHBkZXYtPm1zaXggKQ0K
PiANCj4gV291bGRuJ3QgdGhpcyBjaGVjayBiZXR0ZXIgbGl2ZSBpbiB0aGUgc29sZSBjYWxsZXI/
DQoNCk9rLg0KPiANCj4gDQo+Pj4gK3ZvaWQgZHVtcF9wY2lfbXNpKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPiANCj4gcGRldl9kdW1wX21zaSgpIG9yIHNvbWUgc3VjaD8NCj4gDQo+IEFsc28gLSBj
b25zdCBoZXJlIGFuZCAuLi4NCg0KT2suDQo+IA0KPj4+ICt7DQo+Pj4gKyAgICBzdHJ1Y3QgbXNp
X2Rlc2MgKm1zaTsNCj4gDQo+IC4uLiBoZXJlIHBsZWFzZSwgd2hpbGUgeW91IGFscmVhZHkgbW92
ZSB0aGlzIGNvZGUuDQpPay4NCj4gDQo+Pj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNp
LCAmcGRldi0+bXNpX2xpc3QsIGxpc3QgKQ0KPj4+ICsgICAgICAgIHByaW50aygiJWQgIiwgbXNp
LT5pcnEpOw0KPj4+ICt9DQo+PiANCj4+IEkgd29uZGVyLCB0aG9zZSB0aG9zZSBmdW5jdGlvbiBy
ZWFsbHkgd2FudCB0byBiZSBpbiBhIHg4NiBzcGVjaWZpYw0KPj4gZmlsZT8gVGhlcmUncyBub3Ro
aW5nIHg4NiBzcGVjaWZpYyBhYm91dCB0aGVtIEFGQUlDVC4NCj4+IA0KPj4gV291bGQgaXQgbWFr
ZSBzZW5zZSB0byBjcmVhdGUgYSBzZXBhcmF0ZSBtc2ktaW50ZXJjZXB0LmMgZmlsZSB3aXRoDQo+
PiB0aG9zZSB0aGF0IGdldHMgaW5jbHVkZWQgd2hlbiBDT05GSUdfUENJX01TSV9JTlRFUkNFUFQ/
DQo+IA0KPiArMQ0KPiANCj4+PiBAQCAtMTMwMywxMiArMTI3OSwxNSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBzZXR1cF9kdW1wX3BjaWRldnModm9pZCkNCj4+PiB9DQo+Pj4gX19pbml0Y2FsbChzZXR1
cF9kdW1wX3BjaWRldnMpOw0KPj4+IA0KPj4+ICsNCj4+PiArI2lmZGVmIENPTkZJR19QQ0lfTVNJ
X0lOVEVSQ0VQVA0KPiANCj4gTm8gZG91YmxlIGJsYW5rIGxpbmVzIHBsZWFzZS4NCg0KT2suDQo+
IA0KPj4+IGludCBpb21tdV91cGRhdGVfaXJlX2Zyb21fbXNpKA0KPj4+ICAgICBzdHJ1Y3QgbXNp
X2Rlc2MgKm1zaV9kZXNjLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQ0KPj4+IHsNCj4+PiAgICAgcmV0
dXJuIGlvbW11X2ludHJlbWFwDQo+Pj4gICAgICAgICAgICA/IGlvbW11X2NhbGwoJmlvbW11X29w
cywgdXBkYXRlX2lyZV9mcm9tX21zaSwgbXNpX2Rlc2MsIG1zZykgOiAwOw0KPj4+IH0NCj4+PiAr
I2VuZGlmDQo+PiANCj4+IFRoaXMgaXMgbm90IGV4YWN0bHkgcmVsYXRlZCB0byBNU0kgaW50ZXJj
ZXB0cywgdGhlIElPTU1VIGludGVycnVwdA0KPj4gcmVtYXBwaW5nIHRhYmxlIHdpbGwgYWxzbyBi
ZSB1c2VkIGZvciBpbnRlcnJ1cHQgZW50cmllcyBmb3IgZGV2aWNlcw0KPj4gYmVpbmcgdXNlZCBi
eSBYZW4gZGlyZWN0bHksIHdoZXJlIG5vIGludGVyY2VwdCBpcyByZXF1aXJlZC4NCj4+IA0KPj4g
QW5kIHRoZW4geW91IGFsc28gd2FudCB0byBnYXRlIHRoZSBob29rIGZyb20gaW9tbXVfb3BzIGl0
c2VsZiB3aXRoDQo+PiBDT05GSUdfUENJX01TSV9JTlRFUkNFUFQsIGlmIHdlIHdhbnQgdG8gZ290
IHRoaXMgcm91dGUuDQo+IA0KPiBJIHRoaW5rIHRoZSB0d28gYXNwZWN0cyBvZiBNU0kgc2hvdWxk
IGJlIGtlcHQgc2VwYXJhdGUuDQoNCk9rLiBJIHdpbGwgc3BsaXQgdGhlIHBhdGNoIGluIHR3byBw
YXRjaGVzLg0KPiANCj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvS2NvbmZpZw0KPj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3BjaS9LY29uZmlnDQo+Pj4gQEAgLTEsMyArMSw3IEBADQo+Pj4gDQo+Pj4g
Y29uZmlnIEhBU19QQ0kNCj4+PiAJYm9vbA0KPj4+ICsNCj4+PiArY29uZmlnIFBDSV9NU0lfSU5U
RVJDRVBUDQo+Pj4gKwlkZWZfYm9vbCB5DQo+Pj4gKwlkZXBlbmRzIG9uIFg4NiAmJiBIQVNfUENJ
DQo+IA0KPiBEZXBlbmRpbmcgb24gSEFTX1BDSSBpcyBmaW5lIChhbGJlaXQgbm90IHN0cmljdGx5
IG5lZWRlZCBhZmFpY3QpLA0KPiBidXQgdGhpcyBzaG91bGRuJ3QgaGF2ZSBhIGRlZmF1bHQgKGxp
a2UgSEFTX1BDSSBkb2Vzbid0KSBhbmQNCj4gaW5zdGVhZCBiZSBzZWxlY3RlZCBieSB4ODYuDQoN
Ck9rLg0KPiANCj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4gQEAgLTQ4LDggKzQ4LDcgQEAgdm9pZCB2cGNpX3Jl
bW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4gICAgICAgICB4ZnJlZShyKTsN
Cj4+PiAgICAgfQ0KPj4+ICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4g
LSAgICB4ZnJlZShwZGV2LT52cGNpLT5tc2l4KTsNCj4+PiAtICAgIHhmcmVlKHBkZXYtPnZwY2kt
Pm1zaSk7DQo+Pj4gKyAgICBmcmVlX3ZwY2lfbXNpKHBkZXYpOw0KPiANCj4gSSBkb24ndCB0aGlu
ayB0aGUgZnVuY3Rpb24gbmVlZHMgdG8gYmUgcGFzc2VkIGEgcGRldiwgYW5kIC4uLg0KDQpPay4N
Cj4+PiAgICAgeGZyZWUocGRldi0+dnBjaSk7DQo+Pj4gICAgIHBkZXYtPnZwY2kgPSBOVUxMOw0K
PiANCj4gLi4uIGl0IHdvdWxkIG9ubHkgYmUgY29uc2lzdGVudCB3aXRoIHRoaXMgaWYgcGRldi0+
dnBjaSB3YXMgcGFzc2VkDQo+IGluc3RlYWQuDQpPSy4NCj4gDQo+Pj4gLS0tIC9kZXYvbnVsbA0K
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbXNpLmgNCj4+PiBAQCAtMCwwICsxLDQ0IEBA
DQo+Pj4gKy8qDQo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBBcm0gTHRkLg0KPj4+ICsgKg0K
Pj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yIG1vZGlmeQ0KPj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPj4+ICsgKiBwdWJsaXNoZWQg
YnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4+PiArICoNCj4+PiArICogVGhpcyBw
cm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWws
DQo+Pj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBs
aWVkIHdhcnJhbnR5IG9mDQo+Pj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4+PiArICogR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4+PiArICoNCj4+PiArICogWW91IHNob3VsZCBo
YXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4+
PiArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5n
bnUub3JnL2xpY2Vuc2VzLz4uDQo+Pj4gKyAqLw0KPj4+ICsNCj4+PiArI2lmbmRlZiBfX0FTTV9N
U0lfSF8NCj4+PiArI2RlZmluZSBfX0FTTV9NU0lfSF8NCj4+PiArDQo+Pj4gK3N0YXRpYyBpbmxp
bmUgaW50IGFsbG9jX3BjaV9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4gK3sNCj4+PiAr
ICAgIHJldHVybiAwOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW5saW5lIGludCBwY2lf
YXNzaWduX21zaXhfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikN
Cj4+PiArew0KPj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBkdW1wX3BjaV9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpIHt9DQo+Pj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBmcmVlX3BjaV9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpIHt9DQo+
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwY2lfY2xlYW51cF9tc2koc3RydWN0IHBjaV9kZXYgKnBk
ZXYpIHt9DQo+Pj4gKw0KPj4+ICsjZW5kaWYgLyogX19BU01fTVNJX0ggKi8NCj4+PiArDQo+Pj4g
Ky8qDQo+Pj4gKyAqIExvY2FsIHZhcmlhYmxlczoNCj4+PiArICogbW9kZTogQw0KPj4+ICsgKiBj
LWZpbGUtc3R5bGU6ICJCU0QiDQo+Pj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0DQo+Pj4gKyAqIHRh
Yi13aWR0aDogNA0KPj4+ICsgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwNCj4+PiArICogRW5kOg0K
Pj4+ICsgKi8NCj4+IA0KPj4gU2hvdWxkIHlvdSBpbnN0ZWFkIGhhdmUgYSBub24tYXJjaCBzcGVj
aWZpYyBmaWxlIHdpdGggdGhvc2UgZHVtbXkNCj4+IGhlbHBlcnMgdGhhdCBnZXQgdXNlZCB3aGVu
ICFDT05GSUdfUENJX01TSV9JTlRFUkNFUFQ/DQo+IA0KPiArMQ0KPiANCj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L21zaS5oDQo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc2ku
aA0KPj4+IEBAIC0yNTIsNSArMjUyLDkgQEAgdm9pZCB1bm1hc2tfbXNpX2lycShzdHJ1Y3QgaXJx
X2Rlc2MgKik7DQo+Pj4gdm9pZCBndWVzdF9tYXNrX21zaV9pcnEoc3RydWN0IGlycV9kZXNjICos
IGJvb2wgbWFzayk7DQo+Pj4gdm9pZCBhY2tfbm9ubWFza2FibGVfbXNpX2lycShzdHJ1Y3QgaXJx
X2Rlc2MgKik7DQo+Pj4gdm9pZCBzZXRfbXNpX2FmZmluaXR5KHN0cnVjdCBpcnFfZGVzYyAqLCBj
b25zdCBjcHVtYXNrX3QgKik7DQo+Pj4gK2ludCBhbGxvY19wY2lfbXNpKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KTsNCj4+PiArdm9pZCBmcmVlX3BjaV9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0K
Pj4+ICt2b2lkIGR1bXBfcGNpX21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+Pj4gK2ludCBw
Y2lfYXNzaWduX21zaXhfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRl
dik7DQo+IA0KPiBUaGVzZSBzaG91bGQgdGhlbiBsaXZlIGluIHRoZSBvdGhlciAiaGFsZiIgb2Yg
dGhhdCBoZWFkZXIuDQoNCk9rIFllcyBub3RlZA0KPiANCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+PiBAQCAtNzksMTAg
Kzc5LDYgQEAgc3RydWN0IHBjaV9kZXYgew0KPj4+ICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGFsbGRl
dnNfbGlzdDsNCj4+PiAgICAgc3RydWN0IGxpc3RfaGVhZCBkb21haW5fbGlzdDsNCj4+PiANCj4+
PiAtICAgIHN0cnVjdCBsaXN0X2hlYWQgbXNpX2xpc3Q7DQo+Pj4gLQ0KPj4+IC0gICAgc3RydWN0
IGFyY2hfbXNpeCAqbXNpeDsNCj4+PiAtDQo+Pj4gICAgIHN0cnVjdCBkb21haW4gKmRvbWFpbjsN
Cj4+PiANCj4+PiAgICAgY29uc3QgdW5pb24gew0KPj4+IEBAIC05NCw3ICs5MCwxNCBAQCBzdHJ1
Y3QgcGNpX2RldiB7DQo+Pj4gICAgICAgICBwY2lfc2JkZl90IHNiZGY7DQo+Pj4gICAgIH07DQo+
Pj4gDQo+Pj4gKyNpZmRlZiBDT05GSUdfUENJX01TSV9JTlRFUkNFUFQNCj4+PiArICAgIHN0cnVj
dCBsaXN0X2hlYWQgbXNpX2xpc3Q7DQo+Pj4gKw0KPj4+ICsgICAgc3RydWN0IGFyY2hfbXNpeCAq
bXNpeDsNCj4+PiArDQo+Pj4gICAgIHVpbnQ4X3QgbXNpX21heHZlYzsNCj4+PiArI2VuZGlmDQo+
Pj4gKw0KPj4+ICAgICB1aW50OF90IHBoYW50b21fc3RyaWRlOw0KPiANCj4gTGlrZSBSb2dlciBh
bHNvIHNhaWQgZm9yIHN0cnVjdCB2cGNpLCBpdCdzIG5vdCBjbGVhciB0aGlzIGlzIHdvcnRoDQo+
IGl0LiBBbmQgd2hpbGUgeW91IG1heSBoYXZlIHBhaWQgYXR0ZW50aW9uIChhbmQgdGhlcmUgc2lt
cGx5IGlzIG5vDQo+IGJldHRlciBhcnJhbmdlbWVudCkgSSdkIGFsc28gbGlrZSB0byBwb2ludCBv
dXQgdGhhdCBzdWNoIGZpZWxkDQo+IG1vdmVtZW50IHNob3VsZCBiZSBkb25lIHdoaWxlIGtlZXBp
bmcgcGFkZGluZyBob2xlIHNpemVzIGluIG1pbmQuDQoNCk9rLiANCj4gDQo+Pj4gQEAgLTE3NCw3
ICsxNzcsNyBAQCBpbnQgX19tdXN0X2NoZWNrIHZwY2lfbXNpeF9hcmNoX2Rpc2FibGVfZW50cnko
c3RydWN0IHZwY2lfbXNpeF9lbnRyeSAqZW50cnksDQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+
PiB2b2lkIHZwY2lfbXNpeF9hcmNoX2luaXRfZW50cnkoc3RydWN0IHZwY2lfbXNpeF9lbnRyeSAq
ZW50cnkpOw0KPj4+IGludCB2cGNpX21zaXhfYXJjaF9wcmludChjb25zdCBzdHJ1Y3QgdnBjaV9t
c2l4ICptc2l4KTsNCj4+PiAtDQo+Pj4gK2ludCByZW1vdmVfbXNpeF9yZWdpb25zKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSk7DQo+Pj4gLyoNCj4+PiAg
KiBIZWxwZXIgZnVuY3Rpb25zIHRvIGZldGNoIE1TSVggcmVsYXRlZCBkYXRhLiBUaGV5IGFyZSB1
c2VkIGJ5IGJvdGggdGhlDQo+Pj4gICogZW11bGF0ZWQgTVNJWCBjb2RlIGFuZCB0aGUgQkFSIGhh
bmRsZXJzLg0KPiANCj4gUGxlYXNlIGRvbid0IHJlbW92ZSBibGFuayBsaW5lcyBsaWtlIHRoaXMg
b25lLCB1bmxlc3MgeW91IGFjdHVhbGx5DQo+IHNlZSBhIHJlYXNvbi4NCj4gDQpPay4NCg0KUmVn
YXJkcywNClJhaHVsDQoNCj4gSmFuDQoNCg==

