Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF64A841E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264706.457905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbbw-0001Ej-Qp; Thu, 03 Feb 2022 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264706.457905; Thu, 03 Feb 2022 12:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbbw-0001Cu-Na; Thu, 03 Feb 2022 12:53:16 +0000
Received: by outflank-mailman (input) for mailman id 264706;
 Thu, 03 Feb 2022 12:53:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFbbv-0001Co-Ul
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:53:16 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa2fa3a-84f0-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 13:53:14 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213C309a032236;
 Thu, 3 Feb 2022 12:53:05 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0en1r6n2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 12:53:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4859.eurprd03.prod.outlook.com (2603:10a6:10:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:53:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:53:01 +0000
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
X-Inumbo-ID: 3fa2fa3a-84f0-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9wo4jsIHgkUnvnafn7SXMZ6wNxLsWsr74BxMcuOmN6Nb+MIK8km+D86yG+SCSN1y2rrgAlFADcjVt8XAUzlJs4uFvqdjdaQAXX6HrEYW0Y7hBKGpDjpEaO1+6OMvrJFKpexHvFGnv49Drsu1YbwGTITuqHqlSdSp6tjMqKo8mrmMuuqG7Fa/Dytc+NnHRs0bvUZEGW+bNq7UbI6KDEtAFjYRO6FE0oCvy6+KWF1ExT+caOnZ4JnsQM2Rb71v05E3siJRReSlyJy1sqfAFeNLBaw9Bq1JbzrjV5fsKpQljII9XgElX9UEPP1diVkj5F5K/eWVUcUYNzf+2CWYyANLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j37AQMrZ1ji+fHX7ArPqQEKUN5XNyvAMDiKP235kHTg=;
 b=hdCZCIVtKfVWGJK2vy8hStAoOta2uXPwry3s3yw2GGYUpHE4z8QNWv+OS3iiutpj+dgPKRCpDuGZsLaOJaWHdWbHd3b4IJe/DcrdaVSEjos0bKb3kpqvLD4nC1QzBCPkmXDxNxQgjD18EkMtz8O9eViXsDEC50WYT9wgK9Gm3kNr97alGOwYCFTOBP9DTSb7WsPXKYX8pg6GSdOn0bY4fO25ECtwQHVuyhjbj+cuzO8v3O6eSaRbWgS0oLVVANgotV16xbrU1nOPG8WUhtkTBvacl3j98jmLY2O3e8hSz3JGX7myx1kh6OAgcu8J1QVNXcL/Dbt/wfv3LOEPjvG08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j37AQMrZ1ji+fHX7ArPqQEKUN5XNyvAMDiKP235kHTg=;
 b=FzgjXxnA9SiFF4pHYggrSck3I+pZcsq/w/A5noFUmG/a+gHOSVEmnLqptRG3/UmbBPfdeYS077GvL1H032q0zi5uOo/v3DZWrBIoGa9VWgWyHhrA+4fmQgbKJNsvBqp4CBUpiuGf0nERFRSRhUzi6jDRi/4ZJ7UqVWyxvJbrhXNky9HU8imtYG6fO13ApvdYGphLue7qzfaOUIsHtvaqaaTsQAsNVRErZFg5Qu5pmoBN3E4DTxaCejjLdxOSCQgK1XjpfQ73RAm0GmPWm95MELiJvzVx4T1WEJS7NIRbuM704makYIVyrkk2WopoRP3Pmk11vkra2SNCywMZ6qgUfA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNawUby8AgAFMuICAbHV4AIAAAlkAgAABPoCAAACHAIAAAJ0A
Date: Thu, 3 Feb 2022 12:53:01 +0000
Message-ID: <d155682d-7beb-86e7-4685-1b7207108c07@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
 <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
 <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
 <8ac4e23d-afcd-d965-fab0-b437baef8172@suse.com>
 <c9e7b16f-db9e-e86b-a5b1-ca87d5fb6609@epam.com>
 <4dd945c0-c600-4515-6f99-a75d06cf84de@suse.com>
In-Reply-To: <4dd945c0-c600-4515-6f99-a75d06cf84de@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1548d582-fd85-4993-8dea-08d9e7141cbc
x-ms-traffictypediagnostic: DB7PR03MB4859:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4859F8323ECAB8AF41863151E7289@DB7PR03MB4859.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IQbFF+s3fybMj+F84/VyuE6hT6IKUzmzchf/e6iyNZCJEx/1yUup7UANoxaM5mABlyEHwBkvjJEds5BxJPvGZwsX3xEK71XCTFmn/e50zi+HgsUoDIzIwe9eCQ/Cu5jXJw4otlflS675bxbILHwJBfJwuURjs0GLO2q+IN//Vj6gfclcG/iY7cEXZ12Fx7KGNQy/9PRMgzMSey++3tvIRifj4IDH7ZSbgMKCgrbGVETzGkQO2OQQ0lsVKrrRZnFvXCBELKlL1LdD5pRCGwqQuIn2Rrt8VZDXsfijeLCwYhCEoerUX86JEfN8U3PFgCkE2r4L+WqQiKojXjzMbo8WhC3z//gpgCM78f5o8vjIwgiZtLYl4GKMYVtkOj8opRJGZ+WS3g5rxV1cDScy5TRgUtTEUBDmfpmPN0t2Z2UDsz8RU2bS7QVklGJ8BWeqck46FVVykdp1i8VoA8T4p/U0sWB2Mp01K3eNlFMal2iNGry35gdUyzXgw160I8N7bDMjoBg6a26ZWvTBBADzvDTGrpMZTeRMKnHVLvUr/sseCgzu5y8i+RznQ07ylpmIw+JQm4hbqsyG5ekB5+QNp2whh7RoRGgnJ3GxVHHtPzSWFAvyRM+OWsnDN8TRilygDYyQXM9MR7iUvY7Zc5+UbnxhckAviaQevzMfzfoC2rRBHbWuvrbLjgBnIPKnIkhy/m0QkkI+jf+/zj+8TEF3M42BjjwSX27YFAwBICYwmAwyfp3zUfhA9C9z/y1241vzAhky
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(7416002)(66476007)(31686004)(64756008)(2906002)(66946007)(66556008)(36756003)(4326008)(8676002)(8936002)(66446008)(122000001)(91956017)(38100700002)(6916009)(316002)(54906003)(76116006)(26005)(83380400001)(508600001)(6486002)(6506007)(31696002)(53546011)(2616005)(107886003)(38070700005)(6512007)(71200400001)(86362001)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VHNHYVNkcGwzbC9ZS1hTemZiTkFFNHdwWm1RY2ZMcEQ0RDkybHB5OWdaQkto?=
 =?utf-8?B?ODVkV2pOaG42U3AyVGUyQ0FNS1lBTUlTRUZNdVAzYzVNbTkvV1FEd2hDYlgy?=
 =?utf-8?B?UkRxK1RuZmFPZ0s2dmpFbnpDakdSQkhGZmxjSFRJdk1uNHdFVW4yeSsrTVh2?=
 =?utf-8?B?VE1LS2c0a0piS2lMbmNzTUlIM2hpaXAvbFJscXVLbzJtTDd5M3RGQVhqaTdS?=
 =?utf-8?B?ZFdrMVpBb2dHaWhCU0xoTU4vQkdXRXJtL2tTbnM2SXNBdnd6QWZ0bU5QNXRy?=
 =?utf-8?B?S2ttT08rZWVwYU1EdVhTSWpuWVk3ODdueGlmRWRtZlRmNDFUVG5sTEJLMEd1?=
 =?utf-8?B?UGtIZWZFTFdZRmhiUndQeGFHbXVuMWQ1cmpIRVpPcjdjdlh5Q1llZXc1blpY?=
 =?utf-8?B?UWphWHRaWm1YS3lCWU5uVzFsZkcrdUNLUFJxOFR1b0V0NS92N2NudDltY08r?=
 =?utf-8?B?WGtMVTVsSldGYmRoampQNGx6UHcveldqeE15azVzWVBxNlJtNU1yWUxQWXRt?=
 =?utf-8?B?R0pHeWRVWGREek1CMi83MFl4RXBBcjQ5cjBIVDA4VDlOSzNGZ2NLOVRZVkxE?=
 =?utf-8?B?QWEwVGN1bUV4S0RCckV5UnhZVEdQNHNaSWliZ0FYWTNLaktnb0JubXZiY3FY?=
 =?utf-8?B?OGhsQ2tFOENzZ2dvejI5TzJjdUNkTDMra2hkUDJNWWRuU2l5Q1VwTys0Qm1Y?=
 =?utf-8?B?N3dieGZaU0h0N2RUeldoTzJQL3JWaG1UcEhaZU8wWng0YTR3Tld6cFE5MjBH?=
 =?utf-8?B?dWhXL041WlhEcDBlR3J6Uml6ME9jdUpYS29hbUQ4MDFLYVQrUFlhTU9GNGZv?=
 =?utf-8?B?aGgxaU9NcTZrNVk2K202cDRzVWoyQ1dJNHh1czZCRXFZUjVkOEZUa3hGRXdP?=
 =?utf-8?B?ZU9NZ3lvMjVtMHZkZzZuVDRhSHlJaFV4U042a3JQUDVleWpZWXRFbDEwOE8x?=
 =?utf-8?B?TDVibFZTbjhiYVBRTFI2cUoycWR1ZHRacUw1VXFORG1WTGRJQ3MzSERaNFMz?=
 =?utf-8?B?cFVNbGxuM042czl1OXFrbi9CWDh5Y0gzcDc2VmQ0amVMZ1FOdmxrNzlxVTZp?=
 =?utf-8?B?d3VjZFNGdTVndk5XbU1XaXI0NjR5U01OTUtVVkhseGpKN011T01hdHRMUTU0?=
 =?utf-8?B?YkRnQ0c5elJ1OUJkK2xDNkNnMmw2M1BQZmRYakV1VEJnTjZsVVppSVc5MnNZ?=
 =?utf-8?B?VTJtdW5TWjc5TjlHVEptRVI4ejVJeTVEeEUwaGdZUDNIakZVQktwM1FLYTla?=
 =?utf-8?B?SEl1MzNFdmZINVk3ZGIxckk0WXU0Y2xTdzVZaDdVWVJ4VHA2K0lnME40U0Z5?=
 =?utf-8?B?RlpOL3RyWHFnWFBUcDVEaDUxWGNPQWZhOG1YaFI3Z2tTY1VkaXB5VXptQmNi?=
 =?utf-8?B?bDhZR0diTXZIYnV5MXlXbWVCd3R0WlZIb1lmSHV4b3B4Z1hiOU9RcWFDdndZ?=
 =?utf-8?B?TjVCaG05K0tFYm1oa3A0RnlFZ1pyKzRJOUVWLzJBN1VlM0dYVFFCS0tuUnpu?=
 =?utf-8?B?UjhnZi9uZW92T1RrL1VGZXE2SzBiazY4MnBYT0hCOTlmaks3VHlsNFQvbjRX?=
 =?utf-8?B?cUpLOVVTVk1IWC82U0tzVERTbjMxcS8zNFltL3NNUVZJTkYwcVNZL0JmWkdJ?=
 =?utf-8?B?dFExKy9Pdkx4TERMa2h5dnpzY25tbmFYWDh3bHdITUF0c3JpckxiaW5XVkQz?=
 =?utf-8?B?UEdidzYwK0dCcWZCQ2NzYVpEbkQ5VW8vNm0xZTJuTWJKcTZYZ3pmODJsU2FI?=
 =?utf-8?B?cnQxMEdEajFTTllJWXpsME5sT2V1UWZRN0dGd29UY2pwQXRHMDc4MVZoVHhp?=
 =?utf-8?B?cE50WGsrR3QzLzR6OUdMZVhPUXAyY0FVdEh3c2VmOUU4RmFzS0NKUU42emth?=
 =?utf-8?B?QnZWNy9WR3diZzg5eGtWR2ZpYWtxMnFTQjlsMHpSaFI0VXVsNWJyRitVVXoz?=
 =?utf-8?B?SWJBVkx0MUdVZjRock5UeHdaN0tLT2RGTzZKeXpEM3UwZ2Vncks3SnFvTVZH?=
 =?utf-8?B?MFlXUml3Z0MrdEV5M21YUEoxeG1iT2pDdkZicUxyaEJKWVZXcTUzSm9uWjcw?=
 =?utf-8?B?Szh3b2tDelhMY1RyVHdEd0grWHdka1lneFdNcEI5ejFqVEUxWVgzdWZhUXpU?=
 =?utf-8?B?RW1hcEFvOVBLSEZwSmNYZlBXN1ZUMkJmSzhtTzlkaFFYTzBRTkdrZzg5M0gw?=
 =?utf-8?B?N1cvQ3p6emRoWHBSbGFkdGtMUzh1SVdteGRLVGxtTkJIMTZmMzhCSzZLOUdV?=
 =?utf-8?B?VmNVZUdreFI5Z2g4Z2Jyb2pwWXZQaWovTjJYdVBUaUFDOG5qc0VTM1VybTR4?=
 =?utf-8?B?cExyVHlMaGRWOWZBNXp0ZjdnSExZaHZra0xkWDlLRGlBVzRHeWZVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3AB97E4BB389A48BE1AD299B0DBAB4F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1548d582-fd85-4993-8dea-08d9e7141cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 12:53:01.6169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zcdbp1yZf35/ViMX+/IFE5t0PCt+gApoR6WGAQ/ESN28e2X4+FMhHYDHx2/krnr2a1SGSg+xcV9gundSSP8Skgmkcsy4mIofw9y+VTuejhtlz0PUsdPbUBmPd4wI9yD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4859
X-Proofpoint-ORIG-GUID: GQhsmyNTGiELhlSG2YzcGQ4edkAx7HbN
X-Proofpoint-GUID: GQhsmyNTGiELhlSG2YzcGQ4edkAx7HbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=4 impostorscore=0
 mlxlogscore=143 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=4
 adultscore=0 mlxscore=4 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030080

DQoNCk9uIDAzLjAyLjIyIDE0OjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDIuMjAy
MiAxMzo0OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgSmFuIQ0KPj4N
Cj4+IE9uIDAzLjAyLjIyIDE0OjQ0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMy4wMi4y
MDIyIDEzOjM2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIEJlcnRy
YW5kIQ0KPj4+Pg0KPj4+PiBPbiAyNi4xMS4yMSAxNDoxOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+Pj4+PiBIaSwgQmVydHJhbmQhDQo+Pj4+Pg0KPj4+Pj4gT24gMjUuMTEuMjEg
MTg6MjgsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+
Pj4+DQo+Pj4+Pj4+IE9uIDI1IE5vdiAyMDIxLCBhdCAxMTowMiwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQWRkIHJlbGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMg
d2hlbiBhc3NpZ25pbmcgUENJIGRldmljZSB0byBhIGRvbWFpbg0KPj4+Pj4+PiBhbmQgcmVtb3Zl
IHRob3NlIHdoZW4gZGUtYXNzaWduaW5nLiBUaGlzIGFsbG93cyBoYXZpbmcgZGlmZmVyZW50DQo+
Pj4+Pj4+IGhhbmRsZXJzIGZvciBkaWZmZXJlbnQgZG9tYWlucywgZS5nLiBod2RvbSBhbmQgb3Ro
ZXIgZ3Vlc3RzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBFbXVsYXRlIGd1ZXN0IEJBUiByZWdpc3RlciB2
YWx1ZXM6IHRoaXMgYWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3Qgdmlldw0KPj4+Pj4+PiBvZiB0aGUg
cmVnaXN0ZXJzIGFuZCBlbXVsYXRlcyBzaXplIGFuZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlz
IGRvbmUNCj4+Pj4+Pj4gZHVyaW5nIFBDSSBkZXZpY2UgZW51bWVyYXRpb24gYnkgdGhlIGd1ZXN0
Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBST00gQkFSIGlzIG9ubHkgaGFuZGxlZCBmb3IgdGhlIGhhcmR3
YXJlIGRvbWFpbiBhbmQgZm9yIGd1ZXN0IGRvbWFpbnMNCj4+Pj4+Pj4gdGhlcmUgaXMgYSBzdHVi
OiBhdCB0aGUgbW9tZW50IFBDSSBleHBhbnNpb24gUk9NIGhhbmRsaW5nIGlzIHN1cHBvcnRlZA0K
Pj4+Pj4+PiBmb3IgeDg2IG9ubHkgYW5kIGl0IG1pZ2h0IG5vdCBiZSB1c2VkIGJ5IG90aGVyIGFy
Y2hpdGVjdHVyZXMgd2l0aG91dA0KPj4+Pj4+PiBlbXVsYXRpbmcgeDg2LiBPdGhlciB1c2UtY2Fz
ZXMgbWF5IGluY2x1ZGUgdXNpbmcgdGhhdCBleHBhbnNpb24gUk9NIGJlZm9yZQ0KPj4+Pj4+PiBY
ZW4gYm9vdHMsIGhlbmNlIG5vIGVtdWxhdGlvbiBpcyBuZWVkZWQgaW4gWGVuIGl0c2VsZi4gT3Ig
d2hlbiBhIGd1ZXN0DQo+Pj4+Pj4+IHdhbnRzIHRvIHVzZSB0aGUgUk9NIGNvZGUgd2hpY2ggc2Vl
bXMgdG8gYmUgcmFyZS4NCj4+Pj4+PiBJbiB0aGUgZ2VuZXJpYyBjb2RlLCBiYXJzIGZvciBpb3Bv
cnRzIGFyZSBhY3R1YWxseSBza2lwcGVkIChjaGVjayBjb2RlIGJlZm9yZQ0KPj4+Pj4+IGluIGhl
YWRlci5jLCBpbiBjYXNlIG9mIGlvcG9ydHMgdGhlcmUgaXMgYSBjb250aW51ZSkgYW5kIG5vIGhh
bmRsZXIgaXMgcmVnaXN0ZXJlZCBmb3IgdGhlbS4NCj4+Pj4+PiBUaGUgY29uc2VxdWVuY2Ugd2ls
bCBiZSB0aGF0IGEgZ3Vlc3Qgd2lsbCBhY2Nlc3MgaGFyZHdhcmUgd2hlbiByZWFkaW5nIHRob3Nl
IEJBUnMuDQo+Pj4+PiBZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYSB2YWxpZCBwb2ludA0KPj4+PiBT
bywgd2l0aCB0aGUgYXBwcm9hY2ggd2UgaGF2ZSBkZXZlbG9wZWQgdGhlc2UgZGF5cyB3ZSB3aWxs
IGlnbm9yZSBhbGwgd3JpdGVzDQo+Pj4+IGFuZCByZXR1cm4gfjAgZm9yIHJlYWRzIGZvciBhbGwg
dW5oYW5kbGVkIG9wcywgZS5nLiB0aG9zZSB3aGljaCBkbyBub3QgaGF2ZSBleHBsaWNpdA0KPj4+
PiByZWdpc3RlciBoYW5kbGVycyBlbXBsb3llZC4gVGh1cywgdGhpcyBjYXNlIHdpbGwgZmFsbCBp
bnRvIHVuaGFuZGxlZCBjbGF1c2UuDQo+Pj4gRXhjZXB0IHRoYXQgSSBndWVzcyBCQVJzIGFyZSBz
cGVjaWFsIGluIHRoYXQgcmVhZHMgbWF5IG5vdCByZXR1cm4gfjAsDQo+Pj4gb3IgZWxzZSB0aGUg
bG93IGJpdHMgY2FycnkgYSBtZWFuaW5nIHdlIGRvbid0IHdhbnQgdG8gY29udmV5LiBVbnVzZWQN
Cj4+PiBCQVJzIG5lZWQgdG8gYmUgaGFyZC13aXJlZCB0byAwLCBJIHRoaW5rLg0KPj4gU28sIHlv
dSBtZWFuIHdlIHNob3VsZCBoYXZlIDIgc2V0cyBvZiBCQVIgaGFuZGxlcnMgZm9yIGd1ZXN0czoN
Cj4+IDEuIG5vcm1hbCBlbXVsYXRpb24gKHRoZXNlIGFyZSBpbXBsZW1lbnRlZCBpbiB0aGlzIHBh
dGNoKQ0KPj4gMi4gYWxsIG90aGVyIEJBUnM6IHJlYWQgMC9pZ25vcmUgd3JpdGUgZm9yIGFsbCBv
dGhlciBCQVJzLCBpbmNsdWRpbmcgUk9NLCBJTyBldGMuDQo+Pg0KPj4gSXMgdGhpcyB3aGF0IHlv
dSBtZWFuPw0KPiBJIHRoaW5rIHRoYXQncyB3aGF0IHdlJ3JlIGdvaW5nIHRvIG5lZWQsIHllcy4N
Ck9rLCB0aGVuIEknbGwgc3R1ZmYgdGhhdCBpbnRvIHRoaXMgcGF0Y2ggdjYNCj4gSmFuDQo+DQpU
aGFuayB5b3UsDQpPbGVrc2FuZHI=

