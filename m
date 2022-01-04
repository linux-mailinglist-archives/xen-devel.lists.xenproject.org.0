Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A06483E76
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 09:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253056.434036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fW5-0001U8-NW; Tue, 04 Jan 2022 08:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253056.434036; Tue, 04 Jan 2022 08:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fW5-0001QA-JC; Tue, 04 Jan 2022 08:50:01 +0000
Received: by outflank-mailman (input) for mailman id 253056;
 Tue, 04 Jan 2022 08:50:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I2F=RU=epam.com=prvs=3003e86fe1=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1n4fW3-0001N4-NT
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 08:50:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4abafc4f-6d3b-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 09:49:58 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2047uJ5i012634;
 Tue, 4 Jan 2022 08:49:39 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dchygg4vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 08:49:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3425.eurprd03.prod.outlook.com (2603:10a6:208:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 08:49:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6027:42cb:ee75:1c39]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::6027:42cb:ee75:1c39%4]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 08:49:35 +0000
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
X-Inumbo-ID: 4abafc4f-6d3b-11ec-81c0-a30af7de8005
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX0Tx1imWDZfnZFXmPv6wuPQb4zh0hMFpaIdLIC4kbi7RZiF2O7M5f5j3UsClEzLIafCcRDtI0uFue0oX9oGH3sr9uBTS0FpPkDJLFkksAiQ9VGjJwJDT3qJAqLbUQm9KyIE14Uq3PUDcu6ZX12f4hfVE49zv+P/bNhi742605PoYmuSGxaT3LgJIYv3u67zErkR11p5kVmela8/ekk4/eTMYm9rdUl7xzl7BjaVp+KOYdrQR9g53Z8xtnYIshd18mHAAYAy/+TOgwd6HEEqCOWN73p3cZYpBQ+EiVQumYXycVBADBvhwFU3K1j/12+ZhTSD7Xe3fjpCWYt1MWr/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K72TlnpBZerG+sGDNdzO6jMYCE2aDUWBtay64/afNyI=;
 b=h51qvoJ4/MkjwpOQ97538zFPTFVn2dchJoq8A6pH0MU/fZrtvC4wcGvCvyoRuRTTOaMPLVQ6MK6olYNCPUPkWsoOGWK4gl6TnmgepBFN6R8JliWVrfAPMe6QhrgyOBm97Uz87dmBFiegDH/sS/vIF0SDZY9RzWCMQ8EJzvvL7bPwLi/QsbSpit9GJcC/iJ8nSriyxo2DnnSO2D/KVDCj5q0hDJllFg/OitPNXXo4FoFbQuKgYv3paCEH1AEYOq8vGInhq7b8hOJm2w1j41EZrXylYnw7Hgjh/TBcTeGZfbntRbO8nnNuZQJ3r2uudT9LW1YppSqLK1nzLurS4sYtBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K72TlnpBZerG+sGDNdzO6jMYCE2aDUWBtay64/afNyI=;
 b=myOesXPIPyVzWZ4JvtpFFoehZ+b6KcZx2FcKar4pNuTQfEhNAAZoZSb+ucKAXzBC3gZQHMuLY2I00PMb5k5EFG2acVoT8uXCd2rISlHEtMvDdx1Qug6an8pajJ+mZ9qgdooE/S/idr9D1VByNeitAQX+2XfpM1fayA/sYLXBQf/8HjacjrSAqmDqb8HfrNX2/wMXAgU97datf7146rsTxw7YqoFaSCJycFCuor23GMAR6VTaUG1ptbbWnoQc9nU+ZGUjOVUQfq+KMTBd8NcxGxFerx8XmOx3/VFjWAnUitgcUVP4mBfGXyRuOTLkC0hDEhLkkiCwzMqWMv++cHJXIg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
        Dario Faggioli
	<dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] is_system_domain: replace open-coded instances
