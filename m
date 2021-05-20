Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFC389D84
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 08:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130602.244535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljbqK-0007Du-Bt; Thu, 20 May 2021 06:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130602.244535; Thu, 20 May 2021 06:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljbqK-0007Av-8T; Thu, 20 May 2021 06:07:36 +0000
Received: by outflank-mailman (input) for mailman id 130602;
 Thu, 20 May 2021 06:07:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP7T=KP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljbqI-0007Ap-B2
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 06:07:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f36e2610-a230-406c-83aa-f6f75384fabb;
 Thu, 20 May 2021 06:07:32 +0000 (UTC)
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 06:07:30 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::cf) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 06:07:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 06:07:30 +0000
Received: ("Tessian outbound 0f1e4509c199:v92");
 Thu, 20 May 2021 06:07:30 +0000
Received: from f3ce78f5e04a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08DA521A-05BB-4DAD-8285-0D7C11034E38.1; 
 Thu, 20 May 2021 06:07:24 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3ce78f5e04a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 May 2021 06:07:24 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3406.eurprd08.prod.outlook.com (2603:10a6:803:7b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 06:07:22 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Thu, 20 May 2021
 06:07:21 +0000
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
X-Inumbo-ID: f36e2610-a230-406c-83aa-f6f75384fabb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA7asYMuc4GZMY+Dz+51Dz848iAHkI0/iINYpx9QvLw=;
 b=TcrbCXQLIgCDSirMG7o1m8aZMQDgFSopkRRXu4C0Rkf6yCLVr9zW0goI5hvIGl1GSnfCkGU2BN4vTg54fLGCvamAPSZkJXrYp5b3EYme18uiHyoDcvHvPaVFE7ASlKxN8141kzhyYms0FwLhqrc9+6AOptwFc/46oBlvYk9LlBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIIvsvNkA9hNx/V3YB+4q3/MRoay7dOUbBYXt0fz0xESo51C+x2eCecKiYjAExxJXFRzjuFoVaT8JHZkp4h7D6Y8gaGa2E81QZqXsxtQH88QbI0rH0UmNbEfzIlJBXhXzLurRDi0mD4OLB8cjFiuYXOhQ/mou9fPIDk+iEfVjxgnSm/eK8q5RtUh5pp4LOHVNBqcVgZPd/DRQlzQnQ7w3w6vPlL5imKv7j6amBVDCyZG97ChWRME74BNphdS32KEgrpwr9itxAOKd/Zmr2MICTvZI52AzWoW9HB+LOF5Q3TPmKBK/l39B7EPnvjGbNd0Z39fkPwWEPTiPz9xjS6F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA7asYMuc4GZMY+Dz+51Dz848iAHkI0/iINYpx9QvLw=;
 b=n3zMy18FgN5HOMDsNoxEeqCYllfBkx32Dm8gNBnjX2QUoXn+eS5Z1/6wjYSLMrveD7N+kKFoz4LPY9+4SkQf+i1MBfwbqd4rqsM98OUt3EH2Y1BCmblFhtgKPoxcQ3ggt5RBjXrPir5Gfs8oJD8eZr4hKo/QbRn/lb/uLP77U93bttmVav0Ajlq5Zm1xkhNVY2gU+uaRnz7wKLdVM6NWtPYucJGYGUF5EXAMDbhgwl7JJ0pmzc6/SVnElnYB1TZ9YILiPCdQuqz4q8Bv41b/TnyZh9m3ygqBI3g1x3yMwi42yTpr5fkoyy18QaVqOj1s4sSKrMgVzoUON7y5cGAH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA7asYMuc4GZMY+Dz+51Dz848iAHkI0/iINYpx9QvLw=;
 b=TcrbCXQLIgCDSirMG7o1m8aZMQDgFSopkRRXu4C0Rkf6yCLVr9zW0goI5hvIGl1GSnfCkGU2BN4vTg54fLGCvamAPSZkJXrYp5b3EYme18uiHyoDcvHvPaVFE7ASlKxN8141kzhyYms0FwLhqrc9+6AOptwFc/46oBlvYk9LlBY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index: AQHXS6WvvFnJG9tHGECWPMZXor2qraro8JyAgAAPtYCAAiGdAIAAuwwg
Date: Thu, 20 May 2021 06:07:21 +0000
Message-ID:
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
In-Reply-To: <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1BD33F983AFB0140BC13A9260EC6A868.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b956f725-6ecd-4677-82a8-08d91b558d1f
x-ms-traffictypediagnostic: VI1PR08MB3406:|DB9PR08MB6684:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6684B1189E16C236D27E6897F72A9@DB9PR08MB6684.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oUGshDfv/EMVgHou8oHcD6sGKqFvc1IBH3q1Lnkt6/hE3AhIS8jXeBUAwwYsZr3yJQHwA+1HAn2rZFTv8CuE3xuYmMUCD+WBoW+8Xy8KvDZWZ5yEiyFZ9v4YWW2q3KsweJnmtltAN/6onSQ3R8tUR6ibn5bzSPMkRBChOAW0cdbpamCf35cWHpdlk6vE8oaHXRgCMpixQMhFzHHHcSLnV+C5ZsjBxoyRlUBbHMslSRZXJQ0GjRwcm5RESOveNJgQCXSGnHEN8ZDw3JrtiY7dEgszpPWgd6G5zzopXK+B4QbMtGTMzZvlyfdlI/X1Yv98+AaAZ1a3+yrTfTn/P8wEHj7E4JXwohqfn2Vt4BQCIuMxG1+ymYKX/SXdiEDR8JGBCAX7tz6nWz3hSz588xHM49/UaQVurBL2Hk3wVkcR7RdQsnEPj7XKz9fut2jGye6U28pSAGkfCJWbBaESVlnVh/PYOiv06NELf5YsQvW03OA52ZziTtuaU925OVe+MFu++chEOi4ETzjTzY9ZSHUI+dKwMWG/Whb2dqjorjnWyqiQ1sEfcwEjiHELshhEYfKiaFQhdGnJ/VZCZBkCZC0PK7QjH3WB7esBxNqLjNKMurxKw5Km4ngMWRonkNnTwPioDwDU7CUvyGGgML5L2R718VTnaEdYGyEV2p+vRSd+CKw/Tr0rWuMHjxr8KyQJ9Sm0+m69+XI83AVa2WPXmLa7RSIR+p61zpaOhYhZ1dXuVCw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(6506007)(86362001)(7696005)(52536014)(316002)(71200400001)(110136005)(2906002)(8676002)(26005)(4326008)(966005)(54906003)(53546011)(66476007)(66946007)(8936002)(5660300002)(55016002)(33656002)(66446008)(64756008)(66556008)(83380400001)(9686003)(76116006)(186003)(478600001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?RGJ6M3pxSS8xNVM0ZlJnUDBxUFM4RytmMHZRenBrUnIzV3FyR1RDNTJSQnVZ?=
 =?utf-8?B?ZW5ZMEJ5dkF1S2EzdGw4aGltM2pWdlo1UmJHV0JZRzdWVnNUbnlENWhhVFNM?=
 =?utf-8?B?N2tEWEl0ajZRTUxXREEzek1xYVJkN1JsSEFyenFZRWFHSU5XOXJHZDFvWGNF?=
 =?utf-8?B?N1kzMDR5UDQxdE1UaElIcDl2Y0lXYUpFREhTY3ByTFZaejVHYklIRkJrZnNL?=
 =?utf-8?B?c3ZrMzR6SC92ZmJ1VE5FS1dWRUlCK0VDWEo1U2pZK2dueUJGTFlUVE5uRXpB?=
 =?utf-8?B?RnRySnJtd1JqaFdiUnRWclhsVFpHcjA5UGFkdlUyNkx1R2k1bTM4REcyTDZ0?=
 =?utf-8?B?Z0cxQjRCWE9CdlAxMWR3VGhqTThBcnZJb0cyR1g5NFM3T1c0eUwzWkdoKzBS?=
 =?utf-8?B?ejllenRUdU1HRGpnbU9MMUFDTk9DRkVhd09OME9ibHkzZVd4ZlloRCtSQkt2?=
 =?utf-8?B?MVpXa2M2bkhXMkZrMi9yZFNmaGNjWjhxT1NETGg2dGZDRThuRFlUTlB6akxV?=
 =?utf-8?B?dWJpQmVUNWo4TE5zZmJxZUk0Q2cxekM2dnJEZkJDTi94WlgwRkV0OHl6aGNY?=
 =?utf-8?B?K3YrbmluMDRrdjVPZE1Md2hCWmtpcFRGWU1XVExodW94YnJFOE1tMjF0WkQv?=
 =?utf-8?B?Q2JOSEVVVEdLTFVRUFlvVzVwNjdOKzN6cGVlUTlHTW9vUGNaZEJMWW1tVm5L?=
 =?utf-8?B?ZVlHci9DZ1oxSEVOTjR5WUVqQTJXVUZKQkNrUDU1L2tQaExkcHpCczlmZGpT?=
 =?utf-8?B?ek5NWHVMbDRDaVBtUDRZQngwZ2RVWFJlZHZyU2pZK1ZlcEllV0pGaFMvUUJ2?=
 =?utf-8?B?Vk1MdG1qS0NOeitnQmtGMmxZQzU2Y1cwcSt2b3MycHFLVWErQWMrK1BYSU1E?=
 =?utf-8?B?ZkpMSmp3NXpMbUJ5MWtPZVR3aWwxNFdKMzE2MUZDL2tSU0pldDZwSWJ6WFZN?=
 =?utf-8?B?WjA1bUNRNHh1WDRjMXdZbThjQTA4c1lSSGRqcGRZcFlKUnE4R3BVcnlpenFv?=
 =?utf-8?B?NlBOZEZheTloZzI3a3Fxa0NtekNIendwdjVabGdza1hzTHI2RUp2VUo0TytF?=
 =?utf-8?B?NzdYZGpRSC90N3Rpc1JJZURTNGxEUlVxbnpHRUsva2JXNWJOY1FJUU9GZDNw?=
 =?utf-8?B?ZjIrUWt3a1VBNWhhWkdFVFpSSXdUUlNQYkpSOGRKZ3pOVHowbzBEdjgrbWxj?=
 =?utf-8?B?WU9mbVZ6eTNFYzJ3K2NtK3E4dzBEOWlzNXZIak9CZG84cHVyVCtRSDdZYWlI?=
 =?utf-8?B?SUU3K3FZUW4rdmh4aCt0KzNMVU5EbHIzdUZhYlpMNm9WeGIxMmFwckxwL2dM?=
 =?utf-8?B?MW1MTFA5ZFlQdjltSHpmZUh5L0NTaU50cnhBaThoc01kUWFKSXpUMENMMFFj?=
 =?utf-8?B?MWRSVHZkTmkrc1ZUdU1vNzd6TWJRdnIrOU1SYUNsZTdSRXp1elFBUnFDZERB?=
 =?utf-8?B?a2tKMjZDNEZGVUljblNmRlNyTkpJc3g5MXcyM3U4MWZCVjhWeEVha2tKS1h5?=
 =?utf-8?B?TDZQRGk0Z0dLUGJvZU5kZ3JzR1hUUWZlaGtzUmlSdlU4NEJzMWJwWUhmcFFT?=
 =?utf-8?B?RmJaRXgyZWNxWVZxbGtmOVFmRDNnOUFkVmgzZ09JWkhJemE5ZWZuS09SaWM2?=
 =?utf-8?B?M01IN1BKOFp3T3lVZzBQMStkNmZ2MEpDdXZDVTlZRUhoYlZLMjhNcmVzdjFO?=
 =?utf-8?B?VzV3TnNsNUErWVVMUmFQQm9xRmVsdmdnajliWVJwTlg5UUFIRkNXM29pZVZ5?=
 =?utf-8?Q?ACjyR1bzgV88T/BSnWKO9veqXxfvIf0UNJRNUKx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3406
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5659df8-10f4-46b4-78a4-08d91b558809
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qFKP7pTBzPSrPYwqSN0NNnJud6yNqex+j2YauItUSEZ4mGDOXkq9hTekHIyW0wvUHQMYwvG5EpvL6Vnr0U5DmHVjckp4GzmdcCQRcUGJY/MXBIPBg4EYpaERI2XXYpubtpXvV3jAOlG03ZJSdW+oJtzef2zIGWDY0wtguYoCAdLLfXHZbMcLRJzVIL/u39iEuALDmZ74Pne7aHa9Vse32nTk5cEBVC2aIZFIgUUBSwuH88PvjX38zun9tEiS3VJDTiNu8daBMWnawUBkHwbwDTFgsMCHdetBI2+vY/KQ6SB63NM0j+SJJ4YV/ggfJPmyURuZ5goM3UMSWgQUJCDFexsDexAcyftDipGjuA19X0O+5j2dszKRRM7au43qzgCa0InlcsJa4lH6yYeRHZuZb9NaItJVklS5EhcnNdt/1mtlG/wyYEa3tyMRGOdve4wgvM7hQYxBMuytPIFLr9+xTC0aZ0n+PRUuljDGIwZCj1gp0D40YP3mK+1o+N5MpDYMHMlezYQ6otULhUxgQOv6OUQBFq4kLdx80OkBb3GXtAUGRtHYsLCjiLjGBhZSsol2umaBudGnwiD7MVW2vkadHzu2izHEbKuD5ecV56Y6nO9tw17NYbnvZ3LZTMCbII5l12+2MysaMl0hwGfLzA4lYXAhFdQefL5XD8ztPr9NiZjeMZkhC8CVzkBjq2/dGMr6fBtaDZHdmWTS8QopP/1FP/P0brzbJV2FkjBIw6vv/o8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(36840700001)(46966006)(5660300002)(966005)(52536014)(4326008)(70586007)(70206006)(316002)(336012)(186003)(55016002)(2906002)(110136005)(356005)(54906003)(82740400003)(9686003)(81166007)(8936002)(8676002)(6506007)(7696005)(26005)(83380400001)(82310400003)(47076005)(36860700001)(86362001)(478600001)(53546011)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 06:07:30.3368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b956f725-6ecd-4677-82a8-08d91b558d1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSAyMCwgMjAyMSAy
OjI3IEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzog
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4g
PFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAwMS8xMF0geGVuL2FybTogaW50cm9kdWNlIGRvbWFpbiBvbiBTdGF0aWMgQWxsb2NhdGlvbg0K
PiANCj4gT24gMTkvMDUvMjAyMSAwMzoyMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVs
aWVuDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IFR1
ZXNkYXksIE1heSAxOCwgMjAyMSA0OjU4IFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnku
WmhlbmdAYXJtLmNvbT47DQo+ID4+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0
YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8
bmRAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMS8xMF0geGVuL2FybTogaW50
cm9kdWNlIGRvbWFpbiBvbiBTdGF0aWMNCj4gPj4gQWxsb2NhdGlvbg0KPiA+Pj4gK2JlZ2lubmlu
Zywgc2hhbGwgbmV2ZXIgZ28gdG8gaGVhcCBhbGxvY2F0b3Igb3IgYm9vdCBhbGxvY2F0b3IgZm9y
IGFueSB1c2UuDQo+ID4+PiArDQo+ID4+PiArRG9tYWlucyBvbiBTdGF0aWMgQWxsb2NhdGlvbiBp
cyBzdXBwb3J0ZWQgdGhyb3VnaCBkZXZpY2UgdHJlZQ0KPiA+Pj4gK3Byb3BlcnR5IGB4ZW4sc3Rh
dGljLW1lbWAgc3BlY2lmeWluZyByZXNlcnZlZCBSQU0gYmFua3MgYXMgdGhpcw0KPiA+Pj4gK2Rv
bWFpbidzDQo+ID4+IGd1ZXN0IFJBTS4NCj4gPj4NCj4gPj4gSSB3b3VsZCBzdWdnZXN0IHRvIHVz
ZSAicGh5c2ljYWwgUkFNIiB3aGVuIHlvdSByZWZlciB0byB0aGUgaG9zdCBtZW1vcnkuDQo+ID4+
DQo+ID4+PiArQnkgZGVmYXVsdCwgdGhleSBzaGFsbCBiZSBtYXBwZWQgdG8gdGhlIGZpeGVkIGd1
ZXN0IFJBTSBhZGRyZXNzDQo+ID4+PiArYEdVRVNUX1JBTTBfQkFTRWAsIGBHVUVTVF9SQU0xX0JB
U0VgLg0KPiA+Pg0KPiA+PiBUaGVyZSBhcmUgYSBmZXcgYml0cyB0aGF0IG5lZWRzIHRvIGNsYXJp
ZmllZCBvciBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbjoNCj4gPj4gICAgIDEpICJCeSBkZWZhdWx0
IiBzdWdnZXN0cyB0aGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSBwb3NzaWJpbGl0eS4NCj4gPj4gSG93
ZXZlciwgSSBkb24ndCBzZWUgYW55Lg0KPiA+PiAgICAgMikgV2lsbCB0aGUgZmlyc3QgcmVnaW9u
IG9mIHhlbixzdGF0aWMtbWVtIGJlIG1hcHBlZCB0bw0KPiA+PiBHVUVTVF9SQU0wX0JBU0UgYW5k
IHRoZSBzZWNvbmQgdG8gR1VFU1RfUkFNMV9CQVNFPyBXaGF0IGlmIGEgdGhpcmQNCj4gcmVnaW9u
IGlzIHNwZWNpZmljZWQ/DQo+ID4+ICAgICAzKSBXZSBkb24ndCBndWFyYW50ZWUgdGhlIGJhc2Ug
YWRkcmVzcyBhbmQgdGhlIHNpemUgb2YgdGhlIGJhbmtzLg0KPiA+PiBXb3VsZG4ndCBpdCBiZSBi
ZXR0ZXIgdG8gbGV0IHRoZSBhZG1pbiBzZWxlY3QgdGhlIHJlZ2lvbiBoZS9zaGUgd2FudHM/DQo+
ID4+ICAgICA0KSBIb3cgZG8geW91IGRldGVybWluZSB0aGUgbnVtYmVyIG9mIGNlbGxzIGZvciB0
aGUgYWRkcmVzcyBhbmQgdGhlIHNpemU/DQo+ID4+DQo+ID4NCj4gPiBUaGUgc3BlY2lmaWMgaW1w
bGVtZW50YXRpb24gb24gdGhpcyBwYXJ0IGNvdWxkIGJlIHRyYWNlZCB0byB0aGUgbGFzdA0KPiA+
IGNvbW1pdA0KPiA+IGh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuLzIwMjEwNTE4MDUyMTEzLjcyNTgw
OC0xLQ0KPiBwZW5ueS56aGVuZ0Bhcm0uY29tLzIwDQo+ID4gMjEwNTE4MDUyMTEzLjcyNTgwOC0x
MS1wZW5ueS56aGVuZ0Bhcm0uY29tLw0KPiANCj4gUmlnaHQuIE15IHBvaW50IGlzIGFuIGFkbWlu
IHNob3VsZCBub3QgaGF2ZSB0byByZWFkIHRoZSBjb2RlIGluIG9yZGVyIHRvIGZpZ3VyZQ0KPiBv
dXQgaG93IHRoZSBhbGxvY2F0aW9uIHdvcmtzLg0KPiANCj4gPg0KPiA+IEl0IHdpbGwgZXhoYXVz
dCB0aGUgR1VFU1RfUkFNMF9TSVpFLCB0aGVuIHNlZWsgdG8gdGhlIEdVRVNUX1JBTTFfQkFTRS4N
Cj4gPiBHVUVTVF9SQU0wIG1heSB0YWtlIHVwIHNldmVyYWwgcmVnaW9ucy4NCj4gDQo+IENhbiB0
aGlzIGJlIGNsYXJpZmllZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0KDQpPaywgSSB3aWxs
IGV4cGFuZCBjb21taXQgdG8gbGV0IGl0IGJlIGNsYXJpZmllZCBtb3JlIGNsZWFybHkuDQoNCj4g
PiBZZXMsIEkgbWF5IGFkZCB0aGUgMToxIGRpcmVjdC1tYXAgc2NlbmFyaW8gaGVyZSB0byBleHBs
YWluIHRoZQ0KPiA+IGFsdGVybmF0aXZlIHBvc3NpYmlsaXR5DQo+IA0KPiBPay4gU28gSSB3b3Vs
ZCBzdWdnZXN0IHRvIHJlbW92ZSAiYnkgZGVmYXVsdCIgdW50aWwgdGhlIGltcGxlbWVudGF0aW9u
IGZvcg0KPiBkaXJlY3QtbWFwIGlzIGFkZGVkLg0KPiANCg0KT2ssICB3aWxsIGRvLiBUaHguDQoN
Cj4gPiBGb3IgdGhlIHRoaXJkIHBvaW50LCBhcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCB3ZSBjb3Vs
ZCBwcm92aWRlIGFuDQo+ID4gb3B0aW9uIHRoYXQgbGV0IHVzZXIgYWxzbyBkZWZpbmUgZ3Vlc3Qg
bWVtb3J5IGJhc2UgYWRkcmVzcy9zaXplPw0KPiANCj4gV2hlbiByZWFkaW5nIHRoZSBkb2N1bWVu
dCwgSSBvcmlnaW5hbGx5IHRob3VnaHQgdGhhdCB0aGUgZmlyc3QgcmVnaW9uIHdvdWxkIGJlDQo+
IG1hcHBlZCB0byBiYW5rMSwgYW5kIHRoZW4gdGhlIHNlY29uZCByZWdpb24gbWFwcGVkIHRvIGJh
bmsyLi4uDQo+IA0KPiBCdXQgZnJvbSB5b3VyIHJlcGx5LCB0aGlzIGlzIG5vdCB0aGUgZXhwZWN0
ZWQgYmVoYXZpb3IuIFRoZXJlZm9yZSwgcGxlYXNlIGlnbm9yZQ0KPiBteSBzdWdnZXN0aW9uIGhl
cmUuDQo+IA0KPiA+IEknbSBjb25mdXNlZCBvbiB0aGUgZm91cnRoIHBvaW50LCB5b3UgbWVhbiB0
aGUgYWRkcmVzcyBjZWxsIGFuZCBzaXplIGNlbGwgZm9yDQo+IHhlbixzdGF0aWMtbWVtID0gPC4u
Lj4/DQo+IA0KPiBZZXMuIFRoaXMgc2hvdWxkIGJlIGNsYXJpZmllZCBpbiB0aGUgZG9jdW1lbnQu
IFNlZSBtb3JlIGJlbG93IHdoeT8NCj4gDQo+ID4gSXQgd2lsbCBiZSBjb25zaXN0ZW50IHdpdGgg
dGhlIG9uZXMgZGVmaW5lZCBpbiB0aGUgcGFyZW50IG5vZGUsIGRvbVV4Lg0KPiBIbW1tLi4uIFRv
IHRha2UgdGhlIGV4YW1wbGUgeW91IHByb3ZpZGVkLCB0aGUgcGFyZW50IHdvdWxkIGJlIGNob3Nl
bi4NCj4gSG93ZXZlciwgZnJvbSB0aGUgZXhhbXBsZSwgSSB3b3VsZCBleHBlY3QgdGhlIHByb3Bl
cnR5ICN7YWRkcmVzcywgc2l6ZX0tY2VsbHMNCj4gaW4gZG9tVTEgdG8gYmUgdXNlZC4gV2hhdCBk
aWQgSSBtaXNzPw0KPiANCg0KWWVhaCwgdGhlIHByb3BlcnR5ICN7YWRkcmVzcywgc2l6ZX0tY2Vs
bHMgaW4gZG9tVTEgd2lsbCBiZSB1c2VkLiBBbmQgdGhlIHBhcmVudA0Kbm9kZSB3aWxsIGJlIGRv
bVUxLg0KDQpUaGUgZHRiIHByb3BlcnR5IHNob3VsZCBsb29rIGxpa2UgYXMgZm9sbG93czoNCg0K
ICAgICAgICBjaG9zZW4gew0KICAgICAgICAgICAgZG9tVTEgew0KICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAieGVuLGRvbWFpbiI7DQogICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MHgyPjsNCiAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KICAgICAgICAg
ICAgICAgIGNwdXMgPSA8Mj47DQogICAgICAgICAgICAgICAgeGVuLHN0YXRpYy1tZW0gPSA8MHgw
IDB4MzAwMDAwMDAgMHgwIDB4MjAwMDAwMDA+Ow0KDQogICAgICAgICAgICAgICAgLi4uDQogICAg
ICAgICAgICB9Ow0KICAgICAgICB9Ow0KDQo+ID4gK0RPTVUxIG9uIFN0YXRpYyBBbGxvY2F0aW9u
IGhhcyByZXNlcnZlZCBSQU0gYmFuayBhdCAweDMwMDAwMDAwIG9mIDUxMk1CIHNpemUNCg0KPiA+
Pj4gK1N0YXRpYyBBbGxvY2F0aW9uIGlzIG9ubHkgc3VwcG9ydGVkIG9uIEFBcmNoNjQgZm9yIG5v
dy4NCj4gPj4NCj4gPj4gVGhlIGNvZGUgZG9lc24ndCBzZWVtIHRvIGJlIEFBcmNoNjQgc3BlY2lm
aWMuIFNvIHdoeSBjYW4ndCB0aGlzIGJlDQo+ID4+IHVzZWQgZm9yIDMyLWJpdCBBcm0/DQo+ID4+
DQo+ID4NCj4gPiBUcnVlLCB3ZSBoYXZlIHBsYW5zIHRvIG1ha2UgaXQgYWxzbyB3b3JrYWJsZSBp
biBBQXJjaDMyIGluIHRoZSBmdXR1cmUuDQo+ID4gQmVjYXVzZSB3ZSBjb25zaWRlcmVkIFhFTiBv
biBjb3J0ZXgtUjUyLg0KPiANCj4gQWxsIHRoZSBjb2RlIHNlZW1zIHRvIGJlIGltcGxlbWVudGVk
IGluIGFybSBnZW5lcmljIGNvZGUuIFNvIGlzbid0IGl0IGFscmVhZHkNCj4gd29ya2luZz8NCj4g
DQo+ID4+PiAgICBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAq
ZmR0LA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBub2Rl
LCBjb25zdCBjaGFyICpuYW1lLCBpbnQgZGVwdGgsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2VsbHMsIHUzMg0KPiA+Pj4gc2l6ZV9jZWxs
cywgQEAgLTM0NSw2ICszOTQsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9zY2FuX25vZGUo
Y29uc3QNCj4gdm9pZCAqZmR0LA0KPiA+Pj4gICAgICAgICAgICBwcm9jZXNzX211bHRpYm9vdF9u
b2RlKGZkdCwgbm9kZSwgbmFtZSwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscyk7DQo+ID4+PiAg
ICAgICAgZWxzZSBpZiAoIGRlcHRoID09IDEgJiYgZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVzKGZk
dCwgbm9kZSwNCj4gImNob3NlbiIpICkNCj4gPj4+ICAgICAgICAgICAgcHJvY2Vzc19jaG9zZW5f
bm9kZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsDQo+ID4+PiBzaXplX2NlbGxzKTsN
Cj4gPj4+ICsgICAgZWxzZSBpZiAoIGRlcHRoID09IDIgJiYgZmR0X2dldF9wcm9wZXJ0eShmZHQs
IG5vZGUsDQo+ID4+PiArICJ4ZW4sc3RhdGljLW1lbSIsDQo+ID4+IE5VTEwpICkNCj4gPj4+ICsg
ICAgICAgIHByb2Nlc3Nfc3RhdGljX21lbW9yeShmZHQsIG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIs
IGFkZHJlc3NfY2VsbHMsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZV9jZWxscywgJmJvb3RpbmZvLnN0YXRpY19tZW0pOw0KPiA+Pg0KPiA+PiBJIGFtIGEgYml0IGNv
bmNlcm5lZCB0byBhZGQgeWV0IGFub3RoZXIgbWV0aG9kIHRvIHBhcnNlIHRoZSBEVCBhbmQNCj4g
Pj4gYWxsIHRoZSBleHRyYSBjb2RlIGl0IHdpbGwgYWRkIGxpa2UgaW4gcGF0Y2ggIzIuDQo+ID4+
DQo+ID4+ICAgRnJvbSB0aGUgaG9zdCBQb1YsIHRoZXkgYXJlIG1lbW9yeSByZXNlcnZlZCBmb3Ig
YSBzcGVjaWZpYyBwdXJwb3NlLg0KPiA+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBjb25zaWRl
ciB0aGUgcmVzZXJ2ZS1tZW1vcnkgYmluZGluZyBmb3IgdGhhdA0KPiA+PiBwdXJwb3NlPyBUaGlz
IHdpbGwgaGFwcGVuIG91dHNpZGUgb2YgY2hvc2VuLCBidXQgd2UgY291bGQgdXNlIGENCj4gPj4g
cGhhbmRsZSB0byByZWZlciB0aGUgcmVnaW9uLg0KPiA+Pg0KPiA+DQo+ID4gQ29ycmVjdCBtZSBp
ZiBJIHVuZGVyc3RhbmQgd3JvbmdseSwgZG8geW91IG1lYW4gd2hhdCB0aGlzIGRldmljZSB0cmVl
DQo+IHNuaXBwZXQgbG9va3MgbGlrZToNCj4gDQo+IFllcywgdGhpcyBpcyB3aGF0IEkgaGFkIGlu
IG1pbmQuIEFsdGhvdWdoIEkgaGF2ZSBvbmUgc21hbGwgcmVtYXJrIGJlbG93Lg0KPiANCj4gDQo+
ID4gcmVzZXJ2ZWQtbWVtb3J5IHsNCj4gPiAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4g
ICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ICAgICByYW5nZXM7DQo+ID4NCj4gPiAgICAgc3Rh
dGljLW1lbS1kb21VMTogc3RhdGljLW1lbUAweDMwMDAwMDAwew0KPiANCj4gSSB0aGluayB0aGUg
bm9kZSB3b3VsZCBuZWVkIHRvIGNvbnRhaW4gYSBjb21wYXRpYmxlIChuYW1lIHRvIGJlIGRlZmlu
ZWQpLg0KPiANCg0KT2ssIG1heWJlLCBobW1tLCBob3cgYWJvdXQgInhlbixzdGF0aWMtbWVtb3J5
Ij8NCg0KPiA+ICAgICAgICByZWcgPSA8MHgwIDB4MzAwMDAwMDAgMHgwIDB4MjAwMDAwMDA+Ow0K
PiA+ICAgICB9Ow0KPiA+IH07DQo+ID4NCj4gPiBDaG9zZW4gew0KPiA+ICAgLi4uDQo+ID4gZG9t
VTEgew0KPiA+ICAgICB4ZW4sc3RhdGljLW1lbSA9IDwmc3RhdGljLW1lbS1kb21VMT47IH07IC4u
Lg0KPiA+IH07DQo+ID4NCj4gPj4+DQo+ID4+PiAgICAgICAgaWYgKCByYyA8IDAgKQ0KPiA+Pj4g
ICAgICAgICAgICBwcmludGsoImZkdDogbm9kZSBgJXMnOiBwYXJzaW5nIGZhaWxlZFxuIiwgbmFt
ZSk7IGRpZmYgLS1naXQNCj4gPj4+IGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oIGluZGV4DQo+ID4+PiA1MjgzMjQ0MDE1Li41ZTlmMjk2
NzYwIDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oDQo+ID4+
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgNCj4gPj4+IEBAIC03NCw2ICs3NCw4
IEBAIHN0cnVjdCBib290aW5mbyB7DQo+ID4+PiAgICAjaWZkZWYgQ09ORklHX0FDUEkNCj4gPj4+
ICAgICAgICBzdHJ1Y3QgbWVtaW5mbyBhY3BpOw0KPiA+Pj4gICAgI2VuZGlmDQo+ID4+PiArICAg
IC8qIFN0YXRpYyBNZW1vcnkgKi8NCj4gPj4+ICsgICAgc3RydWN0IG1lbWluZm8gc3RhdGljX21l
bTsNCj4gPj4+ICAgIH07DQo+ID4+Pg0KPiA+Pj4gICAgZXh0ZXJuIHN0cnVjdCBib290aW5mbyBi
b290aW5mbzsNCj4gPj4+DQo+ID4+DQo+ID4+IENoZWVycywNCj4gPj4NCj4gPj4gLS0NCj4gPj4g
SnVsaWVuIEdyYWxsDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0K
Q2hlZXJzDQoNClBlbm55IFpoZW5nDQo=

