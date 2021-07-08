Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D53BF8AC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152996.282642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1RsT-00074V-5H; Thu, 08 Jul 2021 11:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152996.282642; Thu, 08 Jul 2021 11:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1RsT-00071g-27; Thu, 08 Jul 2021 11:07:33 +0000
Received: by outflank-mailman (input) for mailman id 152996;
 Thu, 08 Jul 2021 11:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cooy=MA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m1RsR-00071Y-Jc
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:07:31 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0981ba37-08bb-4fdd-95c0-7f1bd546197a;
 Thu, 08 Jul 2021 11:07:28 +0000 (UTC)
Received: from DB6PR0601CA0007.eurprd06.prod.outlook.com (2603:10a6:4:7b::17)
 by PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Thu, 8 Jul
 2021 11:07:26 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::b0) by DB6PR0601CA0007.outlook.office365.com
 (2603:10a6:4:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Thu, 8 Jul 2021 11:07:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 11:07:26 +0000
Received: ("Tessian outbound 257aba444440:v98");
 Thu, 08 Jul 2021 11:07:26 +0000
Received: from 864199ffcfed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1F19F28-4CDE-4E8F-84B8-FDC8F26BF6DA.1; 
 Thu, 08 Jul 2021 11:07:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 864199ffcfed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Jul 2021 11:07:20 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0802MB2413.eurprd08.prod.outlook.com (2603:10a6:800:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 11:07:18 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 11:07:18 +0000
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
X-Inumbo-ID: 0981ba37-08bb-4fdd-95c0-7f1bd546197a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3RtZeATn69YkYX3X9oMAoBOMiXYHPyT1fSxmSjkEY4=;
 b=keYrMZVSwdBoVqFu3WFzF5nXJs3PmVzz8naaqANWvoCPW9wieRH9zQFVIj0ILLM8r4D38vI2aPKoh0Y0ltyyTAGijygFsF4O6yjXylGD6QLSvI+s9Pq30mlq3g5v7mgMOkfQcgTzQdPje1oN5PDrntVvVh5tO8AnaiN68+MZKxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUK+dudsTMSQIy81OhLfpZ1INaKYDvXMswi+4TPPSj/bKULovFDot/HH4FQEB5E+nw/4rFi0pxQBZWiXWoBgokuKkSjC9U4l3Iyl4ujS6/AMha72b3D3tbskCniNi9vBDme0JM8iwIo4ainXFDy2eWvM3d4Lfl91eh5tRCkjOFe0dUMqTMb2qdPkBpJ4SiCSShXpNI8bSDfeQQV9B1bll/9ZYmhYzuA8kvEzyUb7DF/U6dsItDdzySXu5riA5oiYITSIY5OkS+Ccb2O93uXlAXIrvOOu7YurB9+4oarYwcg4QISG2I9+s5J2sm89NKKyrxyhxIycyWglaH9vJY9Okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3RtZeATn69YkYX3X9oMAoBOMiXYHPyT1fSxmSjkEY4=;
 b=KlQkdYfXVsDuYlgTJpNHGJlVGRTQ4UAY/oi9cO45o3HRO6Mcv/W4Y0Y6lDEnrv2p2qn+UTCvp1dSbeMVOMc3lwh9Z8DfwM+xkjYuc7wVWmw6BhGMMPnm9CTRVzn0S4J4Esityhi1Tgg1rohf7qV5tOrZdQSFfw2jtlyP9NLvyWHCzurjOWxLHZe2kp6FwNlthcQ+HJmdxcNjFw7OXF3zGEPsITNppRkVjWNbEQD/dpxeBrvfgQSvB7MFLQkK6BZSDIa93lQ3930CL0xEYF/071ock0xkIqb4fR6SkiBya1OwM7da0fsefjOgsYN6mkPfS8N+M8g9IYXjffiUNt6j5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3RtZeATn69YkYX3X9oMAoBOMiXYHPyT1fSxmSjkEY4=;
 b=keYrMZVSwdBoVqFu3WFzF5nXJs3PmVzz8naaqANWvoCPW9wieRH9zQFVIj0ILLM8r4D38vI2aPKoh0Y0ltyyTAGijygFsF4O6yjXylGD6QLSvI+s9Pq30mlq3g5v7mgMOkfQcgTzQdPje1oN5PDrntVvVh5tO8AnaiN68+MZKxw=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
Thread-Topic: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
Thread-Index:
 AQHXW0b5Q8/Ges+XOkqFV81MfBckcqsNDrqAgChoyZCAADlHgIADP/FggAAadwCAAAIMsA==
Date: Thu, 8 Jul 2021 11:07:18 +0000
Message-ID:
 <VE1PR08MB5215EC648B15AF57D2E7051EF7199@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
 <VE1PR08MB5215139E9710EE5DE8E698B1F7199@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <886da191-602d-5dc6-8a4c-777aed90fb09@suse.com>
In-Reply-To: <886da191-602d-5dc6-8a4c-777aed90fb09@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3FB372343F2AC74180C47D5DB0EF4BEA.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ddab1da7-cfd5-4723-8671-08d9420091d2
x-ms-traffictypediagnostic: VI1PR0802MB2413:|PAXPR08MB6816:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6816B8D2419A401AA6CB2A42F7199@PAXPR08MB6816.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nE5FIYHoSNomMgONyKAD4JQNQ6n2VzbYdT5FnV+Js+DfuZviIW3P/yRzEbS0AMl8urNntrAh5BerfpFPrizuqLQIuykGSsVQ2/4ZxsR7tI2dXoTrhsWKl8RGGU00oyKRPyCwiHgRy+DA84jhntkyMLWHFr4mNwukhbYR7MN1n3y54y94fzfOh9ks+EWXSSN69dj9sJ+er6YUQdWfFcpWRzDjwQoUzjsS/vmXYnxqxa+YA32+a5Y+CKteK35J4St9DnCvlPJwDcjURQTUEu8G2OZq+HZYE/Ci7kZxq7+i8DI4cmPbu4U3gYIdbLtzb1aMDaClVEOsPuztcB9o5cZ/tcFPSODffRMeF021hf4Vfz32iqoawMMiaXPfsx7w28F71bAzz3qitR6lXSheohZ/vCeUPLO2AsqyFnY+rj4xMPtIT359stXzsdG2Ft3/kK9ge0AvOTBRqeGNXOmElU9Yf0XhLhm1qdrHb2eXBrTRtWUf7vHAxlehIPqR6Tp+UiI4PhsE8iwuYrJxW9u+FiMOYkvx6K72MWAhdUmKNA67yAC730OWhKZ5EsYXkxjvMYT20rONpAYknDpzEUcxNHOBwEfRohL55aqdLZCTmB3WQax3ngd1HY7ng+/8W95UtdNBK7w3CCcHrOfxqcwQCtq3dBn+7brAb3Iw+n5/6W/P8VCN52y3IAs2t1JIU3O1+KSdvQ38RNsJGGLHHpUikKQeyw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(26005)(122000001)(4326008)(316002)(76116006)(38100700002)(8936002)(186003)(2906002)(83380400001)(66946007)(66476007)(64756008)(33656002)(6916009)(54906003)(66556008)(9686003)(53546011)(478600001)(7696005)(55016002)(71200400001)(5660300002)(8676002)(6506007)(52536014)(86362001)(66446008)(396324004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkIvY2hKVVhVQkpQOGhVdXB2aHVJcXROY1lZOHlOcTdxMEVlSFRPSWNQckpL?=
 =?utf-8?B?aFhGSGN6Vld6MWpEeWlrL0N4TlV6ZlFlRDZDMUNuTGhjaU92SnFjeVM3NzIw?=
 =?utf-8?B?RTg5aUc2TWRITkkrNHJ0RE52ZFUvSXlaeEZUMlNTVHdEWFVGRnBoV2puN1dk?=
 =?utf-8?B?eFcrdlpHaEt3TkxIV09kdnk2eWkvMGlJOGttbktpUXpwOXp3ZUpBUVB3VEpZ?=
 =?utf-8?B?NFBrS1hkSkQ5Skc5WU9DTHFlUzY1MHl0MmZUS01Qcy85eGJIeFNQcXlZRHlh?=
 =?utf-8?B?SHVRR2xrWTN2Vjdham9yS0JDS3JnbmdxSXpHMkp0eXVhU2YyS3VuZTJzeXJT?=
 =?utf-8?B?d1hTNzRvVkZzaHZ4R1Q3MTBWTDZnd3pUOXBpd1gwbXVUdHRIWG83VE1xclNK?=
 =?utf-8?B?UHIrdjZwWGdTWEkrekFqTkI3OVdkQURUVTQ5MGRnUExWTHQyNHI2QXE0UU9S?=
 =?utf-8?B?eDNxYmVtdFQ3SndVTjJEMllJM2hFYUhBeU1hSXd3SXppLzFXOVptUDRMQ3Rh?=
 =?utf-8?B?bHZlZHFyVFN2SlpmMVNJVGpWVy8vaTBKOWRpODBxLzdpMnk3Y0JKalN6NjUz?=
 =?utf-8?B?RkhXK2kvd3p1OUkrZjgyUFYzcWpteVJYNm9rTVlUdkd4NnVSQU5qYUFTS2Nz?=
 =?utf-8?B?Tm5hdW9Na3ZGOFpNOWhLYUUxL0tvRUNEN0dEczBOU0hmOFVEdFNzUTJGakJQ?=
 =?utf-8?B?V3R5c2E2QmVhYUNxWlR4QnpoSk9jckZwVVFJYUpvOXlyZmIrcDhQeGZoNlY5?=
 =?utf-8?B?aUZpMExtNmhrbmYxd2tTaVpLL0lSeCszV2ZiNjlCN1I0RFhaZXF3ZVFsRFNC?=
 =?utf-8?B?aWZWZTFCNEtEYWhCM3JrZDJpaTl0RVJ4MzJEamtGT3J4UzhYK3Z4OGwzWFBl?=
 =?utf-8?B?YVJoWDRXY2FSeVV0a2E2cVlnTmNKeHFDL0lTMjkzOUFQQlNodFFpc0prYllI?=
 =?utf-8?B?d3NtRWNVaHdhTmhKNlg0MmZiT2E0aDc4UmFyNXl5eTJiajgvVHNBK3dVRlNa?=
 =?utf-8?B?QkltcVBXZ1FhMDQ3MWFVOWpGQkYrUHBlRWRRQnh3Qk50THd0akU1T2dQTG5R?=
 =?utf-8?B?TDlNeHJ4OGFDekJKZEQvN2JFekRNODRqYU4zdmVDaXV1L00rNHkyditDbEZa?=
 =?utf-8?B?K09QZ3dEUDFvNm1zSFZhd2oxTTBsVzkzVG92VmxXODVWd1lneW0zcEI0cGY3?=
 =?utf-8?B?U3FNSnl2Sk9oSCtTajJ5cVZDSE5UV1MwcWxWbzZlQmlyZy9TR2l0OUJZT1NR?=
 =?utf-8?B?d1lEd2d4OXlzVHhmV3krMFptR1E1MVdhRitvY1BaZTF1UTJHT1V0a25qWWp2?=
 =?utf-8?B?bWxmSlNqMDZNOUhtRkZ2RVo0Vi94alRRR2gyQWNqN1NJb0lvUVlwMkU2NmhH?=
 =?utf-8?B?TWJRWWxUQ1J5VmF4UTNSNWNQSzZFTit3cW04Nm9UV1dreURHL1pNMGpOVjIy?=
 =?utf-8?B?QU5JL0IvRVRKVk1LQjdvVmN1VjZ5aXdjb1RyWXRrZ3VoRW9scTZJeUlNN2c1?=
 =?utf-8?B?ZXBSYUVjR00zd1FiRHRsV0hKN1pMb2V1QlFiTm1ONW1vZXNNd3JoVEMvU1Ra?=
 =?utf-8?B?aEY5dFIyVm5ocmJtMWY2VjRxYkJCalkrL3V1ZElHSXI1czlvaE5WYzBXNlFG?=
 =?utf-8?B?ZDAyYmtVQ3l0ZUxIVEM1MEpxWlJBWHVMQUhkbHd4SHI4QjVBdXFOUHFjUWht?=
 =?utf-8?B?ZUZseXVRZGxJRzl3VXI3ZWlWcU1nYno1aDNEWHdwdi9rL00yWHEyMkhEMnVs?=
 =?utf-8?Q?FbiaCeVJmMk8yx4EQlsbkmudCVUIbS3knnGTTrR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2413
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01569a71-a11c-4ad4-aff6-08d942008d21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YSjlI9/hwH0+MRzHxh3gkeT6+wvxiHH3dwlYZhCIAeAhK4SKcM0ryzQobKOkRDNPdGHjipO7ZgElEafJJM2zF0epmnU0//RvAlxIAttarW6Gq4mXHj5pbmHO+kQVHndN2ElnSAtdvG8GlD4VK5fcQ2PpiHEI6OROMbGWBlc3Nmts7QbWQM97hov4zsao6YTQZNFDJCba0plIclYo++WckVCEp//zPCcR9FoFJFcrLXoM5x8u6AsYwQOzcNqN6VKMT817Fgd2LLeCqIQGwkNlBqGqhuc/oM+ygQdQHjvM9F5ueCUkPg091uj0jASeFosfsvOt904fZ+OqrjplZQYvsgD8C/PZpLxpqqO4r8uewGwy/kHtsnie78BYp5wCMjbGTKasZepE37S6XfzNIqzElGe01Eu90gleo01tHgVELytLHpHaFbcbPlzXpqbLpOpHkSQpgxwDOVKWHf5MqqrA4fvP4Cq+289DhU8LK32iyvktaQaDWPmM9KkRQGtUheMN7TPjsMWmQiam6pRvV1B1xDZm0msIqjoPi4CMbTTaaSv9XEYxF9Rmkoo/X+pFL+IdjIP1stKdM+eOi9VDDJ7k1BpRO2tOCYagzkk0T8KmHNWklLPQwUYtR7x+FyFvJFM6RxDriLDIoKCaHBPOFBKrDuKDUYDwBJD7qCI/B+n/3EzFvit9oUXAecairwNHcQhEEHnP3ANrdl/7SmgphdNlrWMr2IWnYoGEhk0ubVxSEac=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(36840700001)(46966006)(82310400003)(9686003)(53546011)(8676002)(6506007)(336012)(70586007)(316002)(26005)(70206006)(5660300002)(54906003)(55016002)(7696005)(82740400003)(52536014)(47076005)(186003)(6862004)(83380400001)(478600001)(81166007)(2906002)(4326008)(33656002)(356005)(8936002)(86362001)(36860700001)(396324004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:07:26.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddab1da7-cfd5-4723-8671-08d9420091d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6816

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSA4LCAyMDIxIDY6
MDYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgSnVsaWVuIEdyYWxs
DQo+IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDYvOV0geGVuL2FybTogaW50cm9kdWNlIGFsbG9jX3N0YXRpY21lbV9w
YWdlcyBhbmQNCj4gYWxsb2NfZG9tc3RhdGljX3BhZ2VzDQo+IA0KPiBPbiAwOC4wNy4yMDIxIDEx
OjA5LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBIaSBKYW4NCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgNiwgMjAyMSAyOjU0IFBNDQo+ID4+IFRvOiBQ
ZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4+IDxXZWkuQ2hlbkBh
cm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+PiBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTdWJqZWN0
OiBSZTogW1BBVENIIDYvOV0geGVuL2FybTogaW50cm9kdWNlIGFsbG9jX3N0YXRpY21lbV9wYWdl
cyBhbmQNCj4gPj4gYWxsb2NfZG9tc3RhdGljX3BhZ2VzDQo+ID4+DQo+ID4+IE9uIDA2LjA3LjIw
MjEgMDc6NTgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiBUaHVyc2RheSwgSnVuZSAxMCwgMjAyMSA2
OjIzIFBNDQo+ID4+Pj4NCj4gPj4+PiBPbiAwNy4wNi4yMDIxIDA0OjQzLCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4gPj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPj4+Pj4gKysr
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPj4+Pj4gQEAgLTEwNjUsNiArMTA2NSw3NSBA
QCBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfaGVhcF9wYWdlcygNCj4gPj4+Pj4gICAg
ICByZXR1cm4gcGc7DQo+ID4+Pj4+ICB9DQo+ID4+Pj4+DQo+ID4+Pj4+ICsjaWZkZWYgQ09ORklH
X1NUQVRJQ19BTExPQ0FUSU9ODQo+ID4+Pj4+ICsvKg0KPiA+Pj4+PiArICogQWxsb2NhdGUgbnJf
bWZucyBjb250aWd1b3VzIHBhZ2VzLCBzdGFydGluZyBhdCAjc21mbiwgb2Ygc3RhdGljDQo+IG1l
bW9yeS4NCj4gPj4+Pj4gKyAqIEl0IGlzIHRoZSBlcXVpdmFsZW50IG9mIGFsbG9jX2hlYXBfcGFn
ZXMgZm9yIHN0YXRpYyBtZW1vcnkgICovDQo+ID4+Pj4+ICtzdGF0aWMgc3RydWN0IHBhZ2VfaW5m
byAqYWxsb2Nfc3RhdGljbWVtX3BhZ2VzKHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4gPj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3Qgc21m
biwNCj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50DQo+ID4+Pj4+ICttZW1mbGFncykgew0KPiA+Pj4+PiArICAgIGJvb2wg
bmVlZF90bGJmbHVzaCA9IGZhbHNlOw0KPiA+Pj4+PiArICAgIHVpbnQzMl90IHRsYmZsdXNoX3Rp
bWVzdGFtcCA9IDA7DQo+ID4+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBpOw0KPiA+Pj4+PiArICAg
IHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgLyogRm9yIG5v
dywgaXQgb25seSBzdXBwb3J0cyBhbGxvY2F0aW5nIGF0IHNwZWNpZmllZCBhZGRyZXNzLiAqLw0K
PiA+Pj4+PiArICAgIGlmICggIW1mbl92YWxpZChzbWZuKSB8fCAhbnJfbWZucyApDQo+ID4+Pj4+
ICsgICAgew0KPiA+Pj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+Pj4+PiArICAg
ICAgICAgICAgICAgIkludmFsaWQgJWx1IHN0YXRpYyBtZW1vcnkgc3RhcnRpbmcgYXQNCj4gPj4+
Pj4gKyAlIlBSSV9tZm4iXG4iLA0KPiA+Pj4+DQo+ID4+Pj4gUmVhZGluZyBhIGxvZyBjb250YWlu
aW5nIGUuZy4gIkludmFsaWQgMCBzdGF0aWMgbWVtb3J5IHN0YXJ0aW5nIGF0DQo+ID4+Pj4gLi4u
IiBJIGRvbid0IHRoaW5rIEkgd291bGQgcmVjb2duaXplIHRoYXQgdGhlICIwIiBpcyB0aGUgY291
bnQgb2YgcGFnZXMuDQo+ID4+Pg0KPiA+Pj4gU3VyZS4gSG93IGFib3V0ICJ0cnkgdG8gYWxsb2Nh
dGUgb3V0IG9mIHJhbmdlIHBhZ2UgJSJQUklfbWZuIlxuIj8NCj4gPj4NCj4gPj4gVGhpcyBzdGls
bCBkb2Vzbid0IGNvbnZleSBfYm90aF8gcGFydHMgb2YgdGhlIGlmKCkgdGhhdCB3b3VsZCBjYXVz
ZQ0KPiA+PiB0aGUgbG9nIG1lc3NhZ2UgdG8gYmUgaXNzdWVkLg0KPiA+Pg0KPiA+DQo+ID4gU29y
cnkuIEhvdyBhYm91dA0KPiA+ICINCj4gPiAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+ID4g
ICAgICAgICAgICAgICAgIkVpdGhlciBvdXQtb2YtcmFuZ2Ugc3RhdGljIG1lbW9yeSBzdGFydGlu
ZyBhdCAlIlBSSV9tZm4iIg0KPiA+ICAgICAgICAgICAgICAgICJvciBpbnZhbGlkIG51bWJlciBv
ZiBwYWdlczogJXVsLlxuIiwNCj4gPiAgICAgICAgICAgICAgICBtZm5feChzbWZuKSwgbnJfbWZu
cyk7DQo+ID4gIg0KPiANCj4gSSdtIHNvcnJ5IC0gd2hpbGUgbm93IHlvdSBjb252ZXkgYm90aCBh
c3BlY3RzLCB0aGUgbWVzc2FnZSBoYXMgYmVjb21lIHRvbw0KPiB2ZXJib3NlLiBXaGF0J3Mgd3Jv
bmcgd2l0aCAiSW52YWxpZCBzdGF0aWMgbWVtb3J5IHJlcXVlc3Q6IC4uLiBwYWdlcyBhdCAuLi5c
Ij8NCj4gQnV0IEkgd29uZGVyIGFueXdheSBpZiBhIGxvZyBtZXNzYWdlIGlzIGFwcHJvcHJpYXRl
IGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCg0KU29ycnkgZm9yIG15IHBvb3IgRW5nbGlz
aCB3cml0aW5nLiA6Lw0KSnVzdCBoYXZpbmcgYSBoYWJpdChtYXliZSBub3QgYSBnb29kIGhhYml0
KSBvZiBwcmludGluZyBlcnJvciBtZXNzYWdlcywgaWYgeW91IHRoaW5rIHRoZQ0KbG9nIGl0c2Vs
ZiBpcyB2ZXJib3NlIGhlcmUsIEknbGwgcmVtb3ZlIGl0LiA7KQ0KDQo+ID4+Pj4+IEBAIC0yNDM0
LDYgKzI1MTIsNTcgQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygNCj4g
Pj4+Pj4gICAgICByZXR1cm4gcGc7DQo+ID4+Pj4+ICB9DQo+ID4+Pj4+DQo+ID4+Pj4+ICsjaWZk
ZWYgQ09ORklHX1NUQVRJQ19BTExPQ0FUSU9ODQo+ID4+Pj4+ICsvKg0KPiA+Pj4+PiArICogQWxs
b2NhdGUgbnJfbWZucyBjb250aWd1b3VzIHBhZ2VzLCBzdGFydGluZyBhdCAjc21mbiwgb2YNCj4g
Pj4+Pj4gK3N0YXRpYyBtZW1vcnksDQo+ID4+Pj4+ICsgKiB0aGVuIGFzc2lnbiB0aGVtIHRvIG9u
ZSBzcGVjaWZpYyBkb21haW4gI2QuDQo+ID4+Pj4+ICsgKiBJdCBpcyB0aGUgZXF1aXZhbGVudCBv
ZiBhbGxvY19kb21oZWFwX3BhZ2VzIGZvciBzdGF0aWMgbWVtb3J5Lg0KPiA+Pj4+PiArICovDQo+
ID4+Pj4+ICtzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21zdGF0aWNfcGFnZXMoDQo+ID4+Pj4+
ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgbnJfbWZucywgbWZuX3Qg
c21mbiwNCj4gPj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0KPiA+Pj4+PiAr
ew0KPiA+Pj4+PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gTlVMTDsNCj4gPj4+Pj4gKyAg
ICB1bnNpZ25lZCBsb25nIGRtYV9zaXplOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgQVNTRVJU
KCFpbl9pcnEoKSk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICBpZiAoICFkbWFfYml0c2l6ZSAp
DQo+ID4+Pj4+ICsgICAgICAgIG1lbWZsYWdzICY9IH5NRU1GX25vX2RtYTsNCj4gPj4+Pj4gKyAg
ICBlbHNlDQo+ID4+Pj4+ICsgICAgew0KPiA+Pj4+PiArICAgICAgICBpZiAoIChkbWFfYml0c2l6
ZSAtIFBBR0VfU0hJRlQpID4gMCApDQo+ID4+Pj4+ICsgICAgICAgIHsNCj4gPj4+Pj4gKyAgICAg
ICAgICAgIGRtYV9zaXplID0gMXVsIDw8IChkbWFfYml0c2l6ZSAtIFBBR0VfU0hJRlQpOw0KPiA+
Pj4+PiArICAgICAgICAgICAgLyogU3RhcnRpbmcgYWRkcmVzcyBzaGFsbCBtZWV0IHRoZSBETUEg
bGltaXRhdGlvbi4gKi8NCj4gPj4+Pj4gKyAgICAgICAgICAgIGlmICggbWZuX3goc21mbikgPCBk
bWFfc2l6ZSApDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4+Pj4N
Cj4gPj4+PiBJIHRoaW5rIEkgZGlkIGFzayB0aGlzIG9uIHYxIGFscmVhZHk6IFdoeSB0aGUgZmly
c3QgcGFnZT8gU3RhdGljDQo+ID4+Pj4gbWVtb3J5IHJlZ2lvbnMsIHVubGlrZSBidWRkeSBhbGxv
Y2F0b3Igem9uZXMsIGNhbiBjcm9zcyBwb3dlci1vZi0yDQo+ID4+Pj4gYWRkcmVzcyBib3VuZGFy
aWVzLiBIZW5jZSBpdCBvdWdodCB0byBiZSB0aGUgbGFzdCBwYWdlIHRoYXQgZ2V0cw0KPiA+Pj4+
IGNoZWNrZWQgZm9yIGZpdHRpbmcgYWRkcmVzcyB3aWR0aCByZXN0cmljdGlvbiByZXF1aXJlbWVu
dHMuDQo+ID4+Pj4NCj4gPj4+PiBBbmQgdGhlbiAtIGlzIHRoaXMgbmVjZXNzYXJ5IGF0IGFsbD8g
U2hvdWxkbid0ICJwcmUtZGVmaW5lZCBieQ0KPiA+Pj4+IGNvbmZpZ3VyYXRpb24gdXNpbmcgcGh5
c2ljYWwgYWRkcmVzcyByYW5nZXMiIGltcGx5IHRoZSBtZW1vcnkNCj4gPj4+PiBkZXNpZ25hdGVk
IGZvciBhIGd1ZXN0IGZpdHMgaXRzIERNQSBuZWVkcz8NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEht
bW0sIEluIG15IHVuZGVyc3RhbmRpbmcsIGhlcmUgaXMgdGhlIERNQSByZXN0cmljdGlvbiB3aGVu
IHVzaW5nDQo+ID4+PiBidWRkeQ0KPiA+PiBhbGxvY2F0b3I6DQo+ID4+PiAgICAgZWxzZSBpZiAo
IChkbWFfem9uZSA9IGJpdHNfdG9fem9uZShkbWFfYml0c2l6ZSkpIDwgem9uZV9oaSApDQo+ID4+
PiAgICAgICAgIHBnID0gYWxsb2NfaGVhcF9wYWdlcyhkbWFfem9uZSArIDEsIHpvbmVfaGksIG9y
ZGVyLA0KPiA+Pj4gbWVtZmxhZ3MsIGQpOyBkbWFfem9uZSBpcyByZXN0cmljdGluZyB0aGUgc3Rh
cnRpbmcgYnVkZHkgYWxsb2NhdG9yDQo+ID4+PiB6b25lLCBzbyBJIGFtIHRoaW5raW5nIHRoYXQg
aGVyZSwgaXQgc2hhbGwgcmVzdHJpY3QgdGhlIGZpcnN0IHBhZ2UuDQo+ID4+Pg0KPiA+Pj4gaW1v
LCBpZiBsZXQgdXNlciBkZWZpbmUsIGl0IGFsc28gY291bGQgYmUgbWlzc2luZyBETUEgcmVzdHJp
Y3Rpb24/DQo+ID4+DQo+ID4+IERpZCB5b3UgcmVhZCBteSBlYXJsaWVyIHJlcGx5PyBBZ2Fpbjog
VGhlIGRpZmZlcmVuY2UgaXMgdGhhdCBvcmRpbmFyeQ0KPiA+PiBhbGxvY2F0aW9ucyAoYnVkZGll
cykgY2FuJ3QgY3Jvc3Mgem9uZSBib3VuZGFyaWVzLiBIZW5jZSBpdCBpcw0KPiA+PiBpcnJlbGV2
YW50IGlmIHlvdSBjaGVjayBETUEgcHJvcGVydGllcyBvbiB0aGUgZmlyc3Qgb3IgbGFzdCBwYWdl
IC0NCj4gPj4gYm90aCB3aWxsIGhhdmUgdGhlIHNhbWUgbnVtYmVyIG9mIHNpZ25pZmljYW50IGJp
dHMuIFRoZSBzYW1lIGlzIC0NCj4gPj4gYWZhaWN0IC0gbm90IHRydWUgZm9yIHN0YXRpYyBhbGxv
Y2F0aW9uIHJhbmdlcy4NCj4gPj4NCj4gPg0KPiA+IFRydWUuDQo+ID4NCj4gPiBPcmRpbmFyeSBh
bGxvY2F0aW9ucyAoYnVkZGllcykgY2FuJ3QgY3Jvc3Mgem9uZSBib3VuZGFyaWVzLCBTbyBJDQo+
ID4gdW5kZXJzdGFuZCB0aGF0IGZvbGxvd2luZyB0aGUgbG9naWMgaW4gImFsbG9jX2hlYXBfcGFn
ZXMoZG1hX3pvbmUgKyAxLA0KPiB6b25lX2hpLCBvcmRlciwgbWVtZmxhZ3MsIGQpOyINCj4gPiBw
YWdlcyBvZiB0aGUgc21hbGxlc3QgYWRkcmVzcyBzaGFsbCBiZSBhbGxvY2F0ZWQgZnJvbSAiZG1h
X3pvbmUgKyAxIiwNCj4gPiBsaWtlIHlvdSBzYWlkLCBpdCBpcyBpcnJlbGV2YW50IGlmIHlvdSBj
aGVjayBETUEgcHJvcGVydGllcyBvbiB0aGUNCj4gPiBmaXJzdCBvciBsYXN0IHBhZ2VzLCBidXQg
aW1vLCBubyBtYXR0ZXIgZmlyc3Qgb3IgbGFzdCBwYWdlLCBib3RoIHNoYWxsIGJlIGxhcmdlcg0K
PiB0aGFuICgyXihkbWFfem9uZSArIDEpKS4NCj4gPg0KPiA+IFRha2luZyAzMiBhcyBkbWFfYml0
c2l6ZSwgdGhlbiB0aGUgbWVtb3J5IHdpdGggdGhpcyBETUEgcmVzdHJpY3Rpb24NCj4gPiBhbGxv
Y2F0ZWQgYnkgImFsbG9jX2hlYXBfcGFnZXMoZG1hX3pvbmUgKyAxLCB6b25lX2hpLCBvcmRlciwg
bWVtZmxhZ3MsDQo+ID4gZCk7IiBzaGFsbCBiZSBhdCBsZWFzdCBtb3JlIHRoYW4gNEcuDQo+IA0K
PiBETUEgcmVzdHJpY3Rpb25zIGFyZSBhbHdheXMgIm5lZWRzIHRvIGJlIG5vIG1vcmUgdGhhbiBO
IGJpdHMiLg0KPiANCj4gPiBUaGF04oCZcyB3aHkgSSBrZWVwIGNvbXBhcmluZyB0aGUgZmlyc3Qg
cGFnZSBvZiBzdGF0aWMgYWxsb2NhdGlvbiwgdGhhdA0KPiA+IEkgYW0gZm9sbG93aW5nIHRoZSAi
bW9yZSB0aGFuIiBsb2dpYyBoZXJlLg0KPiA+DQo+ID4gQnV0IHlvdSdyZSByaWdodCwgSSBnb3Qg
YSBsaXR0bGUgaW52ZXN0aWdhdGlvbiBvbiBBUk0gRE1BIGxpbWl0YXRpb24sDQo+ID4gc3RpbGwg
dGFraW5nIGRtYV9iaXRzaXplPTMyIGFzIGFuIGV4YW1wbGUsIHdlIHdhbnQgdGhhdCB0aGUgYWN0
dWFsbHkNCj4gYWxsb2NhdGVkIG1lbW9yeSBpcyBzbWFsbGVyIHRoYW4gNEcsIG5vdCBtb3JlIHRo
YW4uDQo+ID4gU28gSSB0aGluayB0aGUgbG9naWMgYmVoaW5kIHRoaXMgY29kZSBsaW5lICIgYWxs
b2NfaGVhcF9wYWdlcyhkbWFfem9uZQ0KPiA+ICsgMSwgem9uZV9oaSwgb3JkZXIsIG1lbWZsYWdz
LCBkKTsiIGlzIG5vdCByaWdodCBmb3IgQVJNLCBhbmQgaXQgc2hhbGwNCj4gPiBiZSBjaGFuZ2Vk
IHRvICJhbGxvY19oZWFwX3BhZ2VzKHpvbmVfbG8sIGRtYV96b25lICsgMSwgb3JkZXIsIG1lbWZs
YWdzLA0KPiBkKTsiIGFzIGNvcnJlY3Rpb24uDQo+IA0KPiBCdXQgdGhpcyBzdGVwIGlzIHRvIF9h
dm9pZF8gdGhlIERNQS1yZXNlcnZlZCBwYXJ0IG9mIHRoZSBoZWFwLg0KDQpUaGFua3MgZm9yIHRo
ZSBleHBsYW5hdGlvbiEhIQ0KDQpJIHRvdGFsbHkgbWlzLXVuZGVyc3Rvb2QgdGhlIHVzYWdlIG9m
IGRtYV9iaXRzaXplLiBJdCB0dXJucyBvdXQgdG8gYmUgdGhlIERNQS1yZXNlcnZlZC4uLg0KUHV0
dGluZyBETUEgbGltaXRhdGlvbiBvbiB6b25lX2xvIGlzIGFic29sdXRlbHkgcmlnaHQgb24gQVJN
IGFsc28uDQoNCj4gVGhlIGNhbGxlciByZXF1ZXN0cyBhZGRyZXNzIHJlc3RyaWN0ZWQgbWVtb3J5
IGJ5IHBhc3Npbmcgc3VpdGFibGUgbWVtZmxhZ3MuIElmDQo+IHRoZSByZXF1ZXN0IGRvZXNuJ3Qg
cmVxdWlyZSBhY2Nlc3MgdG8gdGhlIERNQS0gcmVzZXJ2ZWQgcGFydCBvZiB0aGUgaGVhcA0KPiAo
ZG1hX3pvbmUgPCB6b25lX2hpKSB3ZSBmaXJzdCB0cnkgdG8gZ2V0IG1lbW9yeSBmcm9tIHRoZXJl
LiBPbmx5IGlmIHRoYXQgZmFpbHMNCj4gd2lsbCB3ZSBmYWxsIGJhY2sgYW5kIHRyeSB0YWtpbmcg
bWVtb3J5IGZyb20gdGhlIGxvd2VyIHJlZ2lvbi4gSU9XIHRoZQ0KPiBwcm9ibGVtIHdpdGggeW91
ciBjb2RlIGlzIG1vcmUgZnVuZGFtZW50YWw6IFlvdSB1c2UgZG1hX2JpdHNpemUgd2hlbg0KPiBy
ZWFsbHkgeW91IG91Z2h0IHRvIGV4dHJhY3QgdGhlIGNhbGxlcidzIHJlcXVlc3RlZCByZXN0cmlj
dGlvbiAoaWYgYW55KSBmcm9tDQo+IG1lbWZsYWdzLiBJIHdvdWxkIGFzc3VtZSB0aGF0IGRtYV9i
aXRzaXplIGlzIG9ydGhvZ29uYWwgdG8gc3RhdGljIG1lbW9yeSwgaS5lLg0KPiB5b3UgZG9uJ3Qg
bmVlZCB0byB0cnkgdG8gcHJlc2VydmUgbG93IG1lbW9yeS4NCj4gDQoNClRydWUsIE5vIG5lZWQg
dG8gcHJlc2VydmUgbG93IG1lbW9yeSBmb3Igc3RhdGljIG1lbW9yeS4NCg0KPiBKYW4NCg0KUGVu
bnkgWmhlbmcNCg0K

