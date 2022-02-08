Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C204AD44B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267755.461503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMPQ-0006Ow-SJ; Tue, 08 Feb 2022 09:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267755.461503; Tue, 08 Feb 2022 09:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMPQ-0006ME-OZ; Tue, 08 Feb 2022 09:03:36 +0000
Received: by outflank-mailman (input) for mailman id 267755;
 Tue, 08 Feb 2022 09:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMPO-0006M8-RT
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:03:35 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcdae310-88bd-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:03:32 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187rLQo021859;
 Tue, 8 Feb 2022 09:03:23 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3mh7gabj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:03:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7459.eurprd03.prod.outlook.com (2603:10a6:20b:268::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:03:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:03:18 +0000
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
X-Inumbo-ID: fcdae310-88bd-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhsKF3nvBlI2whbVx0B45eXpgqMvORdT+vVDUs/Gu23PFEuAOz4s0QxF9BERuL+5uHysxMflJhBKcY74f/cchiLCnLS5a9/IW9z5ju/4yW73l+xu0yg4BzUq9oEpJnPHZTmwRGTt0cAn5aXVc2yelmsVz+KlNrEf7EkRAZmEctPtW8gGL7/5svd4oqaVSlF18PK2xMirCLwvdrtWEsb3aikqS5ZXQj7LccFF7X3YozzmWV16hozP7y+k38SvAKFZXR2Dk+L66OEfKRCnfCdsjxdUEmeDIm4mhwmMsH51uSCS1+BRuYabgueSnFmyYogrX9qcDw1KePnvzZC8ZOhM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O23HV0Tc8xdEJ3ADIkfZrEzuetkkxLNqodA8J1DyP5k=;
 b=TwhK3b9exLnubiJGxZlx1cNgI0nI6lUsNC3rmNpzLmVQcY532qo2c3wPr0XbedJ84IP9VgXk3p9BtP553mhDZHL6Isj1xl7mdZhGi9FbFH0onQaMolo8AsorgSChzYOUpTDJeZ0HN0ljrDrjjIVrn+aNB+PGQzML4OWlOLZrqnUADx3C/0NV6co4ypqlvmCA5cGOAZqT6OBrmuqOlBDYsS9HnbMg1X5K6pUMcztDO9KMPd9od/VuOLGfTi5ojbMCFE18skCmKxTN6Z/ETIGBUR/c5NpwD4ClaOqAz+Wn3O45dVaTV9BdHdDEmXkNSrVBS5vQcayPFFv96M8AJDPP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O23HV0Tc8xdEJ3ADIkfZrEzuetkkxLNqodA8J1DyP5k=;
 b=Ss9FTD3E+0FkR7YoaIr8YzMYLJDzEtY9GWRIGLlwGp9Hcuu/GPD6EnJMTObdGSicjrYjcOaAX+hVdfxeM4H4TEN84cjFvBseb0BL6iYs9acEqwjkdc34Sb8jaTjIJK5eueVNsSaAUbIg070e04MSSG7DSrFL8+vVbWwG7UXPOfEfEnllIvYs0nBWZQ7yhMHdYjGxqbtTm9BgbwZTVngcOZi1Bo8d0pMVlAAoIHHN/yyH9bmKqbuQF3MRtHNMCQlx+B82muwGs8HZXc027P4aBGgDgrNwZaICCkaLuuvSFn0zwP3LpQ4cflgaR8ucAT8qSYuXY1fYCUywQqyBt2GZnw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAAB5wCAAPjsgIAAFvmAgAABioA=
Date: Tue, 8 Feb 2022 09:03:17 +0000
Message-ID: <07fcedb1-d063-81ed-9545-7e25e158dfe3@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
 <72abc2b2-7141-0460-2b5a-e27cfa8457f1@suse.com>
In-Reply-To: <72abc2b2-7141-0460-2b5a-e27cfa8457f1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59480e83-3dc5-4e99-0e83-08d9eae1d921
x-ms-traffictypediagnostic: AM9PR03MB7459:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB74597E4A9E19A9A13FDDAC15E72D9@AM9PR03MB7459.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6XzSqDJS91TilZ0kvHyxKXrsNiADY+B3vmMqHFkfmRGQ2132Gzuzd/7GiNsfR0KWnTPeLUim9f1IPWAsCAl2xG6y+QdytsShU79ulK4UgcPsH9zLyvkx2jgxrUNe2S7IHOUpiHaixTkKhQk/S3oWzy/fR+wcGzc/pzHwKn+ur9fLkTS+sEnwzBI0/k+OhhwiCQw523WdXUnXFUCAM2TBjYGQPjG/r0Bxzx8k+YHZg+BvxJAW7eziss2Kcxrs4J++yb2J7LYTflS+UQRrHO4ln452VePraxhM5p+GDOFcbVSijb8pJXosgMqp3FRII03sW+DJEPta1gki2UkT4kftP2TyzJe+c9/f8OstbHPqiTze0cD9gcTS40rlD782J4IPzBCZh8AWDHQye8k4Qygb71SAGIj+t9hjQ9Al6f3MTndJS/SqHF08SVWdz6zXJ61hiL0FSk1nCzbqmlIKz36+CuTUqSfJ4twPwqrtTF30FvsRP5UjCrkWrgYyfBibgFrJfOpY9D7tci4oEFYjZlrNT7IjaquWIqMp63wT4YwKIZt2k2V2N0xCkbKZfRjRI0/musz0zhL1HySQBy1JAVSoFR8Rkpurcm0brmAsgWJAg1XtpQp4mZgvrZEoQzY6zYuk1tFQzOdgTZSaz8wg0qpWr3wpMRPYtZgdwNdn33iBI3jDdacZrI0/vM6f7IUEYEwA7z8DHdsF0jsol25MJ8ajso0OSv3u52ebHOZlClo8oohZJ0oBPA8le4H5sxNvnHqM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(508600001)(31686004)(6486002)(31696002)(2616005)(186003)(107886003)(26005)(5660300002)(38100700002)(7416002)(71200400001)(53546011)(66446008)(66476007)(66556008)(64756008)(55236004)(83380400001)(316002)(36756003)(54906003)(86362001)(2906002)(8676002)(4326008)(8936002)(91956017)(66946007)(122000001)(6916009)(6506007)(6512007)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1RaSFFwajI3RlFzQ0pDeTNCcUdJSERsTWcwWlB0K2hLd29pL0psSWFJOCtM?=
 =?utf-8?B?WUhHenlSVnd0U2RhZW02N0djRVM1UHlNc0RwRngvNnVQMEdKcW1ZSDZTV3NX?=
 =?utf-8?B?VU1IK1hSb0Z1K3l6NGo2T0dDWStoRWZIWWNWVWoyMjdaOVVhVUtzQVpFUEpS?=
 =?utf-8?B?VmJWaTVERlQ4bzJDbXBpUHEvMTNZbFM1UUZXdHk4Zk1GcU5kcm5ZdExtVWo5?=
 =?utf-8?B?SW4wNzNTQXRHMVpiczM2NUlBTXRTL29SOWc5SDJVeGZ6MTdodk9nSXF5a2FT?=
 =?utf-8?B?UVFRcGR2Z0tEanlEa0NRTndKN1UwM2lrbWtWemNNN3dyT1RXWXd0Sms2UWl1?=
 =?utf-8?B?T2VISjFmdjNtUkVQc29lQ0tTMVRoUlZPVU8vaEtiVVFjWENKSzRoWG1rYUtt?=
 =?utf-8?B?TGN3bDVmUElLME5XcTNJckU2cWdqZm50NUg4ZHc4djhHc012VGh1YlZoTHpa?=
 =?utf-8?B?Z1JCelNyYlo5bDUvbTU5UkpUdDJ4cWJQeSsyMGtOZ25WRjZtaEd6bkc1VG1W?=
 =?utf-8?B?WWpnNXI0T3VzZnU5S014RldKQkE5Rkc4ckh5QU1OT093cXA5VzJEaVpPUTJG?=
 =?utf-8?B?YWFpd0xVL2RSbUhuV3VEeUl3Znk0dnN6T3VTdzJYc0hNcG0xTGNOSmR4b20z?=
 =?utf-8?B?Y2ZyR3FQWnl0RUZDbzM0eGR2eG9kZDUyUmk3ZDFDdmcyMk5GdGM0Q1F0dmpM?=
 =?utf-8?B?NGNTSlpxRk5TZjUrSzg4UUoyamFxeEZBcUhjQ3R1NjVoOWc4bEtVRldnVGtV?=
 =?utf-8?B?ck9rTDNXei9oTWZJejJlbFpzTEpZMlRoUDJ1TFJlb1IxaGJTSmFILyt6VXNh?=
 =?utf-8?B?OHcwZjkwRGZHZk1HbjFnbXlLMkdjQ3p5RG80TTN6Mnp1cGk4VE9OWDlFSUVY?=
 =?utf-8?B?UlR6ZTR3QUM0RXRyNXRSMy93S2Iya01zb3pWNzZjQ0c0Zmp0WTZLKzlPd0N5?=
 =?utf-8?B?ajFleDhYQW0yOGh2MXJwNlhyNmtMQzExWFU2ZmJqWXF4RHN1S3NuTmtkcUg2?=
 =?utf-8?B?NEJnRVJYZEorQUVOT3ZMOFJzeDdxUDBTQkh1L2xBQ0E2RjIwUU83czUwTkY5?=
 =?utf-8?B?WEtKM1ZRNlV6OHBkZldZMnhpR2xaTjlLVno0MDdjWXQ5akFlTmVvWUlLeFN6?=
 =?utf-8?B?ZUZjRTU1YnY2SWROOW9TVEFlalRFWkNxa2tkdXJlTVVsQlA4M0pRS2dYSEZR?=
 =?utf-8?B?Mkd3d3hzbnFPa0w5MFEvcGJPNTc5ZFZUaUllMGw4MVZ5LzhhNllRWkFaSits?=
 =?utf-8?B?cmVkLzBBaVRYV2FMMHRwcUk2eE9PK1JxQVRhR1ZiMWNucThONEdEajhaUmp6?=
 =?utf-8?B?U3k1QUN4U2FFK005V3k1OTd6Q1MwMGU1KzA2dXZZT2JvNi9ERXpQY0w5aXFz?=
 =?utf-8?B?UmNodG05eTZUclFkckFRczJKQXFscGgvc1AvNWtPSzBIQmN6SWFCcFRRaXl0?=
 =?utf-8?B?R0oySDVEcXM3VXBKUG5kZ0lObG9HOCt6bGxrYlBWdmwxYTRIR0UzMkExZTFk?=
 =?utf-8?B?YTQ0N1Frd25rMFIzMnFxN0owMy8zczdDeW12V2VVRFArQXh0NS9MK2ZLVFg5?=
 =?utf-8?B?akFub0t5L2NiTktsUVMrQkdJT255VG0rcU9LRmoxZHFzVkd5UFhCdUo2TUNP?=
 =?utf-8?B?MXlJenlRc01kWS9mOGw5VlVWdGpkU3lNNElpY01RVGtSQnRkU1hGVjdrb0Na?=
 =?utf-8?B?MnZ6Nm9HSmszWmxUYnplYjJnMHV5MzBoWTJaT21yckhZQmxpcUNrc3hSaHhQ?=
 =?utf-8?B?WjVyU0FCOVNNcytISUtvU1FhZ0wyc01NRUtyZHVGL09pQWxBNUlYWVJieUll?=
 =?utf-8?B?Q0IreFc5M3d4L1Vtb05oWFJrRjllWEkvMlk1Ymo3eXdQeFdjOHZNZytZNGJO?=
 =?utf-8?B?MnlMdzZ6bURmWDVQQmxaNks4MlFteUJtNVRZaTVsb0JMMEN2eVNHSm9tSW5H?=
 =?utf-8?B?R01TQjZLa0lRL1hvcnAwd20yVUJoaDc2a2VTYTR0K0NXMDRPMWlBZXFHNmhu?=
 =?utf-8?B?N2U4cGJFQ0hEa2NHUnlVM2tGUFU1ZXBzandsWFVxdE4zbjBTRllqQlJWSzFm?=
 =?utf-8?B?bXE1cFlaUWdRRTEzMEp5cEJ3ZWZzU2NHN20vem9TemhoT2ZwK3FDNTFEVGxp?=
 =?utf-8?B?a0x5OW85dEhXR3M4QWtucUdHaWNvUXZQUDlNZ2VFMnIzRFFtclZkT1Vxaytn?=
 =?utf-8?B?VE56Z0pDSmhzNWppWVg2ZHhFS2lFZnhjQmhtOEFwclRzZEJaT2x2OW9UNU9l?=
 =?utf-8?B?ZzJkcHBPRWNIMG5CT3psRGc2bEQxeUhWeERabUczSXVSUE5KSEJhTEJOa3Q3?=
 =?utf-8?B?dlErcFhPZXAxd1h0V3BmYktDMlBSODR5V1R1VjFwTGdkaUhwTmZNRU9lcVgx?=
 =?utf-8?Q?9TJ+Hix1xa4fyL1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0C8120B74FCF34090598FEA6F5E55F4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59480e83-3dc5-4e99-0e83-08d9eae1d921
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:03:17.9580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7X0NRh2f29jULvJN+L8cLJklJ3FoYP5TnvE4ex+EuJghyC7n0IL9eZPThSyF+ncf7GzTLCaimJWAux99HQPd5LhEQ0oySCOZJoG2eicIvwtYFJ4suIvWAv1k8YhiThX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7459
X-Proofpoint-GUID: tQKxHlHB0Jsff1st4v47AyOFCvtblthB
X-Proofpoint-ORIG-GUID: tQKxHlHB0Jsff1st4v47AyOFCvtblthB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=830 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080051

DQoNCk9uIDA4LjAyLjIyIDEwOjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAwODozNSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAxLjEuIFNlbWkgcmVh
ZCBsb2NrIHVwZ3JhZGUgaW4gbW9kaWZ5IGJhcnMNCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiBJbiB0aGlzIGNhc2Ug
Ym90aCB2cGNpX3JlYWQgYW5kIHZwY2lfd3JpdGUgdGFrZSBhIHJlYWQgbG9jayBhbmQgd2hlbiBp
dCBjb21lcw0KPj4gdG8gbW9kaWZ5X2JhcnM6DQo+Pg0KPj4gMS4gcmVhZF91bmxvY2soZC0+dnBj
aV9sb2NrKQ0KPj4gMi4gd3JpdGVfbG9jayhkLT52cGNpX2xvY2spDQo+PiAzLiBDaGVjayB0aGF0
IHBkZXYtPnZwY2kgaXMgc3RpbGwgYXZhaWxhYmxlIGFuZCBpcyB0aGUgc2FtZSBvYmplY3Q6DQo+
PiBpZiAocGRldi0+dnBjaSAmJiAocGRldi0+dnBjaSA9PSBvbGRfdnBjaSkgKQ0KPj4gew0KPj4g
ICDCoMKgwqAgLyogdnBjaSBzdHJ1Y3R1cmUgaXMgdmFsaWQgYW5kIGNhbiBiZSB1c2VkLiAqLw0K
Pj4gfQ0KPj4gZWxzZQ0KPj4gew0KPj4gICDCoMKgwqAgLyogdnBjaSBoYXMgZ29uZSwgcmV0dXJu
IGFuIGVycm9yLiAqLw0KPj4gfQ0KPj4NCj4+IFByb3M6DQo+PiAtIG5vIHBlci1kZXZpY2UgdnBj
aSBsb2NrIGlzIG5lZWRlZD8NCj4+IC0gc29sdmVzIG92ZXJsYXAgY29kZSBBQkJBIGluIG1vZGlm
eV9iYXJzDQo+PiAtIHJlYWRlcnMgYW5kIHdyaXRlcnMgYXJlIE5PVCBzZXJpYWxpemVkDQo+PiAt
IE5PIG5lZWQgdG8gY2FyZWZ1bGx5IHNlbGVjdCByZWFkIHBhdGhzLCBzbyB0aGV5IGFyZSBndWFy
YW50ZWVkIG5vdCB0byBsZWFkDQo+PiAgIMKgIHRvIGxvY2sgdXBncmFkZSB1c2UtY2FzZXMNCj4+
DQo+PiBDb25zOg0KPj4gLSA/Pz8NCj4gVGhlICJwZGV2LT52cGNpID09IG9sZF92cGNpIiBpcyBm
cmFnaWxlOiBUaGUgc3RydWN0IG1heSBoYXZlIGdvdCByZS0NCj4gYWxsb2NhdGVkLCBhbmQgaXQg
anVzdCBzbyBoYXBwZW5lZCB0aGF0IHRoZSB0d28gcG9pbnRlcnMgYXJlIGlkZW50aWNhbC4NCj4N
Cj4gU2FtZSB0aGVuIGZvciB0aGUgc3Vic2VxdWVudCB2YXJpYW50IDIuDQpZZXMsIGl0IGlzIHBv
c3NpYmxlLiBXZSBjYW4gYWRkIGFuIElEIG51bWJlciB0byBwZGV2LT52cGNpLA0Kc28gZWFjaCBu
ZXcgYWxsb2NhdGVkIHZwY2kgc3RydWN0dXJlIGhhcyBhIHVuaXF1ZSBJRCB3aGljaCBjYW4gYmUg
dXNlZA0KdG8gY29tcGFyZSB2cGNpIHN0cnVjdHVyZXMuIEl0IGNhbiBiZSBzb21ldGhpbmcgbGlr
ZSBwZGV2LT52cGNpLT5pZCA9IGQtPnZwY2lfaWQrKzsNCndpdGggaWQgYmVpbmcgdWludDMyX3Qg
Zm9yIGV4YW1wbGUNCj4NCj4gSmFuDQo+DQo+DQo=

