Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644937B7E6B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 13:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612510.952447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0HG-00089y-Gc; Wed, 04 Oct 2023 11:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612510.952447; Wed, 04 Oct 2023 11:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0HG-00087l-Dr; Wed, 04 Oct 2023 11:42:54 +0000
Received: by outflank-mailman (input) for mailman id 612510;
 Wed, 04 Oct 2023 11:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lT9A=FS=epam.com=prvs=4641b3489e=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qo0HF-00087d-48
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 11:42:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24615c7d-62ab-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 13:42:49 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 394BZJB1030802; Wed, 4 Oct 2023 11:42:37 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3th7ac00n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:42:36 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DU2PR03MB7847.eurprd03.prod.outlook.com (2603:10a6:10:2d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 11:42:33 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::ac2a:7470:c441:365c]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::ac2a:7470:c441:365c%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 11:42:32 +0000
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
X-Inumbo-ID: 24615c7d-62ab-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv/FKPOjZIe+qJKcHRbTJtxCON70HWKgsd9Xf9mfRAa6biDrtpUQKrRK4IivfKVSpr7WEDhkXfQ9V5Y4Sg10H6kAhJ+TNQGnDN0BJPfLHrDwR6M2s3G6eOwi7OEvHHauHJhO5AuRA2fbsD3AZtv4pxe9U3i+9N1xzoCcwy/pxQDFctPpFvIaDE7iKc0Lj4oA9tOFxy2sp+DaGvPKfiCvlq9nOiELsdSyKuUMEQ8EoRk+eauzZqi9blkFIftIWsMKfCEdsn2lOn8K/DqinXhMc1d+36ZrOTl+VeTuMYoLg/RZbLKMFw53Nlb0NZCWgcoaB2nC+TzZdpG9OurmkO+wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XizltJT/Q7SMTKvLAWgE+cyvFXW0KjW65Ifj+u3b0bI=;
 b=FEpB1FLc3RW67lZBh5b7XOd1bx40rSqANNcXa78r8R0iCJfRnp8018o6YKK9Yu+IIvc2sg55jeb67yOgN9zXhiDDldBJEdJCal5tY7llBhQ6KuFPahE6x8AllTXf37Jeg4YRhnn0uOPL0vrVhivUFcUHpxRzaghLcID015yhuUucCg2Rfq3kIKXxXLc+kloNjPW8SNep8xwbnMKzx6V1uo3AcTI/n++aV0pT1s4eYAmSoyLEv31zl3W4qe0OQzXmnH8WIMgfD1GwLi7iAMmy3Oalwdg1MQzL18eg+sZL3cQ+gz++WXxaItpBK4QSJM4SQj+h5iIN4gUxa4C9FuQKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XizltJT/Q7SMTKvLAWgE+cyvFXW0KjW65Ifj+u3b0bI=;
 b=HWkbY+RL2Eboh+JifUhpRhAJ2xz+5QQAPq1P5jgFDTgNGKWGE0zbX/TDuYlxAjs/GK10YAHfGKmeb8+h+d5IZTO5HsafIBiZkyUXTVt58S8qLCFhIwPNkVvoa4tJfVYZTa5iwp6ZxniAfrxIDcNHbD7XtomuoD5+i729BrDxsbs9oBoyyjxwASHkRXZ+OMsXxNvVwEnODESEcoIJD8sUL/VkPkDIu/JL+9S3i3+dSZokyfYWKUJq8AKg6wksXGfgOecifRClmkYZfs6OYTNsmm2ZDn8WPLiJmbQ6YI6g7omZI6cZzXeFmVChsSFIS6mtDVXN06uxmLb4sY+o9LgB2g==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Elliott Mitchell <ehem+xen@m5p.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Thread-Topic: Issue with shared information page on Xen/ARM 4.17