Thread-Topic: [PATCH v4] is_system_domain: replace open-coded instances
Thread-Index: AQHYAUf/c8i/XyYIMUalffWjV6LCog==
Date: Tue, 4 Jan 2022 08:49:35 +0000
Message-ID: <c5b4687b-120f-d4d1-13eb-ca2e12285552@epam.com>
References: <20211221160444.30890-1-dpsmith@apertussolutions.com>
In-Reply-To: <20211221160444.30890-1-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9cd694e-bbbe-4b5d-20e9-08d9cf5f22a9
x-ms-traffictypediagnostic: AM0PR0302MB3425:EE_
x-microsoft-antispam-prvs: 
 <AM0PR0302MB34251C6C3A072D156B5DFBA7E74A9@AM0PR0302MB3425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:29;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oL5AY+6/dWORF8urL2Sxnxy+HiiZL3qpJARbbp8r3RJ/RDuiAuFG7LZJQAZyzdmhmWPKtpz2i7n1TKrY1L27XPOBFMeF+iy98RLxJKzQh7TYfmnqU0qtQeKziAVxBRC2KJX0VGRviGT3lNkIdtBBVqKa7G8UWNssNKUA/mgH5dwc8ohJWYiUm2B86ZtEALTF+DJbtg+MWLijgYX4thkRB2wjLjmB92NVWWvJV3upVREbcQucaEBEI8/TK6jlsIU9PIIKKeO8ROrXL2F1j70e7d5/ZlxfLByNfUJaJYUfGkMDuR5LPcDIToi4DD02WeGtaPofPZ3rwxd+yTE7zJpuGCyrrBM2BERQCRoRPyuYjXVDeshFvbZ7DFfT562vpTWRih1Gx/3NbzQK8WU+aAtTqLXWEyuweEwOeQWGK/kHG/vyGzCFwZUYDOAmlViJWHHkd17B2XWaCwhYldD1+TIB+cf7IwT+G8+7oSGbESNuS+TgGkBf8rNsoo1FijCt0Jjbpmp3VBTCxDLPhcWV5JW4ir3U6ommD/5oDFtLJslPppP93c/1tV+gae6K27Mbe+n1514VMNlNX7RTLuwG2DIVAkafD9hiyZTx4jvwVFPDoR0A/3jTRZ8C4QFHFKhExSRo+PcoJ6d//vSjTZARqXUJzPlIRdP7QPQYF5t6uXiFQjYP80ojzUjn7/0FxzJVXpSqqgocT4pHV3aUQoFc+rhIV4Dt94ezI4dYlHAfNW5esOnMqV9kdAHXy56p85LYxaa3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(86362001)(8936002)(6506007)(122000001)(53546011)(26005)(64756008)(66476007)(54906003)(31686004)(76116006)(110136005)(91956017)(8676002)(6486002)(66556008)(66446008)(66946007)(6512007)(7416002)(38100700002)(2616005)(36756003)(38070700005)(316002)(83380400001)(4326008)(508600001)(31696002)(71200400001)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmlxaVNJdWNtdDdXK3NLTXBXTzZwUTFoOFR2Mk5pekJPV2lTbkk1U0F0MVZp?=
 =?utf-8?B?RzJhSFRwbmRBRHo0bFRESzVuZFpaRVVoNDRpaXNXNHpRYUhiVjFzYW83QW05?=
 =?utf-8?B?aWpaQ0FuUmtPZ2VTT3d4Q3Q5UXMzQlhDbitCZEYxWTJKRVQxMEhvdUdIYkhX?=
 =?utf-8?B?dndORnNHNDk2dUNJajhnWVdOYnk4OEVuRjZZSi9hNGJPZjhuTVErbnRRNzVl?=
 =?utf-8?B?c1ZmMVBnaGltSW9tNzdQZHdpTVFMekNLYmJyc3IvYlBBRXMvRUJ4SUx6QURv?=
 =?utf-8?B?bjY3Z2VPMWZCOXB6VitoejN4eXc2S0ozWGxmcmRnWkdnM3NQMmhWUzhoL0Zm?=
 =?utf-8?B?enNrakFXYUIxcUJNV2gvZ0JHcXpLNVN6akRQbTlFd0Q0aEw2dFZHSFFscko1?=
 =?utf-8?B?WmJtaDdySXJlbmJCNFF2UE5yUm4xcVV2QVVLYXo5Nk5wSVJhbkU0aHByYXZt?=
 =?utf-8?B?YXNvUkxPVEpWWkd6YVQ0dmZ3UnR0S1FGT05qczhqa2ZPVC9uamUvR1BMVFRT?=
 =?utf-8?B?SXVXOGpTR3lsVE9TMVRGbm14Y1U2MjdNUnd1ZmpjSlN6b2lUbkl5VXJiNkQr?=
 =?utf-8?B?SmloNFFETklrcURWZjE3ZmJKenpLK2k3dWtjVm1XbVkySHU1NVBET0lvdEVv?=
 =?utf-8?B?azdTc2w5UGRWR25Lb3FUYU8yQm1VVlNJeTMzZVdNSmYrUGE5RTErcnRpZ0hp?=
 =?utf-8?B?U1B0ZG9NbjVXVndnZExsdlBqQWFyc3Y5azFJelFQWmhWN1lwNk9yQ3B6djR6?=
 =?utf-8?B?Wm54VFU5UGR6dDZMcGhBSzY4cFp3dHpIeXdaQUphOVl3Z0NWeDJWQW90NDFJ?=
 =?utf-8?B?dkw4VDZJQzZUaHFRZDBTNlRwQ0U5elJubHU0eXNFRTBpa01xajJpUTJBTERG?=
 =?utf-8?B?Qkl2RVQrTDZyd3h6OWtqNVZDUjJlNEY5emw0aEdobzN4WXhDZ0hCUG90Ymd1?=
 =?utf-8?B?SG5tdEtxcGxyVkdheUxjZGN4MWVCUnBhU0w5TVBPMWFSem8rd0R0QVBZT0M2?=
 =?utf-8?B?WDA1U09XU1grREtLbk1Mb3V3VGpiNk1tcXl2WjcxQ2R0dXBaU1VManNZUitO?=
 =?utf-8?B?aGtNdnZZeEd3YVhuZnIxTzlXNi9DN1lrb1lNRk81S2lmTUFxTVd2V2ZyY3Fj?=
 =?utf-8?B?YjJENDJOM2ZTUDltYnNPdWhyYUk3c3B4RzZ4dWtRS1hyQjJycDA5T3RIT3VB?=
 =?utf-8?B?M2xLNCtmRGo0TjUybW9HWEg0VkpYNTZ6VytoaUVMODRqeURXMzBsZTVwdllT?=
 =?utf-8?B?NDhTOWJoSGlmNDE4WXI4c21LYWlmUHAvcEozUnJ0U25PQ3dKV1c3VEh2TUk4?=
 =?utf-8?B?RHh0RHJZclRFNmZYRU5vM1UwMmZuV2NtYlpQelFkbWRYZmR6OERQcVd3dEhr?=
 =?utf-8?B?NnI1bHhEbnVLV3hza0J0ZkdkbEhkYjNvQ0ZYakdMTFQvM3FPUTZNbURjVFVF?=
 =?utf-8?B?VlVoQmwvUWxNTmZtU2JYaEZTeXNWem5ISDhHY0duUnhscTdUZVRnL1N2UlZh?=
 =?utf-8?B?ZjVtSFBQQjRJMUtGdUI3MldEQXlFTWZpMW1JQUh3RCtISUNhVnFwbnlOTFlB?=
 =?utf-8?B?RmJrU3lUa0FnVHVZaEErUUpocXNIeGVjUEgrc0RKbng2Q0xjT1g1OWJlc0Rv?=
 =?utf-8?B?NklOL0NhRUVaMXV5S3p3TTdPZlZDVWhCRFBLeVZNM21VaUZxNm1PeVRyajM1?=
 =?utf-8?B?d0JKdmRyTGtDcjNpSHRRR2NPMjFjY2MzanFZeXdtanZUVmJvL1VtZmRaT3Jj?=
 =?utf-8?B?dHpPYzFKemh0akJ0TEhFU1IwditEM2VGczljcnZtSHpFVHhRQTJlbzZudTNK?=
 =?utf-8?B?U0JXSGI0eTk5eWhEaWp0M0V3bmJlVzlpOE15am11QWgyUWZJa3NzbXBsdUNx?=
 =?utf-8?B?Nlc5R2VJRXVMOEEwOFFCSmVuRmJMVTNpMTRVTnBRY2lIUFVUNk11aUhlemdj?=
 =?utf-8?B?Z05wWWU1anJaeTBXUUdJNk1lRk1nYUhhVXZIcGN1WVZ6OEhvM093eG9hVFhJ?=
 =?utf-8?B?OSsvTWFpRzJVWlc4bjJkVG5qZHpyeFFxaWZDVUFvMUdJWXZ3Ny9oQzk0aEd5?=
 =?utf-8?B?V0pRUkFENDUyWklCdGU5dDVyZ0RGbmJDVUdaWXBMSm1FbTlzSzF6NGpsY1RR?=
 =?utf-8?B?Sm5kK09rSFFnZVpvSnBmajhsdWpvd1R0czFodFc1VDVONnkxV3lWeTNUbzNj?=
 =?utf-8?B?emU0Q3RBNFRoamMwWHY5clZyTVlOZ3NBaTREUEhTRUtIck43NTVHMkROY2J3?=
 =?utf-8?B?SHJDeEV2dnlpTFRBUGd4MGlwU3YzdGFLMWVpTHZoTFpyL1UwajMyajlGWmV2?=
 =?utf-8?B?NkxERkhpdTFpWkNrWlVlVGtPNzdra2ppTXhBL1REQTE3YVBxZWhBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <300C550DA1507A45AD38581146662839@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cd694e-bbbe-4b5d-20e9-08d9cf5f22a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 08:49:35.8735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODB2+Xmo6NxdYynlE0dQ2+ZLjkMOOh86jOgTGgtLxfhD//C0Z5ix9+Fl67A+eMeUNNj+XrG4udrh4Kxl4VSZzz3aJR2jIi+dv88dTzVpiRqdYVN9j/rvZCEq/uLRWEHR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3425
