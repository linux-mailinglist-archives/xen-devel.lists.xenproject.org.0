Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B8345B4AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 07:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230062.397783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmAX-00048p-2w; Wed, 24 Nov 2021 06:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230062.397783; Wed, 24 Nov 2021 06:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmAW-00046W-VL; Wed, 24 Nov 2021 06:54:12 +0000
Received: by outflank-mailman (input) for mailman id 230062;
 Wed, 24 Nov 2021 06:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpmAU-00046Q-Pb
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 06:54:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50be48fa-4cf3-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 07:54:07 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO6cYad026032;
 Wed, 24 Nov 2021 06:54:03 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cheu6gafc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 06:54:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3472.eurprd03.prod.outlook.com (2603:10a6:803:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 06:54:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 06:54:00 +0000
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
X-Inumbo-ID: 50be48fa-4cf3-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux14PG5hT/RXDbHzyR4Ti+ERj5wiSioFqpLZDqcx3dBP2MEBNk+AKIVXYdAcACDEA+P/pzAjV5R8wWfZy3e5pvSsC/7wv1KyuTjPlz3Rbqxsl3CAGwiLffjXP6qtu+nTV1cP6SPyFJAIJUuFqMPL1qHxiSAf43K3oP/87FEWXwNoHd2SyL0EBD1xMNQcLcQiOtUXcUWKhnF/dhwQ6/fPie6vRRqQXMC48nbwRZ2utQ5psOtm/U6miUXIsATYN5DBO2SLiJmx0SjDkToYAA1vUhtK/ld8jedkTpxiTSvqPmg2mk8qG3QxFiR2G5g7n70kipxxTpbxoLPv/C9XSE6amg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DLMtKomp2uXVBt+nUZFJgplJl+twfo3xmjpIJtqYso=;
 b=I60AWrV40b09F/uMI4RK8ZmET4UJWpBYw+2OUqkOcVKZBu6BEH4xUYHWgtrEnNMBYduxMbLX6/XcDRw4r6ZQ9ovpi3jkm2JfoI5SXAxW4u+KlhEApAN+/oiLSLniD6QOjEa2rFLu7lLF95mk4tcI1xyy4z+VnZAI4Y1fpzMQALSopAsbcm3D6fjfkvG0NXOWaMFYThHH5cQyeDk+yglX6szPw24GsBlM4uwhpix72RIEshwLWHoPeouYY4xdL5L43JwyJdYG7aI7EMJit0mFihVIj6Ax+dJPrToRBN6/fBSG3rH96ACYb/kaWR04AyB76gEmoj2cbs9scvHMtyL35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DLMtKomp2uXVBt+nUZFJgplJl+twfo3xmjpIJtqYso=;
 b=jVjk8cqdb/TZY71XawPJ6h3JFVelAkkx8n9hmDjn5AdDo94Fo+cs1DZOc0Pm+IgAtyJPhnVmfx86X7/K8ILKlrf62cl+CrIdrZ91kdaXyYtzQrWs3ikwAC4M/qGW/tMIX0bWEEBtaB4imPNQLkn9+X7YL0i1yRRpg9gKTOSzmoPmV9OLA3Qjf7eoVqeiqeLh8PIrFxLf62Lh8vBXsTo31nBXHvQOFzupBeIffEk9wvsURE2ZXw52dDaksQ/nkfVB/3KvnhhwdTiZbV5yFvfkSm0UqKHmAwNwvrlPsXYql4htXAaTC2/5W6vfedNJCxpbkedLfMVIBmWk3dWHUOIXzQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: 
 AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgCAAPUEgIAAofWAgAbUDQCAAA7WAIAADxaAgADd7ICAAKBPgIAACwWAgAAIlwCAAOS/gA==
Date: Wed, 24 Nov 2021 06:54:00 +0000
Message-ID: <0d79bb2b-ae54-0875-e2f6-c3c4a0b1f1c7@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
 <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
 <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
 <0aff1bbb-eaf8-4deb-0808-d7db5f1ba8f5@epam.com>
 <ab73f2e5-11d1-7cb4-89ab-74ef5eb1d32d@xen.org>
 <bfd5d305-b315-2f6d-455d-dd3ba071d0b2@epam.com>
 <7192e606-eae2-e11f-9746-ec88afd1dd25@xen.org>
In-Reply-To: <7192e606-eae2-e11f-9746-ec88afd1dd25@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db7a7467-df04-4809-1ae6-08d9af1731d4
x-ms-traffictypediagnostic: VI1PR0302MB3472:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB34720359E010C8F57ED7217CE7619@VI1PR0302MB3472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vHwm/8wGknXGP9DpF068rV/OB13dLrhfer7hVUR4gnE2aVERZdxW6dVsJ9Dro0H+UN7+rvYW6z6K5+rZSb+xMhfdpRcvDxnC42xmGQTN47Oxl27hxWqOKa5eldWO0i6QNJUIWnL7WMPAP6QuOOMA3K1OY4f9wyJYjZn/xHOJ/cAY6sNdwB2xich4YPqOcjZ8UI4OrHfLf/tItjjIda3AwtpSVyk2sCo/DJMgRDwxqZjfmVIK8UkT9Qt/6ewnXwmPf2KCH7Ykx02A5OfFAv8VUqjbt2oeNZksLOOGkLtfFSXZp0EYyCFvJbNZpR25RaX/wzRprf0SJUgIpWCEX8csmCaVEOGtak6vPtT6K4UxgTemcB/564SJnt9chxku5i+rxUzrGM6L8e7wJ0/s+RZzLGvUXP5zWy+zjfT/EV7K0ug9x2Xr/nrqVHpEpIhiWlojpDHZJeNliZ48GMiVDKk8+9S8J8dLGxn4v7qdAr4DDHOAGtl8fCRkpJNEaoKx8szWb8P/MtFEXtLkr3hfLONfnzEKdcBgDU/GFraW+e/t2LkGlk52K83N6rqSfyyU72QhUDWvDXHZ4wDGiW5wkznx2Fqb6+e2l9zseH2U+oAGYpLEUeW/G1k14v3v93XEki3Q0fdpe9wss0bC8W0Iu+d3wUoASbd5PHW3l57AoJso6ZV9Z0H63osxBL4SsQvWxYJIP7Kz5gLrMwhkGTJUy5oSYXZf3wvXRAoUinTtEaETPhUI211e0P+W8l6xvgdOJeJW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(38100700002)(7416002)(6506007)(8936002)(91956017)(31686004)(110136005)(31696002)(2906002)(71200400001)(36756003)(83380400001)(122000001)(186003)(66946007)(54906003)(2616005)(76116006)(508600001)(316002)(6486002)(4326008)(86362001)(66556008)(66446008)(53546011)(26005)(6512007)(38070700005)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QUhYVWRXS3JMVDkxY05ERjhLMnJta1RqQTFjaDMvRGdzc3M1VDVVRHh5LzNZ?=
 =?utf-8?B?Zkl4Wm1WWmRPYkpiUFY1aUx3b0p3NTZpY1BEYWd5aU41SkVBY2ZWa01aZ1hv?=
 =?utf-8?B?YlQ5Wmx2Y2RFVTRRcWpsUlo4NkQ1NW15Y3VoM2JnNVdRL000cll3ZW1MOUtq?=
 =?utf-8?B?aGwzNVl0bHNjbDFCNzIzOVRFRWJ4ZUhZZk1zcUgxZXdkckZKRkZaZVZHQWpF?=
 =?utf-8?B?djNGbkNKMGVtRzRuY2xRczF6TEdmOUdJUy90Z3VQa1JLODB2Qjg1UGdiZ2o2?=
 =?utf-8?B?ODBndWR5bGw4MmxKVzVlcmRjbXRoVG1ZNVVxYTNXQnFLcTNya2NWZVllblJX?=
 =?utf-8?B?amhVcmlldjZWSTA1ZFZjek03eFhVWG5pR2VnZFRmenR1R3kzcjY4amN3SUhM?=
 =?utf-8?B?MXJ6VVdhSzFPcjVLZzFLOE9mVU55MGdxTFlpSzJPQjJMUldQZG50TkVRL3I0?=
 =?utf-8?B?NjZpSmgxTENVQzVuZmNtZE53NkZ5VnNsM2MzL1NoRGlFSnUxSS92RDN0WWxi?=
 =?utf-8?B?QVJqOGNCcFdSWHV4MWdZdUN5N050clQ3aWtOUnd1cHlsQlJVZHowOTJpbzZJ?=
 =?utf-8?B?UEl4UTJveDdzSm9uem1sZXFCMm5JVUE2bEk5TnBkcGF4d1VsMGlpS3ZvYjUz?=
 =?utf-8?B?S3IrM2tBQzJ5TjJiR0FhWTBoeFZGNERFdDN4aDZHRE5lekxwd3JUVnZtTHZN?=
 =?utf-8?B?b2VabmNadnVWNHQzQ05tQVJaejlFakk0djN1eW0rV2Y2V1lUY2hpWmliL3NM?=
 =?utf-8?B?NERsSWs3NFJ3ZGJ2cEdadTFCTmg3NWtOejR4a1MvczIrOEY0RnpEcTVqdTZ3?=
 =?utf-8?B?bFowSUNZbGxMSHBwV2tiZSsxNG4rYWxvK2dqdSs0LzhnWUVsSmM2QWloSVdH?=
 =?utf-8?B?RlFlUk11bDBIMkxhYkI2N0hKSHRWczJZNXZFS0c3ZC9lWktmUUdHbTVNMXNF?=
 =?utf-8?B?RnR1THRPMHpFb1ErU3lFYm0rNXdJS1hPMkY0QlFOcEgyOWFVRUpPQzBtNks5?=
 =?utf-8?B?WjBCb29WRm9wYy9BWHhqUWY0MjVmZldQZFVQTDB6MXJOK3cxZVowTGk2M1U2?=
 =?utf-8?B?TVhNUHBoYjRHOGhHZmpKUDR1clEzQXJHUk5VSWk3TzZIeCtFaG1hKzNWRUtt?=
 =?utf-8?B?TSt2emluU29Ba2tpUWp6SW5lTFU0YzkvOTlhVC9WQUlxUGxIWmZTQ2czN1BM?=
 =?utf-8?B?aGFwdEFsS0gya0JJOEpFK05RckxQbDVkT05YOVVQYmZWbHI4UnVxQkJnOXl5?=
 =?utf-8?B?WVVRVEU3UDFyN0dqRmNsTnZuTjl4djV2V3Q1NDlRUHVRMHY4WGJxN296bS9v?=
 =?utf-8?B?UTI0Wk9oSmFLYVpjcWdFT0xUa3dHME1HM3Y3dUxnUWRpMDB3MDJtRUd2UWEr?=
 =?utf-8?B?QktTc0FmL1orRkZvVzZoZWNNall0ZlJZeDdhNEhIV2RUN01scjl1ZlhyUEFO?=
 =?utf-8?B?K2YxNG9KMGxiWU50d2d1SE55MnJsMEdCaFRSNzJhN0paZjVkMC9QVWNRb0tY?=
 =?utf-8?B?Z0J6QldsQWR5VlZwaGlDSjh2U0RwQWpKTDloL1FTdmJ5dTZtMEJnd2dQb0t1?=
 =?utf-8?B?dnVDbnk0QTFGaFB4ZzI1RmNVRXhIc0xPaVhQQkZGOFo0WEJ2TW5ZUnZaN250?=
 =?utf-8?B?MHErMmdXRFNxRldBME5GRnFOK29BL2VBV2Zob3RmK0tTVU40MUYvMlRYUGpk?=
 =?utf-8?B?K1N4WWpLZkJKSkgyVUFDUlNQZDM0a1ZqRmtMS2s1dzJHOWtDamlodEpyWkhD?=
 =?utf-8?B?d3ZBRExiYUpRUjN4SGdJUTZFVktNZzdZbGNGUU1FUHRrNlV1WUlyTG9JbFk1?=
 =?utf-8?B?cERHQVdidE4zcmZLcWY1b1phL1VzWXEwZFloSXUxUFhyNUVNVk4yVmhxaDd3?=
 =?utf-8?B?TkZyV0ptRWUreUQvL1NCOWgrQThZSzZBb1A4cDBmcVpGcUFMeC9vSXZTby9U?=
 =?utf-8?B?T1F1d1dIQnI2UzNqYW85QzVxN2NvamZxNE5MZ2NZT09HZzdzcmcybFl1U3JC?=
 =?utf-8?B?akFjVmdySC9laTZhVnRhY2JkbXRDTG9DTHJCRGU2bHFvUEhxbnBxTWNKQS8w?=
 =?utf-8?B?TnpTeEZlT0VwY05oYk9wQnpWZFZhc2EwSkhsRnY1Zm1TUzY0TVJoeHEwTTBW?=
 =?utf-8?B?MUR6QXBZY1FkSlViek1IRTlGY1grM0JwYTBqU0JjV1VrTVc1Y1BPTmJWaXRL?=
 =?utf-8?B?Z1hWSVJwU3BBM2xKNS83OVZhQWkvNFBNUTk4ZlM2Z1A1V0U5V0hjS25GaU52?=
 =?utf-8?B?SWxHdmd0VFBqTUxkSllvYWRranduYkpiU1c3RWVHRjl1OER5eXdCWGpsTitJ?=
 =?utf-8?B?TmRKTlViZGVkRWNsWjNsVkp1S0V1UXpzWElTdHI1TTU3L2NtY1FVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B0AA03D88BBBF419158D1531844AC36@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7a7467-df04-4809-1ae6-08d9af1731d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 06:54:00.4111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCXG+9Xf8FAg/TjWpea+Qu27+yzYgrnp/tElEKdT9Jzsp8lx72FQwjQLz58+N4KMPHQSb5kBMBch77WKNQfdszSG1810nc+JdrvJucoaSfXCkERsulm5tNvFOnpuNsu9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3472
X-Proofpoint-GUID: cOE44abuMQxD_FMYokOADSsk3UvD2eAM
X-Proofpoint-ORIG-GUID: cOE44abuMQxD_FMYokOADSsk3UvD2eAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_02,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=687 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111240039

SGksIEp1bGllbiENCg0KT24gMjMuMTEuMjEgMTk6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGksDQo+DQo+IE9uIDIzLzExLzIwMjEgMTY6NDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4gT24gMjMuMTEuMjEgMTg6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBP
bGVrc2FuZHIsDQo+Pj4NCj4+PiBPbiAyMy8xMS8yMDIxIDA2OjMxLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+Pj4NCj4+Pj4NCj4+Pj4gT24gMjIuMTEuMjEgMTk6MTcsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4NCj4+Pj4+IE9uIDIyLzExLzIwMjEgMTY6
MjMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDIyLjExLjIxIDE3
OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+IEkgd291bGQgcHJlZmVyIHRvIGdvIHdp
dGggbXkgd2F5LiBUaGlzIGNhbiBiZSByZWZpbmVkIGluIHRoZSBmdXR1cmUgaWYgd2UgZmluZCBE
ZXZpY2UtVHJlZSB0aGF0IG1hdGNoZXMgd2hhdCB5b3Ugd3JvdGUuDQo+Pj4+Pj4gT2ssIHNvIGp1
c3QgdG8gbWFrZSBpdCBjbGVhcjoNCj4+Pj4+PiDCoMKgwqAgPmEgUENJIGRldmljZSB3b3VsZCBh
bHdheXMgYmUgZGVzY3JpYmVkIGFzIGEgY2hpbGQgb2YgdGhlIGhvc3RicmlkZ2VzLiBTbyBJIHdv
dWxkIHJld29yayB0aGUgJ2lmJyB0byBhbHNvIGNoZWNrIGlmIHRoZcKgcGFyZW50wqB0eXBlwqBp
c8Kgbm90wqAicGNpIg0KPj4+Pj4NCj4+Pj4+IFRoYXQncyBjb3JyZWN0LiBUaGFuayB5b3UhDQo+
Pj4+IE9rLCBzbyBob3cgYWJvdXQNCj4+Pj4gwqDCoCDCoMKgwqAgaWYgKCBpc19wY2lfcGFzc3Ro
cm91Z2hfZW5hYmxlZCgpICYmIGR0X2RldmljZV90eXBlX2lzX2VxdWFsKG5vZGUsICJwY2kiKSAp
DQo+Pj4+IMKgwqAgwqDCoMKgIHsNCj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCBib29sIHNraXAg
PSBmYWxzZTsNCj4+Pj4NCj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiDCoMKgIMKg
wqDCoMKgwqDCoMKgwqAgKiBJZiB0aGUgcGFyZW50IGlzIGFsc28gYSAicGNpIiBkZXZpY2UsIHRo
ZW4gImxpbnV4LHBjaS1kb21haW4iDQo+Pj4+IMKgwqAgwqDCoMKgwqDCoMKgwqDCoCAqIHNob3Vs
ZCBhbHJlYWR5IGJlIHRoZXJlLCBzbyBub3RoaW5nIHRvIGRvIHRoZW4uDQo+Pj4+IMKgwqAgwqDC
oMKgwqDCoMKgwqDCoCAqLw0KPj4+DQo+Pj4gVGhpcyBjb21tZW50IGlzIGEgYml0IGNvbmZ1c2lu
Zy4NCj4+IERvIHlvdSBoYXZlIHNvbWV0aGluZyBvbiB5b3VyIG1pbmQ/DQo+DQo+IFllcywgZXhw
bGFpbiB0aGF0IHdlIG9ubHkgd2FudCB0byBjb3ZlciBob3N0YnJpZGdlIChzZWUgbXkgcmVwbHkg
b24gdGhlIHByZXZpb3VzIGFuc3dlcikuDQpJIGd1ZXNzIHRoaXMgd2lsbCBiZSBleHBsYWluZWQg
YnkgdGhlIGNvbW1lbnQgdG8gaGFuZGxlX2xpbnV4X3BjaV9kb21haW4gYmVsb3cNCj4NCj4+PiBJ
IHRoaW5rIHdoYXQgbWF0dGVyIGlmIHRoZSBwYXJlbnQgaXMgYSAicGNpIiBkZXZpY2UsIHRoZW4g
dGhlIGN1cnJlbnQgbm9kZSBtdXN0IG5vdCBiZSBhIGhvc3RicmlkZ2UuIFNvIHdlIGNhbiBza2lw
IGl0Lg0KPj4gQnkgc2tpcHBpbmcgeW91IG9ubHkgbWVhbiB3ZSBkbyBub3QgbmVlZCB0byBhZGQv
YXNzaWduICJsaW51eCxwY2ktZG9tYWluIiwgcmlnaHQ/DQo+DQo+IFllcy4NCj4NCj4+PiBIb3dl
dmVyLi4uDQo+Pj4NCj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoCBpZiAoIG5vZGUtPnBhcmVudCAm
JiBkdF9kZXZpY2VfdHlwZV9pc19lcXVhbChub2RlLT5wYXJlbnQsICJwY2kiKSApDQo+Pj4+IMKg
wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBza2lwID0gdHJ1ZTsNCj4+Pj4NCj4+Pj4gwqDCoCDC
oMKgwqDCoMKgwqDCoCBpZiAoICFza2lwICYmICFkdF9maW5kX3Byb3BlcnR5KG5vZGUsICJsaW51
eCxwY2ktZG9tYWluIiwgTlVMTCkgKQ0KPj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgIHsNCj4+Pj4g
SSBwbGF5ZWQgd2l0aCBhIHNpbmdsZSBpZiBhbmQgaXQgbG9va3Mgc2NhcnkuLi4NCj4+Pg0KPj4+
IC4uLiBob3cgYWJvdXQgaW50cm9kdWNpbmcgYW4gaGVscGVyIHRoYXQgd2lsbCByZXR1cm4gdHJ1
ZSBpZiB0aGlzIG5vZGUgaXMgbGlrZWx5IGFuIGhvc3RicmlkZ2U/DQo+PiBUaGlzIGlzIHlldCBh
IHNpbmdsZSB1c2Ugb2Ygc3VjaCBhIGNoZWNrOiB3aHkgd291bGQgd2UgbmVlZCBhIGhlbHBlciBh
bmQgd2hhdCB3b3VsZCB0aGF0DQo+PiBoZWxwZXIgZG8/DQo+DQo+IEkgbGlrZSBzcGxpdHRpbmcg
Y29kZSBpbiBtdWx0aXBsZSBmdW5jdGlvbnMgZXZlbiBpZiB0aGV5IGFyZSBvbmx5IGNhbGxlZCBv
bmNlIGJlY2F1c2UgdGhpczoNCj4gwqAgMSkga2VlcHMgdGhlIGZ1bmN0aW9ucyBsaW5lIGNvdW50
IHNtYWxsDQo+IMKgIDIpIGVhc2llciB0byB1bmRlcnN0YW5kIHdoYXQgaXMgdGhlIHB1cnBvc2Ug
b2YgdGhlIGNoZWNrDQo+DQo+IEluIGZhY3QsIEkgd291bGQgYWN0dWFsbHkgbW92ZSB0aGUgaGFu
ZGxpbmcgZm9yICJsaW51eCxwY2ktZG9tYWluIiBpbiBhIHNlcGFyYXRlIGhlbHBlci4gU29tZXRo
aW5nIGxpa2U6DQo+DQo+IC8qDQo+IMKgKiBXaGVuIFBDSSBwYXNzdGhyb3VnaCBpcyBhdmFpbGFi
bGUgd2Ugd2FudCB0byBrZWVwIHRoZQ0KPiDCoCogImxpbnV4LHBjaS1kb21haW4iIGluIHN5bmMg
Zm9yIGV2ZXJ5IGhvc3RicmlkZ2UuDQo+IMKgKg0KPiDCoCogWGVuIG1heSBub3QgaGF2ZSBhIGRy
aXZlciBmb3IgYWxsIHRoZSBob3N0YnJpZGdlcy4gU28gd2UgaGF2ZQ0KPiDCoCogdG8gd3JpdGUg
YW4gaGV1cmlzdGljIHRvIGRldGVjdCB3aGV0aGVyIGEgZGV2aWNlIG5vZGUgZGVzY3JpYmVzDQo+
IMKgKiBhbiBob3N0YnJpZGdlLg0KPiDCoCoNCj4gwqAqIFRoZSBjdXJyZW50IGhldXJpc3RpYyBh
c3N1bWVzIHRoYXQgYSBkZXZpY2UgaXMgYW4gaG9zdGJyaWRnZQ0KPiDCoCogaWYgdGhlIHR5cGUg
aXMgInBjaSIgYW5kIHRoZW4gcGFyZW50IHR5cGUgaXMgbm90ICJwY2kiLg0KPiDCoCovDQo+IHN0
YXRpYyBpbnQgaGFuZGxlX2xpbnV4X3BjaV9kb21haW4oc3RydWN0IGR0X2RldmljZSAqbm9kZSkN
Cj4gew0KPiDCoMKgwqDCoMKgwqDCoCBpZiAoICFpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCgp
ICkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPg0KPiDCoMKgwqDCoGlmICggIWR0
X2RldmljZV90eXBlX2lzX2VxdWFsKG5vZGUsICJwY2kiKSApDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsNCj4NCj4gwqDCoMKgwqDCoMKgwqAgaWYgKCBub2RlLT5wYXJlbnQgJiYgZHRf
ZGV2aWNlX3R5cGVfaXNfZXF1YWwobm9kZS0+cGFyZW50KSApDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsNCj4NCj4gwqDCoMKgwqDCoMKgwqAgaWYgKCBkdF9maW5kX3Byb3BlcnR5KG5v
ZGUsICJsaW51eCxwY2ktZG9tYWluIiwgTlVMTCApDQo+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMDsNCj4NCj4gwqDCoMKgwqDCoMKgwqAgLyogQWxsb2NhdGUgYW5kIGNyZWF0ZSB0aGUgbGlu
dXgscGNpLWRvbWFpbiAqLw0KPiB9DQo+DQpJJ20gZmluZSB3aXRoIHRoaXMsIHdpbGwgbW92ZSwg
dGhhbmtzDQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