Thread-Index: AQHZ9dNZbcd5CVq6q0CaRs8d4dlf/7A4cSiAgADYhwCAAC0hgIAADTmA
Date: Wed, 4 Oct 2023 11:42:32 +0000
Message-ID: <aaf14d06-4e29-4de0-8e56-ff200f21b692@epam.com>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger> <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
In-Reply-To: <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|DU2PR03MB7847:EE_
x-ms-office365-filtering-correlation-id: 4b77a39c-1e06-45ca-8f5b-08dbc4ceff3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6zIEPYPRAJbZf2x8it1GTxl8WV3yXQ7XNwvdbi/tNw7T+gLuNPxGVaw+EgT5LF/jgSNFxPS3ZVSfhysKDmftKwPYASlRhS7YPZouMh79A5Y1cjr7HicpTNBcLL+lXhkl3hOuZs9OWuK8N6bE2fRo0Vbtz8AyhJVribICK5SR80SRA4ZBhG27zJqHkF8ETVqhR3lE0Fj22x1yw/neSiFdMEyNGJl6CWKJoN25vbBEwn2Dhp5157dT3kKv45xZOPybdY72Cmc3wTCqdai2ygvfMH6qzHUvpKY1tF41wgQf6NXOsvt3NdctyPr6y57lPNUjUcyw3nQiLrqxvYX3Zc3Ys2EIu17yTa/XxQimkqjsqkslHaVETCdQUrZc/CkDN57S00FhCPBvtLXMeVWrj4wYmJy5n+WWuznkKwBs/fV5Iaz2mOccMncDdDlf7JA/wl4ErKiWoCvSiwFbbM593Xzu9xxzerqhKhhA8w/N5SRDMXPE5Bh8MzS4vePr4YkUhmxAXxnlbt732sO6b0D6KH5cJvGLfcnVAgn+V+7/vxFKPWD6J3pIpfeuDM7Ua0BzVfT95pPb8TKnx3eSmzE6CqkW+yqaXOAxigAVGDtLPDh5RGpIRrMHvujQgEGIrVi5nXjGH3sED8WKtlLPwelMBnxTcA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(6506007)(71200400001)(53546011)(6486002)(478600001)(966005)(122000001)(31696002)(86362001)(38100700002)(38070700005)(41300700001)(2616005)(83380400001)(107886003)(6512007)(26005)(2906002)(36756003)(66556008)(66476007)(66446008)(5660300002)(316002)(91956017)(76116006)(66946007)(110136005)(54906003)(8936002)(8676002)(64756008)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T3FaclkzUlNFUXVpdmlYMktWV2k4VEJaUzZON3U2KzE1bElUM2psb3dYZUdp?=
 =?utf-8?B?OVJHd2J5WXorTWw1aG04cEVDN05vWWlJWWhBaHQvUHZvemtsMjhXMXJ3SGEr?=
 =?utf-8?B?dEt3ZFRMYTZXdUlHazEvR3VZNVNZUjZMUGl4R0hSdmRVQVhWR08rTlZCOCti?=
 =?utf-8?B?ZHBad1pOMHJ5ZXlTRk51cmN1ZnNEcVlkVFo2b1BVTVFJZlB2OGY3WUxNNFda?=
 =?utf-8?B?bGJnSmdMTnI2SUxmRUZzQmtFQ0lwYWVOWkdZTU5kY1k5Lzc0M2hsaFBpWDFR?=
 =?utf-8?B?Z1lUbHh1RnFSTk9CYkVZK215eDhBVFN3TS9LL1BhR2dLVndWd3diYm1qZE50?=
 =?utf-8?B?SUV0TjFNZk1BNEUwVnJva084a1ozSHBtd1hnVlBTQm13bTg0djdLSXJhelRD?=
 =?utf-8?B?QUZIcUc2TmczQzh6N3hmdWphWkM3UXBRVzlvVmhhS3NuQnZaRnZtZDFBWGEx?=
 =?utf-8?B?TkRFZFFxVTc4YmpOY3RCSjQ5ZzFjQmJEcEduY2cyOFNRVVpDMlpTMExtU3Nx?=
 =?utf-8?B?V3YzMEZXL2dEcnJDcWRmTnRpMW1JWEVzUnNsTFNiYkpqVU5oVFlOeWxZaUk1?=
 =?utf-8?B?V0hINmplemJNTEVzNW05Mm0vQkJWajBvSzJhNGpDZ25PRmhjYkR1UEpNUUlK?=
 =?utf-8?B?NzV6WVZTNWZwNVVUTXk4akZoTENHV0dmdmRNY1RCeEJCY1lTVEVUTS9keHJw?=
 =?utf-8?B?bmxZc0Y0ajE2ams1WndBNGgwZnY1WkV1Z0pGTXJwckNHYXhES3dqUTZ5bUs5?=
 =?utf-8?B?aUU2akt4dHpuMmZ6ZGd6RkkxWGR1MkE3NDBUOWdHU3VjZGExL0Z1UGNZRnVI?=
 =?utf-8?B?eWdoa3FRdTYwMjFmTTVLQ3NWSnZ2VVFtR012ck02ZCtLd1dqcTBPSlZkYlJ4?=
 =?utf-8?B?SG5PTnRqemdRQ3F2OHB5azg1K3A4TEYwbG8rWTlra1B2b3ZoK2srb0VJRHF5?=
 =?utf-8?B?KzYvK0NTZ09JWkFWM3JDNnQ4NWVLVzErRHQyYkRRYU05a0ZCeGhIRnQ3UXl4?=
 =?utf-8?B?ZDJKVnBuNVdYdHQrQmtrTEt2YlpPMUwvdUdLaE4wUjlmd1JkN0l6VUFhbXBU?=
 =?utf-8?B?UCtIcmZKaDlFVUswUTR5Sm0yTHJ3c0dIaTkvT0UwZXU3aWhyVWs2LytqeEdh?=
 =?utf-8?B?aGRaN0REbUFGa2lHajhTRm1tYWw4MGpIbDROTzMzT3dhV05wb0tuTFQxaytU?=
 =?utf-8?B?VnpJL1cyM3VleDN0cjhnSDliOGtFS29ROFhYemJSMldMaG9UbzdmY0dtbFZi?=
 =?utf-8?B?enA3YVVwQVZxYUY0T01JaE1VUVAvanBPVDArOUhkc2JBQkxBbW0xeVk1SVVL?=
 =?utf-8?B?QUFWeGJHcWVhb1RkK3huS2ZsUlZCckhMNkxpRFdINVBLZ1FQbGZmbkxPVnc5?=
 =?utf-8?B?RHI5UnRFRUxRYkQreXZ3MGUzcSswcGZQZzBYazVRWldCbTFzME1uVVhBbjdF?=
 =?utf-8?B?ZjRmU1g0WU9xZFhLNERnSnIyZUh0em9GaG9vVXV6UncrUm5XTTRUMEJoeTdB?=
 =?utf-8?B?Ky9lcjRrOW5oS0hRM2U2M0pGYmxtMDRNWlhRWDY0OUY4bXN1Mnl5cVFmQ0ph?=
 =?utf-8?B?MHJjM0lwYVNmSERFckUwWENPVjZDcWNvbjluRTNlWXAvdnNqNThKYWkxcERz?=
 =?utf-8?B?Tnk3U29sYjZQbVVoLzU2VDVSdnE2dXdYK1FZc3RhYWF4dEQwaEI1U2pqZEJ0?=
 =?utf-8?B?d2dNdStpZzlNcGxpVTdWYzNPeklEbXc5bC9PTzhJN3FJejJJSzNFUmhHSzdy?=
 =?utf-8?B?cmJMT2Q3bXdSc25kT0JIcFhxNlJOMDJiRVhYMzdWc3JOa3NLZTU2MTN6RVla?=
 =?utf-8?B?UTQ0TmdLRXhMczVnaDRaVDdVWGFHWTBBeXowN3ZqOXZrdTlxVW1VT243R29P?=
 =?utf-8?B?Umw2ZU5oR3FiajljeGRMMFlyRXJ5NytLdXFJc2tFaGNBVm1QQnVocW8zQmcw?=
 =?utf-8?B?NkZTWEZjOWRSVHVOQ3R5aDFMNERyUDZrNk5jVzA2WGY2VXEzTnVqY09KdVdz?=
 =?utf-8?B?ZFhQcEJDN3VqV1dma1VtdmJMejVBK1FrN3pTMStCODBjUEw0UzNaTHJxS0JE?=
 =?utf-8?B?SVVwaDZURitLK3o0VkkzS1FIWDdLTEF2VDNVTytaLzZTRlBLeFdXQWx4Z3Iy?=
 =?utf-8?B?all4aDJtZDh2UGZSME1KdG00SUFuUG5mSmIyY2V4aWR3QXhwNjBZM1BnUDRl?=
 =?utf-8?Q?Mjhv89XCgTxLz0jjLkVvxek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6231377FF0D61448FBA841ECD649BD0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b77a39c-1e06-45ca-8f5b-08dbc4ceff3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 11:42:32.7388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+ZXpdpKXzFs7G97v4m+lyD/F1nvSTQX2gW1N7URas3nXxigPLDpRUZdJ1nGPUUgNOMFiyWLepJ7vTTlBY9kgFvBRpp5EBlBoPHJeL7KTMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7847
