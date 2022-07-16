Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B70576FD6
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 17:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368795.600202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjaw-0000JZ-FZ; Sat, 16 Jul 2022 15:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368795.600202; Sat, 16 Jul 2022 15:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjaw-0000GX-Cz; Sat, 16 Jul 2022 15:20:38 +0000
Received: by outflank-mailman (input) for mailman id 368795;
 Sat, 16 Jul 2022 15:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAeN=XV=epam.com=prvs=9196fa0856=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oCjau-0000GR-UC
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 15:20:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6254a59-051a-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 17:20:35 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26GDT2fw016366;
 Sat, 16 Jul 2022 15:20:23 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hbpq60nx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Jul 2022 15:20:23 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by HE1PR0302MB2682.eurprd03.prod.outlook.com (2603:10a6:3:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sat, 16 Jul
 2022 15:20:19 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5438.020; Sat, 16 Jul 2022
 15:20:19 +0000
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
X-Inumbo-ID: d6254a59-051a-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I70TF1oCO8RVwduXeAKQSY56qH/qEAQAcxcdmLN8nnoMJVPBkDCFIQEr0WeSito8dGrNvdRwtVG/CnFld19bAZqQiZ5cxaCt/DYO+jYvuu/972DJ/R2/qPlNFNqkHoIJmEg9xlnNmJxP3MpXW5C7zOk4ZZLa4FwDIJcA0jzrDtTH8MXw6kHcTQUJb6yn18z1UvAriZAAKRgqBZ3eu6RGRX1JD9IG0EcbI3MKzZZ7RoANA+u7o1lDD3rtf//YxwM7SyCXX5Pbjwkt6xIzn8qXnUK57I9egWqGIfHcpTicip2A5miHeGnxyNMh6A/Bom7ZmvAPCc1Om16YKSUUfsK2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMdtZuGqM6Yn4z3iBA6jOwDfkIR17zhSR5ATfqdD4Ug=;
 b=JjMFXYdnsKXIqQxH8Rq5dfIAoR3fOYF1HeJqJ7Mk+rG68hIX88Ex/yCdf8QR6Fsill/qGT+wlOrub6Y0ZN8fkj5JNKP+yNUjippHHMAaIVAfRo6oKOUo1KDYqOMCpeidwfngRvJjvuQCROQYxSBMPvkjlxHyg9y/5BDmtwG+Zpdd0ihvWwFIq7hq1zoWSLbziHJrnyd7vMY7UBKJclVScPZIvSQUZ6MZjhGCqhN2mr/OMzfqZgbL/kDKnuyv6KbsXHBUKJT3+B/00eC57u1fGSCdm0Yo9BRMjkHFH9GjLHYzJ5bzYQmNoLgpaQ921M8JRL/nvHRLwvSQXoTRkWOCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMdtZuGqM6Yn4z3iBA6jOwDfkIR17zhSR5ATfqdD4Ug=;
 b=PX0jcnbxe2FbgAiRJfW2MAgp0pUcLega8krpnKuibqhUwcSI6zVumY8IEft8GjOZnw4XtzNyglShUE8oxflGpcyz+Okf1VS6BbMipeXtrh7rsVUTBsmR91YE52VLBDEDz7MR6W58kpO16Y6jWl9ALqYMvMFOFhZDSDnVA8ldddUWIDcuBY8XALz4a+3aufUo6PzBpl4DYoWtfwvAWKA7iky6iUABGz4YJJwreFqsuvxx0qeBJVnfDHsKfypKZAkPZVonUKeIp2sp8Sri9KSLayWmfgjIcqjeZoQ+cH0yaVuwcrAhBb9204+L9kzM6OUCjY+MBakJptlnnEcAz4katQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Topic: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info
 on Arm
Thread-Index: AQHYmSRblRf/ElMSr02W3irv+3b7ea2BGZ0AgAADNYA=
Date: Sat, 16 Jul 2022 15:20:19 +0000
Message-ID: <9b2a088c-0996-8871-2c64-e2d8ffd48a83@epam.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <89d03f62-cc43-663b-bbfb-5341498f55a7@xen.org>
In-Reply-To: <89d03f62-cc43-663b-bbfb-5341498f55a7@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3839cb45-9428-45e6-5b71-08da673eb19c
x-ms-traffictypediagnostic: HE1PR0302MB2682:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e2aSdAn6BTHJKS+zgvmB7bORYN0ompBabDRd5zJBaRykv65+ih/dRtrimkHAD+Gvh5x/dEZXGUxCY1hj8cM1UcbveJCJYPSsfPDmAhK63B644BAN0L5oqxZbEiyRkLShop+bCpoTtOdPbf3x2wzr6Cvms1FsRweF8ssGUO1QYyzsYY49+Hhm71ZD+0E7CiO/l5PHMLZMfEh60UJLgRU6vm6yh4BuGVBprkFlTCN7n3aiEapipvyOSYIzW/p4ewQZiVmHsH4nBQ9VQX34I03ILv6jcnP2eAwJjWNJEHbyE3tLsIwmAFR1bxSlvlECcW2XxloG8jAivI3g9b5FcDeXY7/5xm34AuHuXsQFf7d0+uMZZ3UPvy/wEEkeXlvXDXXSe5OpBooiPVvbJpfq58WKxDgCbV9Z7rJcsYSbBz0kr7KpZAwS4ThGYJ/xfqmAu27Pcw1FYRb1J2nyraJk7av0XU2GtFj7VY+SrsIkoatGnDxBaom2/Sz9HjE3MnqJwV8+5P97vX1Sgfwgol0Vgg9q2LeYMcoprmrCou5nUFVJ4EiiE3GrgB2Eon7B5mrM6bYOrbcQWBkXsrYASoCRONJawgsQ96VN7ERNNGd8vvY9ZOWDMQ/pmmLO8PWUTxPJ1p7gDOJfNeHbYbkuuX05focgl4mMb8WyEYd5cmYUtPxLlF/JetTXeSnmy2FpxJYkLiiZ+6wrlAJIbCU0avh5W6z7Rr2/whWtS8z6564rf10vhHMswWwwPvjGK8LeromYUVx3HIm0dUCZCtbJlplJTMz+xc6WYmMGzJZ1c/kuA17SDyUrCm75CKCuMR4gCxchIgUucT7SR5EX9tNLMBgdFSPli1ydCjHmPxc5L6lDVJo9DzA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(6486002)(71200400001)(41300700001)(31696002)(478600001)(186003)(6506007)(6512007)(26005)(2616005)(53546011)(55236004)(122000001)(38070700005)(38100700002)(2906002)(4744005)(31686004)(7416002)(8936002)(86362001)(5660300002)(36756003)(66946007)(76116006)(66556008)(316002)(64756008)(66446008)(66476007)(8676002)(91956017)(54906003)(4326008)(110136005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmJ3ODMzcFBpaytIUnM2UlQ3MHBGcUNQRUhkMHVRQmliVEFZRTZBM21vTjAy?=
 =?utf-8?B?c2R6REVZcjhZd3JyM0hiaUNzYWJkcGtKSDJtOWNVQndpSUh6SGUrY2EwcW1S?=
 =?utf-8?B?MmJNalJWRzluOG85ak4xMjBtVVdqTmluNlMzUmN2NmxzZG5WZGFlZGlrQUhZ?=
 =?utf-8?B?M21JWWNXOEdOMVREOThzTUs4QTBFa3lsTkM3cVZEWlVHRTFWMWJvM0QvN2F5?=
 =?utf-8?B?MjBWMVRKWWp4VCtqbXZRTGVmMlo4YjFMS3pkMTE1OGxCSEg3WnlXVDJGaWRn?=
 =?utf-8?B?QUhMQlJFM2NvZG5ja2Jwc0d6d2FVbU9TNWVDRjc4N2RFSTZJajhkZjVFcWlJ?=
 =?utf-8?B?MitQdXkxQTJtdXl0MWMybjhBeEhYakFUQ3ZTRDNEaTBGTXpoem0rVndMd3hx?=
 =?utf-8?B?VWEwRE9wSDU1RVJETFRWVVhjM3kzc2VKbCtBMDNEUmdNMnltOCtDZlpVQjZP?=
 =?utf-8?B?Tm5yM1dEREhZYWhrOHVyM3NQWkY1T0FZTUNWbXhPUEpmRjVpVm1acTJydzVW?=
 =?utf-8?B?MS95Z0VSUEIwdk1GY05RVnNGTDI4Q2NWV0ZyMkZoWmY3VXpiaDA4U3Z1aHVT?=
 =?utf-8?B?cldXbEc4anlvbm16K1M4enkwMHlsem41ci9OOGlqUzQ3U2FIV2RDMTB0azNQ?=
 =?utf-8?B?QlZmUWpnbHFGNkYxcmhabGREU2xHcEZVb1NHazlSek5KdDBhRUNvSUxQdDBo?=
 =?utf-8?B?Ny9lWGRyRXYwZEQyWFJhZEpaSTE4UWx6SGV4R1hOalA1d1M4SGwrOTkxRTNa?=
 =?utf-8?B?THE1OEFxZ0E3SVMwM3M0NTk4TEpwK1VSTDZldzBCVDlReXpPREZvM0pCYTdm?=
 =?utf-8?B?UENQYjdTNC9udXI2a3ZvZWdCWEl2NFFtaWZSR2lQWDArN3NXeDkyZE90YVdz?=
 =?utf-8?B?UWkrNllmN2hNY3RmamcvUWtua3J5NFNEWUxrOGRqOXlVNzJ2Y1hGSjVPb0d0?=
 =?utf-8?B?RGQ4R2VzRHI2TzRXZGQ1Zm1Cd0NWVGRlTkRnQVJFKzRpWEUvaHVUUlNuSG5x?=
 =?utf-8?B?Z3lKOEdqbDVQclFsL3VRcTl2byt3RkgwR1N1eFdZRUR3K1ppL2d2eUNyV3I0?=
 =?utf-8?B?VVNKbU00U0FGbkhZR1J3RVlTYXkvUXpCaHErWWlRdnN0TjczYXcrdnRSQU4z?=
 =?utf-8?B?cCtWenFpdHk1SkZsMHVXRXcvZ05XclhQaXdwcU00OHROOGI2d3dBV3ZGbENL?=
 =?utf-8?B?bFU3bllSNk9NYXEyMXozWjlocXB0NCtWQ1VDa3JJOFhCdzhOSFhrY3prQjJR?=
 =?utf-8?B?L0dDR2o2b01KTmZYNGtzbVRjelk1WGZOYzdEMWk0ODNwTm1vT2liMC9rRFJt?=
 =?utf-8?B?SVI4R0QydzZwN25Mb1B5MkJocmxzVTEyOXhJNzhjQ3ZRalpxYmI2THhCdzBs?=
 =?utf-8?B?OVY1Z3JtRHBmbXFXL2xzQlhYN2FRWUx0UkxFNW9wcSswVm9MVExGNCtOOEEz?=
 =?utf-8?B?aTJPejdUWGZtYmpqSUprdGFsZzZmUC8rd1d6akJqV1ZLWk95cEpBa0dDd1k2?=
 =?utf-8?B?Wjh0NkFCRkdjZHdTSjNSKzNud3FmeWQrY1FZSlJudUlKUnZENnEwV1dGVHVj?=
 =?utf-8?B?ME52UkpvTnBoUkpNajAzdzUvMGE1ZjJTYTFrRXR2b0RWL3hsMFVvOWdsNnNW?=
 =?utf-8?B?RTlUbmZ2SjcrM00xeDRrZ1NyU0RmZXdPdmNxc253UnM4YlRxOGZSQlFVUmtR?=
 =?utf-8?B?QVZuckdEYjA1WmtsZFh1SlEyRGxTR1VVU3kwR2ZGT1NBVHFxSHluMndNS2l2?=
 =?utf-8?B?UDQwRzRJbGZDSHM0N0Vhbmp1cWN5VVRIQjdxbHFBRG83eXlJWWJkRWs0TElR?=
 =?utf-8?B?dVdTcXFVK1htRVBpUG8xd0Y3UkpIdEJtMFBGTmFab21CYm83UXdNTlBLeGtK?=
 =?utf-8?B?bmdRRDRwSlphQ25kMGxlaTZrT1hhM1NaYmh4NzdoQVR5Vlk5Q0sza2ZIOS93?=
 =?utf-8?B?RXJjWHRlTnZaa24rOWdrRWpxVkZrT1pPdUVBL3ZEUnJvVFpwVmp6RmZna2VO?=
 =?utf-8?B?UzBTQWxUTC9aT2N1VjdXZDFqNlBWazFyRnQrVUpQenRTK1cvUnJFdXhBbHFQ?=
 =?utf-8?B?cE9xRWxReHhnMllGOUxhTDZiK2N5amRubnpDMzlSR3YzVHI3RDZVOXdTaFNM?=
 =?utf-8?B?WEFSOHcrSUlLZzBzQmZjQk9uLzNkVFNOT245RFpSVkp3a0VyZUplM05DWDJL?=
 =?utf-8?Q?lhHzyG4TV3L1IxAsFYp6cSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C76AC24BCCCB9546907DCA3440196111@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3839cb45-9428-45e6-5b71-08da673eb19c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 15:20:19.1169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rox/UrSc3pXc0Kahy9KqAIu5DI0HvHlqo8msImTadyx5UuMFmn+V8OEec345b3sb9fCZK2WQRmHAv9fCO/WqPQxg7FMIfZsDs53wWhDPaZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2682
X-Proofpoint-GUID: Jy9SJFo8fzba9tEgpBS7gBHja71GFk2q
X-Proofpoint-ORIG-GUID: Jy9SJFo8fzba9tEgpBS7gBHja71GFk2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-16_11,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 mlxlogscore=590 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207160066

DQpPbiAxNi4wNy4yMiAxODowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBPbGVrc2FuZHIs
DQoNCg0KSGVsbG8gSnVsaWVuDQoNCg0KPg0KPiBPbiAxNi8wNy8yMDIyIDE1OjU2LCBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyB3cm90ZToNCj4+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxv
bGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoNClRoYW5rIHlvdSENCg0KDQo+DQo+PiDCoCB4ZW4v
YXJjaC94ODYvaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaCB8wqAgNSAtLS0NCj4NCj4gVGhpcyBj
aGFuZ2VzIHdpbGwgbmVlZCBhbiBhY2sgZnJvbSB0aGUgeDg2IG1haW50YWluZXJzLg0KDQpZZXMu
DQoNCg0KSmFuIGhhcyByZXZpZXdlZCB0aGF0IHBhdGNoIG1hbnkgdGltZXMuDQoNCg0KPg0KPiBD
aGVlcnMsDQo+DQotLSANClJlZ2FyZHMsDQoNCk9sZWtzYW5kciBUeXNoY2hlbmtvDQo=