X-Proofpoint-GUID: SlffHdB0_AvZ0BT5ZMi-_YWbYULTUmEN
X-Proofpoint-ORIG-GUID: SlffHdB0_AvZ0BT5ZMi-_YWbYULTUmEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1011 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040057

SGksIERhbmllbCENCg0KT24gMjEuMTIuMjEgMTg6MDQsIERhbmllbCBQLiBTbWl0aCB3cm90ZToN
Cj4gRnJvbTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29t
Pg0KPg0KPiBUaGlzIGlzIGEgc3BsaXQgb3V0IG9mIHRoZSBoeXBlcmxhdW5jaCBkb20wIHNlcmll
cy4NCj4NCj4gVGhlcmUgd2VyZSBzZXZlcmFsIGluc3RhbmNlcyBvZiBvcGVuLWNvZGVkIGRvbWlk
IHJhbmdlIGNoZWNraW5nLiBUaGlzIGNvbW1pdA0KPiByZXBsYWNlcyB0aG9zZSB3aXRoIHRoZSBp
c19zeXN0ZW1fZG9tYWluIG9yIGlzX3N5c3RlbV9kb21pZCBpbmxpbmUgZnVuY3Rpb24uDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdt
YWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0
dXNzb2x1dGlvbnMuY29tPg0KPiBBY2tlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBz
dXNlLmNvbT4NClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUvbWNo
ZWNrL21jZS5jIHwgMiArLQ0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jICAgICAgIHwgMiAr
LQ0KPiAgIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgIHwgMiArLQ0KPiAgIHhlbi9jb21t
b24vZG9tY3RsLmMgICAgICAgICAgIHwgNCArKy0tDQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3Jl
LmMgICAgICAgfCA0ICsrLS0NCj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICB8IDcg
KysrKysrLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jIGIv
eGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMNCj4gaW5kZXggN2Y0MzMzNDNiYy4uNWMxZGYz
OTA3NSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMNCj4gKysr
IGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMNCj4gQEAgLTE1MTgsNyArMTUxOCw3IEBA
IGxvbmcgZG9fbWNhKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21jX3QpIHVfeGVuX21jKQ0K
PiAgICAgICAgICAgICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKG1jX21zcmluamVj
dC0+bWNpbmpfZG9taWQpOw0KPiAgICAgICAgICAgICAgIGlmICggZCA9PSBOVUxMICkNCj4gICAg
ICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICAgICAgaWYgKCBtY19tc3JpbmplY3QtPm1jaW5q
X2RvbWlkID49IERPTUlEX0ZJUlNUX1JFU0VSVkVEICkNCj4gKyAgICAgICAgICAgICAgICBpZiAo
IGlzX3N5c3RlbV9kb21pZChtY19tc3JpbmplY3QtPm1jaW5qX2RvbWlkKSApDQo+ICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4geDg2X21jZXJyKCJkb19tY2EgaW5qZWN0OiBpbmNvbXBhdGli
bGUgZmxhZyAiDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJNQ19N
U1JJTkpfRl9HUEFERFIgd2l0aCBkb21haW4gJWQiLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtRUlOVkFMLCBkb21pZCk7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvY3B1L3ZwbXUuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jDQo+IGluZGV4IDhlYzQ1
NDdiZWQuLmM2YmZhNWEwMGUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5j
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jDQo+IEBAIC0xODgsNyArMTg4LDcgQEAg
dm9pZCB2cG11X2RvX2ludGVycnVwdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4gICAg
ICAgICogaW4gWEVOUE1VX01PREVfQUxMLCBmb3IgZXZlcnlvbmUuDQo+ICAgICAgICAqLw0KPiAg
ICAgICBpZiAoICh2cG11X21vZGUgJiBYRU5QTVVfTU9ERV9BTEwpIHx8DQo+IC0gICAgICAgICAo
c2FtcGxlZC0+ZG9tYWluLT5kb21haW5faWQgPj0gRE9NSURfRklSU1RfUkVTRVJWRUQpICkNCj4g
KyAgICAgICAgIGlzX3N5c3RlbV9kb21haW4oc2FtcGxlZC0+ZG9tYWluKSApDQo+ICAgICAgIHsN
Cj4gICAgICAgICAgIHNhbXBsaW5nID0gY2hvb3NlX2h3ZG9tX3ZjcHUoKTsNCj4gICAgICAgICAg
IGlmICggIXNhbXBsaW5nICkNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94
ZW4vY29tbW9uL2RvbWFpbi5jDQo+IGluZGV4IDA5M2JiNDQwM2YuLjM0N2NjMDczYWEgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4u
Yw0KPiBAQCAtNTgzLDcgKzU4Myw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9t
aWRfdCBkb21pZCwNCj4gICAgICAgLyogU29ydCBvdXQgb3VyIGlkZWEgb2YgaXNfaGFyZHdhcmVf
ZG9tYWluKCkuICovDQo+ICAgICAgIGlmICggZG9taWQgPT0gMCB8fCBkb21pZCA9PSBoYXJkd2Fy
ZV9kb21pZCApDQo+ICAgICAgIHsNCj4gLSAgICAgICAgaWYgKCBoYXJkd2FyZV9kb21pZCA8IDAg
fHwgaGFyZHdhcmVfZG9taWQgPj0gRE9NSURfRklSU1RfUkVTRVJWRUQgKQ0KPiArICAgICAgICBp
ZiAoIGhhcmR3YXJlX2RvbWlkIDwgMCB8fCBpc19zeXN0ZW1fZG9taWQoaGFyZHdhcmVfZG9taWQp
ICkNCj4gICAgICAgICAgICAgICBwYW5pYygiVGhlIHZhbHVlIG9mIGhhcmR3YXJlX2RvbSBtdXN0
IGJlIGEgdmFsaWQgZG9tYWluIElEXG4iKTsNCj4gICANCj4gICAgICAgICAgIG9sZF9od2RvbSA9
IGhhcmR3YXJlX2RvbWFpbjsNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94
ZW4vY29tbW9uL2RvbWN0bC5jDQo+IGluZGV4IDg3OWEyYWRjYmUuLmEzYWQxZjYyYjYgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwu
Yw0KPiBAQCAtNTIsNyArNTIsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpc19mcmVlX2RvbWlkKGRv
bWlkX3QgZG9tKQ0KPiAgIHsNCj4gICAgICAgc3RydWN0IGRvbWFpbiAqZDsNCj4gICANCj4gLSAg
ICBpZiAoIGRvbSA+PSBET01JRF9GSVJTVF9SRVNFUlZFRCApDQo+ICsgICAgaWYgKCBpc19zeXN0
ZW1fZG9taWQoZG9tKSApDQo+ICAgICAgICAgICByZXR1cm4gMDsNCj4gICANCj4gICAgICAgaWYg
KCAoZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pKSA9PSBOVUxMICkNCj4gQEAgLTUzNiw3
ICs1MzYsNyBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21j
dGxfdCkgdV9kb21jdGwpDQo+ICAgICAgICAgICBpZiAoICFkICkNCj4gICAgICAgICAgIHsNCj4g
ICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPiAtICAgICAgICAgICAgaWYgKCBvcC0+ZG9t
YWluID49IERPTUlEX0ZJUlNUX1JFU0VSVkVEICkNCj4gKyAgICAgICAgICAgIGlmICggaXNfc3lz
dGVtX2RvbWlkKG9wLT5kb21haW4pICkNCj4gICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAg
DQo+ICAgICAgICAgICAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOw0KPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2Nv
cmUuYw0KPiBpbmRleCA4ZjRiMWNhMTBkLi42ZWE4YmNmNjJmIDEwMDY0NA0KPiAtLS0gYS94ZW4v
Y29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiBA
QCAtODIxLDcgKzgyMSw3IEBAIGludCBzY2hlZF9pbml0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBpbnQgcG9vbGlkKQ0KPiAgICAgICBpbnQgcmV0Ow0KPiAgIA0KPiAgICAgICBB
U1NFUlQoZC0+Y3B1cG9vbCA9PSBOVUxMKTsNCj4gLSAgICBBU1NFUlQoZC0+ZG9tYWluX2lkIDwg
RE9NSURfRklSU1RfUkVTRVJWRUQpOw0KPiArICAgIEFTU0VSVCghaXNfc3lzdGVtX2RvbWFpbihk
KSk7DQo+ICAgDQo+ICAgICAgIGlmICggKHJldCA9IGNwdXBvb2xfYWRkX2RvbWFpbihkLCBwb29s
aWQpKSApDQo+ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiBAQCAtODQ1LDcgKzg0NSw3IEBAIGlu
dCBzY2hlZF9pbml0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgcG9vbGlk
KQ0KPiAgIA0KPiAgIHZvaWQgc2NoZWRfZGVzdHJveV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkN
Cj4gICB7DQo+IC0gICAgQVNTRVJUKGQtPmRvbWFpbl9pZCA8IERPTUlEX0ZJUlNUX1JFU0VSVkVE
KTsNCj4gKyAgICBBU1NFUlQoIWlzX3N5c3RlbV9kb21haW4oZCkpOw0KPiAgIA0KPiAgICAgICBp
ZiAoIGQtPmNwdXBvb2wgKQ0KPiAgICAgICB7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IGluZGV4IDI4MTQ2ZWU0MDQu
LmNkNTc1ZDAxY2YgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IEBAIC02MTMsOSArNjEzLDE0IEBAIGV4dGVy
biBzdHJ1Y3QgdmNwdSAqaWRsZV92Y3B1W05SX0NQVVNdOw0KPiAgICNkZWZpbmUgaXNfaWRsZV9k
b21haW4oZCkgKChkKS0+ZG9tYWluX2lkID09IERPTUlEX0lETEUpDQo+ICAgI2RlZmluZSBpc19p
ZGxlX3ZjcHUodikgICAoaXNfaWRsZV9kb21haW4oKHYpLT5kb21haW4pKQ0KPiAgIA0KPiArc3Rh
dGljIGlubGluZSBib29sIGlzX3N5c3RlbV9kb21pZChkb21pZF90IGlkKQ0KPiArew0KPiArICAg
IHJldHVybiBpZCA+PSBET01JRF9GSVJTVF9SRVNFUlZFRDsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBpbmxpbmUgYm9vbCBpc19zeXN0ZW1fZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+
ICAgew0KPiAtICAgIHJldHVybiBkLT5kb21haW5faWQgPj0gRE9NSURfRklSU1RfUkVTRVJWRUQ7
DQo+ICsgICAgcmV0dXJuIGlzX3N5c3RlbV9kb21pZChkLT5kb21haW5faWQpOw0KPiAgIH0NCj4g
ICANCj4gICAjZGVmaW5lIERPTUFJTl9ERVNUUk9ZRUQgKDF1IDw8IDMxKSAvKiBhc3N1bWVzIGF0
b21pY190IGlzID49IDMyIGJpdHMgKi8NCg==