X-Proofpoint-GUID: 40d-QS-ot5Uh8MiwQULG0y3HO25qFJhR
X-Proofpoint-ORIG-GUID: 40d-QS-ot5Uh8MiwQULG0y3HO25qFJhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=859
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040084

DQoNCk9uIDA0LjEwLjIzIDEzOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQoNCkhlbGxvIGFsbC4N
Cg0KPiBIaSBSb2dlciwNCj4gDQo+IE9uIDA0LzEwLzIwMjMgMDk6MTMsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6DQo+PiBPbiBUdWUsIE9jdCAwMywgMjAyMyBhdCAxMjoxODozNVBNIC0wNzAwLCBF
bGxpb3R0IE1pdGNoZWxsIHdyb3RlOg0KPj4+IE9uIFR1ZSwgT2N0IDAzLCAyMDIzIGF0IDEwOjI2
OjI4QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIFRodSwgU2VwIDI4
LCAyMDIzIGF0IDA3OjQ5OjE4UE0gLTA3MDAsIEVsbGlvdHQgTWl0Y2hlbGwgd3JvdGU6DQo+Pj4+
PiBJJ20gdHJ5aW5nIHRvIGdldCBGcmVlQlNEL0FSTSBvcGVyYXRpb25hbCBvbiBYZW4vQVJNLsKg
IEN1cnJlbnQgDQo+Pj4+PiBpc3N1ZSBpcw0KPj4+Pj4gdGhlIGNoYW5nZXMgd2l0aCB0aGUgaGFu
ZGxpbmcgb2YgdGhlIHNoYXJlZCBpbmZvcm1hdGlvbiBwYWdlIGFwcGVhciB0bw0KPj4+Pj4gaGF2
ZSBicm9rZW4gdGhpbmdzIGZvciBtZS4NCj4+Pj4+DQo+Pj4+PiBXaXRoIGEgcHJlLTQuMTcgYnVp
bGQgb2YgWGVuL0FSTSB0aGluZ3Mgd29ya2VkIGZpbmUuwqAgWWV0IHdpdGggYSBidWlsZA0KPj4+
Pj4gb2YgdGhlIDQuMTcgcmVsZWFzZSwgbWFwcGluZyB0aGUgc2hhcmVkIGluZm9ybWF0aW9uIHBh
Z2UgZG9lc24ndCB3b3JrLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGR1ZSB0byA3MTMyMDk0NmQ1ZWRm
IEFGQUlDVC4NCj4+Pg0KPj4+IFllcy7CoCBXaGlsZSB0aGUgLUVCVVNZIGxpbmUgbWF5IGJlIHRo
ZSBvbmUgdHJpZ2dlcmluZywgSSdtIHVuc3VyZSB3aHkuDQo+Pj4gVGhpcyBzZWVtcyBhIGZhaXJs
eSByZWFzb25hYmxlIGNoYW5nZSwgc28gSSBoYWQgbm8gaW50ZW50aW9uIG9mIGFza2luZw0KPj4+
IGZvciBhIHJldmVydCAod2hpY2ggbGlrZWx5IHdvdWxkIGhhdmUgYmVlbiByZWplY3RlZCkuwqAg
VGhlcmUgaXMgYWxzbyBhDQo+Pj4gcmVhbCBwb3NzaWJpbGl0eSB0aGUgLUVCVVNZIGNvbWVzIGZy
b20gZWxzZXdoZXJlLsKgIENvdWxkIGFsc28gYmUNCj4+PiA3MTMyMDk0NmQ1ZWRmIGNhdXNlZCBh
IGJ1ZyBlbHNld2hlcmUgdG8gYmUgZXhwb3NlZC4NCj4+DQo+PiBBIGdvb2Qgd2F5IHRvIGtub3cg
d291bGQgYmUgdG8gYXR0ZW1wdCB0byByZXZlcnQgNzEzMjA5NDZkNWVkZiBhbmQgc2VlDQo+PiBp
ZiB0aGF0IGZpeGVzIHlvdXIgaXNzdWUuDQo+Pg0KPj4gQWx0ZXJuYXRpdmVseSB5b3UgY2FuIHRy
eSAob3Igc2ltaWxhcik6DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIv
eGVuL2FyY2gvYXJtL21tLmMNCj4+IGluZGV4IDZjY2ZmZWFlYTU3ZC4uMTA1ZWYzZmFlY2ZkIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9t
bS5jDQo+PiBAQCAtMTQyNCw2ICsxNDI0LDggQEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9v
bmUoDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2Vfc2V0X3hlbmhl
YXBfZ2ZuKG1mbl90b19wYWdlKG1mbiksIGdmbik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoIiV1IGFscmVhZHkgbWFwcGVkXG4iLCBzcGFjZSk7
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIE1hbmRhdGUgdGhlIGNhbGxlciB0byBmaXJzdCB1bm1hcCB0aGUgcGFnZSBi
ZWZvcmUgDQo+PiBtYXBwaW5nIGl0DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
YWdhaW4uIFRoaXMgaXMgdG8gcHJldmVudCBYZW4gY3JlYXRpbmcgYW4gdW53YW50ZWQgDQo+PiBo
b2xlIGluDQo+PiBAQCAtMTQzMiw2ICsxNDM0LDcgQEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21h
cF9vbmUoDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdG8gdW5tYXAgaXQgYWZ0
ZXJ3YXJkcy4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJjID0gLUVCVVNZOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBwMm1fd3JpdGVfdW5sb2NrKHAybSk7DQo+PiDCoMKgwqDCoMKg
IH0NCj4+DQo+Pj4+PiBJJ20gdXNpbmcgVGlhbm9jb3JlIGFzIHRoZSBmaXJzdCBzdGFnZSBsb2Fk
ZXIuwqAgVGhpcyBjb250aW51ZXMgdG8gd29yaw0KPj4+Pj4gZmluZS7CoCBUaGUgYnVpbGQgaXMg
dXNpbmcgdGFnICJlZGsyLXN0YWJsZTIwMjIxMSIsIGNvbW1pdCBmZmY2ZDgxMjcwLg0KPj4+Pj4g
V2hpbGUgVGlhbm9jb3JlIGRvZXMgbWFwIHRoZSBzaGFyZWQgaW5mb3JtYXRpb24gcGFnZSwgbXkg
cmVhZGluZyBvZiANCj4+Pj4+IHRoZWlyDQo+Pj4+PiBzb3VyY2UgaXMgdGhhdCBpdCBwcm9wZXJs
eSB1bm1hcHMgdGhlIHBhZ2UgYW5kIHRoZXJlZm9yZSBzaG91bGRuJ3QgDQo+Pj4+PiBjYXVzZQ0K
Pj4+Pj4gdHJvdWJsZS4NCj4+Pj4+DQo+Pj4+PiBOb3RlcyBvbiB0aGUgYWN0dWFsIGNhbGwgaXMg
Z3BmbiB3YXMgMHgwMDAwMDAwMDAwMDQwMDcyLsKgIFRoaXMgaXMgDQo+Pj4+PiBvdXRzaWRlDQo+
Pj4+PiB0aGUgcmVjb21tZW5kZWQgYWRkcmVzcyByYW5nZSwgYnV0IG15IHVuZGVyc3RhbmRpbmcg
aXMgdGhpcyBpcyANCj4+Pj4+IHN1cHBvc2VkDQo+Pj4+PiB0byBiZSBva2F5Lg0KPj4+Pj4NCj4+
Pj4+IFRoZSByZXR1cm4gY29kZSBpcyAtMTYsIHdoaWNoIGlzIEVCVVNZLg0KPj4+Pj4NCj4+Pj4+
IElkZWFzPw0KPj4+Pg0KPj4+PiBJIHRoaW5rIHRoZSBpc3N1ZSBpcyB0aGF0IHlvdSBhcmUgbWFw
cGluZyB0aGUgc2hhcmVkIGluZm8gcGFnZSBvdmVyIGENCj4+Pj4gZ3Vlc3QgUkFNIHBhZ2UsIGFu
ZCBpbiBvcmRlciB0byBkbyB0aGF0IHlvdSB3b3VsZCBmaXN0IG5lZWQgdG8gY3JlYXRlDQo+Pj4+
IGEgaG9sZSBhbmQgdGhlbiBtYXAgdGhlIHNoYXJlZCBpbmZvIHBhZ2UuwqAgSU9XOiB0aGUgaXNz
dWUgaXMgbm90IHdpdGgNCj4+Pj4gZWRrMiBub3QgaGF2aW5nIHVubWFwcGVkIHRoZSBwYWdlLCBi
dXQgd2l0aCBGcmVlQlNEIHRyeWluZyB0byBtYXAgdGhlDQo+Pj4+IHNoYXJlZF9pbmZvIG92ZXIg
YSBSQU0gcGFnZSBpbnN0ZWFkIG9mIGEgaG9sZSBpbiB0aGUgcDJtLsKgIHg4Ng0KPj4+PiBiZWhh
dmlvciBpcyBkaWZmZXJlbnQgaGVyZSwgYW5kIGRvZXMgYWxsb3cgbWFwcGluZyB0aGUgc2hhcmVk
X2luZm8NCj4+Pj4gcGFnZSBvdmVyIGEgUkFNIGdmbiAoYnkgZmlyc3QgcmVtb3ZpbmcgdGhlIGJh
Y2tpbmcgUkFNIHBhZ2Ugb24gdGhlDQo+Pj4+IGdmbikuDQo+Pj4NCj4+PiBBbiBpbnRlcmVzdGlu
ZyB0aG91Z2h0LsKgIEkgdGhvdWdodCBJJ2QgdHJpZWQgdGhpcywgYnV0IHNpbmNlIEkgZGlkbid0
IA0KPj4+IHNlZQ0KPj4+IHN1Y2ggaW4gbXkgZXhwZXJpbWVudHMgbGlzdC7CoCBXaGF0IEkgaGFk
IHRyaWVkIHdhcyByZW1vdmluZyBhbGwgdGhlIA0KPj4+IHBhZ2VzDQo+Pj4gaW4gdGhlIHN1Z2dl
c3RlZCBtYXBwaW5nIHJhbmdlLsKgIFlldCB0aGlzIGZhaWxlZC4NCj4+DQo+PiBZZWFoLCBJIHdl
bnQgdG9vIGZhc3QgYW5kIGRpZG4ndCByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSwgaXQgaXMgbm90
DQo+PiBjaGVja2luZyB0aGF0IHRoZSBwcm92aWRlZCBnZm4gaXMgYWxyZWFkeSBwb3B1bGF0ZWQs
IGJ1dCB3aGV0aGVyIHRoZQ0KPj4gbWZuIGludGVuZGVkIHRvIGJlIG1hcHBlZCBpcyBhbHJlYWR5
IG1hcHBlZCBhdCBhIGRpZmZlcmVudCBsb2NhdGlvbi4NCj4+DQo+Pj4gU2luY2UgdGhpcyBzZWVt
ZWQgcmVhc29uYWJsZSwgSSd2ZSBub3cgdHJpZWQgYW5kIGZvdW5kIGl0IGZhaWxzLsKgIFRoZQ0K
Pj4+IFhFTk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwIGNhbGwgcmV0dXJucyAwLg0KPj4NCj4+IFhF
Tk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwIHJldHVybmluZyAwIGlzIGZpbmUsIGJ1dCBpdCBzZWVt
cyB0byBtZQ0KPj4gbGlrZSBlZGsyIGhhc24ndCB1bm1hcHBlZCB0aGUgc2hhcmVkX2luZm8gcGFn
ZS7CoCBUaGUgT1MgaGFzIG5vIGlkZWENCj4+IGF0IHdoaWNoIHBvc2l0aW9uIHRoZSBzaGFyZWRf
aW5mbyBwYWdlIGlzIGN1cnJlbnRseSBtYXBwZWQsIGFuZCBoZW5jZQ0KPj4gY2FuJ3QgZG8gYW55
dGhpbmcgdG8gYXR0ZW1wdCB0byB1bm1hcCBpdCBpbiBvcmRlciB0byBjb3ZlciB1cCBmb3INCj4+
IGJ1Z2d5IGZpcm13YXJlLg0KPj4NCj4+IGVkazIgc2hvdWxkIGJlIHRoZSBlbnRpdHkgdG8gaXNz
dWUgdGhlIFhFTk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwDQo+PiBhZ2FpbnN0IHRoZSBnZm4gd2hl
cmUgaXQgaGFzIHRoZSBzaGFyZWRfaW5mbyBwYWdlIG1hcHBlZC7CoCBMaWtlbHkNCj4+IG5lZWRz
IHRvIGJlIGRvbmUgYXMgcGFydCBvZiBFeGl0Qm9vdFNlcnZpY2VzKCkgbWV0aG9kLg0KPj4NCj4+
IEZXSVcsIDcxMzIwOTQ2ZDVlZGYgaXMgYW4gQUJJIGNoYW5nZSwgYW5kIGFzIGRlc2lyYWJsZSBh
cyBzdWNoDQo+PiBiZWhhdmlvciBtaWdodCBiZSwgYSBuZXcgaHlwZXJjYWxsIHNob3VsZCBoYXZl
IGludHJvZHVjZWQgdGhhdCBoYWQgdGhlDQo+PiBiZWhhdmlvciB0aGF0IHRoZSBjaGFuZ2UgaW50
ZW5kZWQgdG8gcmV0cm9maXQgaW50bw0KPj4gWEVOTUVNX2FkZF90b19waHlzbWFwLg0KPiBJIGNh
biBzZWUgaG93IHlvdSB0aGluayB0aGlzIGlzIGFuIEFCSSBjaGFuZ2UgYnV0IHRoZSBwcmV2aW91
cyBiZWhhdmlvciANCj4gd2FzIGluY29ycmVjdC4gQmVmb3JlIHRoaXMgcGF0Y2gsIG9uIEFybSwg
d2Ugd291bGQgYWxsb3cgdGhlIHNoYXJlZCBwYWdlIA0KPiB0byBiZSBtYXBwZWQgdHdpY2UuIEFz
IHdlIGRvbid0IGtub3cgd2hlcmUgdGhlIGZpcm13YXJlIGhhZCBtYXBwZWQgaXQgDQo+IHRoaXMg
Y291bGQgcmVzdWx0IHRvIHJhbmRvbSBjb3JydXB0aW9uLg0KPiANCj4gTm93LCB3ZSBjb3VsZCBz
dXJlbHkgZGVjaWRlIHRvIHJlbW92ZSB0aGUgcGFnZSBhcyB4ODYgZGlkLiBCdXQgdGhpcyANCj4g
Y291bGQgbGVhdmUgYSBob2xlIGluIHRoZSBSQU0uIEFzIHRoZSBPUyB3b3VsZCBub3Qga25vdyB3
aGVyZSB0aGUgaG9sZSANCj4gaXMsIHRoaXMgY291bGQgbGVhZCB0byBwYWdlIGZhdWx0IHJhbmRv
bWx5IGR1cmluZyBydW50aW1lLg0KDQoNCisxLg0KDQpJbiBhZGRpdGlvbiB0byB3aGF0IEp1bGll
biBoYXMgYWxyZWFkeSBzYWlkLCBJIHdvdWxkIGxpa2UgdG8gc2F5IHRoZSANCnNhbWUgaXNzdWUg
d2FzIGZhY2VkIGR1ZSB0byBVLUJvb3QgKHJ1bm5pbmcgYXMgYSBwYXJ0IG9mIFhlbiBndWVzdCAN
CmJlZm9yZSBPUykgZGlkbid0IHBlcmZvcm0gYSBjbGVhbnVwIGJlZm9yZSBqdW1waW5nIHRvIE9T
LiBUaGlzIGlzIA0KYWxyZWFkeSBmaXhlZCB0byBmb2xsb3cgdGhlIGN1cnJlbnQgYmVoYXZpb3Iu
IEkgZGlkbid0IGZpbmQgDQpjb3JyZXNwb25kaW5nIFUtQm9vdCBtYWlsIHRocmVhZCwgYnV0IGNh
biBwb2ludCB0byBhbHJlYWR5IHVwc3RyZWFtZWQgDQpjb21taXQgaW4gdGhlIG1haW4gcmVwby4N
Cg0KaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvY29tbWl0LzAwMDFhOTY0Yjg0MGE2
MmM2NmRhNDJhODlhMTBhMjY1NjgzMWFhNGINCg0KW3NuaXBd

