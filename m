Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE234397B4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215859.375262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0BI-00087F-8W; Mon, 25 Oct 2021 13:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215859.375262; Mon, 25 Oct 2021 13:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0BI-00084f-4S; Mon, 25 Oct 2021 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 215859;
 Mon, 25 Oct 2021 13:38:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mf0BG-00084Z-4l
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:38:26 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d409b51a-3598-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:38:25 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19PCqG9T030146;
 Mon, 25 Oct 2021 13:38:22 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bwrqas9sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 13:38:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5938.eurprd03.prod.outlook.com (2603:10a6:208:15c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:38:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 13:38:19 +0000
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
X-Inumbo-ID: d409b51a-3598-11ec-840f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGdGHs4sjpjRhfiWVE1UwG0f5fIIIta/vBUHskHdL3EeG9pY8zusKupmY31xejNk4lcVRL4L/zwRqP5pNrBzgUILqq1HrWSPSvduAw4Hgty6jvCOL/vBYWrTqWlDirmbcCrEoIYAUb4giXgrMW+rNlYDycMgFa6AyT9xUnypFqAUZxYh3A9Gs2fjskucgpxACZBwTlTurOTSdUPU3nVN3aIbS8sTmzlLSj5/NG652IZWbW9BpzXiPiAUUkZ6W1dVpkW1nVdQkFqiUtUsIiC2zVDbtfsXk+1WcvROlHYh6i8Q4WFiV/eUZrLp8XNYl8cdx0R8K44Zr3S5JyA/crKymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46AWicN2KnpEG8Pk9f3qvbK22OkOkr2cfFWOHz3MsrM=;
 b=mjH3e14TFunEih40o+r+lWGnEJss7Qqq0OeC6Icaen5jnYNvQ1u4iNCFnJlXgWOxS2Yi22tevNYugXwpTHyIz6Mp91WRnK1BwDRx20+1ziAvb4CuVEm+PvrToSn8U93qGc0rqwFP3GxvZX6dyrHoEgRBbIY0EFqUKtNJmkOOJIxkqG8I5fq5VrT9C3g+Mii9p5ChLF1FIVi5IIpFilKGX4GMFaU/87W/BF5AxkShKBx3ttlsEewgihEtdYQT8A+VMK3mY2oUnbXxDWB69R8JZi/5snsG2XcZSZHRmkqvfw1A2KRMzlXiFaoczfdJ6wb67ntSWmH9seGpqtXTEvex6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46AWicN2KnpEG8Pk9f3qvbK22OkOkr2cfFWOHz3MsrM=;
 b=qX70rcJx0mmJd6MsaU5EpH1ilOZjFSE4GNv0U5K33UcbFnCqDUbOml9ef4UXkvcsDQwbfmaxHcv6rIgxG9dVxwHWRbHle9GRzSv6BZZ4z0AmXKm3mp9DnbQ1M8TjbjFk14ySC4T7SK1KCYzHn9TKDCwx08H2pPT8ekBGBZbOuvhl2Pr/sHB1HRtmgrfKsbVKpydyjvl9Mk8MGdGFpVYW2OlhmkBtz5LemgjzHeHnp9AA88x6VmZ154ZXHZrbyd44saPiJc/f8SCcTGO5wN8xc7nWh5BbYbW8nf5wtGOw7RXGsba/rhm3ZR39Cd7EOFBH0TQiXBJCiVec0RjcvbxUKg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
	<rahul.singh@arm.com>, Ian Jackson <iwj@xenproject.org>,
        Juergen Gross
	<jgross@suse.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Topic: [PATCH v5 07/10] libxl: Only map legacy PCI IRQs if they are
 supported
Thread-Index: AQHXvAknuuGQJumtOE+ut83tChlOwKvjzqeAgAAEa4A=
Date: Mon, 25 Oct 2021 13:38:19 +0000
Message-ID: <3de59765-6bcb-d6a1-7e23-2b85123df71d@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-8-andr2000@gmail.com>
 <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
In-Reply-To: <YXavl0e0zainVKT9@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90508f97-f4a5-475e-5d7a-08d997bcb539
x-ms-traffictypediagnostic: AM0PR03MB5938:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5938894ADE4F64AFB0EE331DE7839@AM0PR03MB5938.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DJIm3QBI0U2CRG5LBg+6A4TPTtmxPj3unwJ1MhakWCNOkVdRLRCOIZ/W8b5aTQvS0TnEsxK1pyZDg6fIQ1ipSK59lxSZ5hyW7OP0yuBI93Y2yQapTjsEGXIgInDOqw545+2NPSyUGAVC/zZkLxPsnsXA0KW9oN1u+lDijR/GcwNY8FKWvLBehNvr2zNqekbgDXs4fzgx/RdiNimZ0msivkl4eHgp52u/Hge9SZG+n7IgrnoO24Rukf3UbctODwNAVb16ySmKOOe33Zf3LYvYV/q4QzOaPye2FrGCXmaRJXwToJRoq9+Fa9/g9W9eozIOhUnSXp7yiKulrLFH1ZCD2YW4S7xs2lKQr48mH3PwDEtkKz5gkHUw6a16ATennQ4gDHvknOFzhcPlaEpEEPISOMxIKvOZZmBmWCK64TtmRX7eQED6HFdCIubmFq1eeBnvxaU6GADyV23qfJoOvIWEzg+b2xtqfNo0neVnZ7YFKOwmP8RkBZtbnJRiiFah5oms8gpC+PjfZ9x2oA69FB3SdimGZs/+t1FuMokd9zv5kbk+KMZ8RUDqK9qrzbbVspnbj648jFb6KVC8LboibjBl/3uxugs/7FcMebJHBoiquJDHR0gbPwn/xdvORqFpy2lv3F6QnAKLw0kuiDVVnRyxFeYGaXl/uhK2eIeSC9ipffxVvaOMDlmIqlNmz9exzr65Vi+dfuFSmcX3aq476DovY6vWTobBbxyAWEiyXUzF9YmFZ79yLfKFssBufHm5PJfZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(31696002)(26005)(7416002)(122000001)(31686004)(91956017)(2616005)(86362001)(66556008)(76116006)(6486002)(38070700005)(54906003)(6506007)(316002)(53546011)(6512007)(508600001)(2906002)(36756003)(6916009)(8676002)(66946007)(5660300002)(66446008)(71200400001)(38100700002)(64756008)(8936002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bnhGNTdMVVVVOHFnaElGbDVNYWorc0c2RHdseE10N01oMzg2Q2F2VFlBTmMr?=
 =?utf-8?B?a1NXcGRiN01saWlmWXdJTTBYM3Y2Z0owbEZnYTdOaGxrQTZyOEpIN1I3MWZv?=
 =?utf-8?B?UUZmTjh2UDIzUlZaQXJsNkljbmN2WkE0ZzlvSGdvbHY3QStHQUdTV2lpazlp?=
 =?utf-8?B?Zm92b3pFajU3Q3VJT2tlY01PL1R0Z3hCcm4vdkF4VlBRNFhzem9va2xNTW1G?=
 =?utf-8?B?YVpYdGRLM3IxVlhwazhIMTZsV0dFNHM1a2E0cytSVFBreGppdWJYTWEzZzZv?=
 =?utf-8?B?YSs0dmtncStXeWZ2enZkODBRdG13dmJHS3k4amxMcExucDZNa0hrVE0yTEUr?=
 =?utf-8?B?dFVEZWVpSHc0OW9PNjdmbzhhMUxRaU1LWnlleHdCY0RiUGIvUVAyTlBzcUpB?=
 =?utf-8?B?eVd0RTdTOHdUWDBsSVJkYkpPN2Y0cSttTWZBR2EwWnloRVR4NUdmUExpN2Jk?=
 =?utf-8?B?VkppV2NKTnNXRDFVQ0xyV0x4OHNEUkliNDhtUEptQ0FidVhnNkpRclgyZVRT?=
 =?utf-8?B?aEZHQjgrdHNMMG1hSitHR0kzUlo4T3U5YnVILytPNDdhOEh5L0pDcDAyRnk0?=
 =?utf-8?B?Zm9wd01nUVZnMTc4SHkzNEUxaWNNVnAzVEFrbXNKL2QraFZXdFg2NHJsc28z?=
 =?utf-8?B?cUd1QVhRSS9IQ2sxQVkrVy9URnJIRGZKaTJLc016c0VQYk1CUE9RSzhrTlp2?=
 =?utf-8?B?Vk5WVW5laEpPM2FBbXRSMndvUUtmazh0QkVWZUFOdExIUEZLdTJrcmtlcWZ5?=
 =?utf-8?B?a2ZUWkdqR3E4WUI2a1dKdnFvZ2E1YXIvSTdPY3Z0QXR0Y1RyUmZnOVNQWmI4?=
 =?utf-8?B?Ly93RUNySmVzNFN6am9BT1gyMTg3amxvMWlPV2pod2tiZk9TR281dUZtYVk3?=
 =?utf-8?B?VEgvU0JOaTBiWitkTE91WUtxczNqVmVROVZZRHpxY2NFWU1GWThHSU9CRUlC?=
 =?utf-8?B?eUE5cng4VHArdThNWTNvblNRYVFOb0pPTWhaeXBTU0g1Nm1HMUJtM1NxWHZI?=
 =?utf-8?B?RTRtY0drd0R1R0tqaFdkL3pmSHhQWkZQdDB5SGxFSE05YjRVTXRPWVFGOWp2?=
 =?utf-8?B?Q3IvN3pURElPbWV2SFJXSUROSklwSVpXWkttdTA4bTZQNUtTT0o2cGwzQmdz?=
 =?utf-8?B?aUh3OTl6cUx1S0ZGTEVydENEZmVMb3JwaVIwenlGcHVId21jZjJublR0cTFG?=
 =?utf-8?B?Qm9DMlZQRlc1ck53RlhIMmNNVnpsbWx3UCtwUjdpek1kZDZRWUMrRXFaUVJY?=
 =?utf-8?B?S0lUM1c1bVFhbXBKK1FibFFSZXBYcUhYTnVFUHFmaC9Eb0lKcWJuL0w4a2Vk?=
 =?utf-8?B?QmZFOURZbURvb0VDWW41K3RUMjRGbk1IUG9HTnAwRjMyYVlvQ3R1VWsyaDls?=
 =?utf-8?B?VnBGS3hoeTBPdVZEUEdkS2F5OHNMSjhiN1NncHdRWW1ORUhSV2JEVndYNzBP?=
 =?utf-8?B?ZjRBdjVtYnNpQWg1WXFJUUFjRVYxMEZlaVFodW9xampIb2xIeTlNSmVhb2N4?=
 =?utf-8?B?eVNsWWdzU1dDSVlWbVBxcUE4OFJiRWR1cnI2eHFDeTdCWVhCYW5mYmdVdzFU?=
 =?utf-8?B?dk9WYStHTkdNdUtUT1RwV0hqQksrd2kvNEZFQXBhdml3NVQ2Nk10VUNlMTg5?=
 =?utf-8?B?ZE1kbWJrOUo3KytlZHZ2RzVoTzVsTm1MZUtTNkxCUlBPNGR4WjU5K1pBMllS?=
 =?utf-8?B?cFA1dndYRzVJS04yUm4wNHpwR0pTZE1JRC9OSWhBNFY2TTVEQlo0V1JMQnkr?=
 =?utf-8?B?c2VsWlViVmgxZUpyWTREemMrV1lZTlpJaVZzOTNxajJKQ2tCdjJxUzA5cnlq?=
 =?utf-8?B?SysxekZLdSszdmN1Q0lvMmRwcnFSakZJaDhIWTFjVWpuRStxZDdwYThZOVpU?=
 =?utf-8?B?bkpJdDJ5WGhSYUZ2SEZvQTJPSHhuS1NMT3krN0pMb1RtVyt0dXhHWlRxbGth?=
 =?utf-8?B?Vk1uMjVObnl6aGNaYkpTaERJT01IUDhwNWxRbWRlSTY1cXI4bThsRWpIa2Yx?=
 =?utf-8?B?VktnTGhpYTBOM3BTYTF2eVBISzZ4TnNndWU0QXJTd0xJWXp3SGNPNVdGZlRL?=
 =?utf-8?B?dHZFRzA3dnJiSWNyeGttV0dJb2haQjBpQW5mTlowQTF6ZmRtcW5zOGh5WlhH?=
 =?utf-8?B?Tm85MkFLUzl2NzkxdkNXbEFGS1QvOVVkYUI0ZWY0U0xvL2R1QytqRFk1NzdB?=
 =?utf-8?B?dVIxY3N2MDBFaGhSN01IR3IzWCtqcTRnVjJabCtkUElTa3pSR0puYTVuTTVa?=
 =?utf-8?B?NFNsb2swU3IvR0lCYmdSUnNhcXVsZ05pakc4STJmYUVnR2RmVS8vTUZTMDhC?=
 =?utf-8?B?Y3lROU1pQUxmelQyNmVYYVFrMzFJU1BvZXltcDRNNXZpMDNsanRsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AD73E97438DB24591A392BFDDBA0B5C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90508f97-f4a5-475e-5d7a-08d997bcb539
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 13:38:19.7935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmD/44Q8E3DJ/qEFVP6DiimnQx1MRr2k94uORVF7iq9udaR8e5WmRXee8j/xdrqI3liQz1xx9M+BPfl0tGyLh8KUTtOpGMGZphnnUJ6ntVS/zWTIxKltqizna7d+swgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5938
X-Proofpoint-GUID: TLXiWV_3G9eS5YxwSV7x0_ex1bVRYY5h
X-Proofpoint-ORIG-GUID: TLXiWV_3G9eS5YxwSV7x0_ex1bVRYY5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110250083

SGksIFJvZ2VyIQ0KDQpPbiAyNS4xMC4yMSAxNjoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMDgsIDIwMjEgYXQgMDg6NTU6MzJBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQXJtJ3MgUENJIHBhc3N0aHJv
dWdoIGltcGxlbWVudGF0aW9uIGRvZXNuJ3Qgc3VwcG9ydCBsZWdhY3kgaW50ZXJydXB0cywNCj4+
IGJ1dCBNU0kvTVNJLVguIFRoaXMgY2FuIGJlIHRoZSBjYXNlIGZvciBvdGhlciBwbGF0Zm9ybXMg
dG9vLg0KPj4gRm9yIHRoYXQgcmVhc29uIGludHJvZHVjZSBhIG5ldyBDT05GSUdfUENJX1NVUFBf
TEVHQUNZX0lSUSBhbmQgYWRkDQo+PiBpdCB0byB0aGUgQ0ZMQUdTIGFuZCBjb21waWxlIHRoZSBy
ZWxldmFudCBjb2RlIGluIHRoZSB0b29sc3RhY2sgb25seSBpZg0KPj4gYXBwbGljYWJsZS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gUmV2aWV3ZWQtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KPj4gVGVzdGVkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2lu
Z2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2M6IElhbiBKYWNrc29uIDxpd2pAeGVucHJvamVjdC5v
cmc+DQo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4NCj4+IFNpbmNl
IHYxOg0KPj4gICAtIE1pbmltaXplZCAjaWRlZmVyeSBieSBpbnRyb2R1Y2luZyBwY2lfc3VwcF9s
ZWdhY3lfaXJxIGZ1bmN0aW9uDQo+PiAgICAgZm9yIHJlbGV2YW50IGNoZWNrcw0KPj4gLS0tDQo+
PiAgIHRvb2xzL2xpYnMvbGlnaHQvTWFrZWZpbGUgICAgfCAgNCArKysrDQo+PiAgIHRvb2xzL2xp
YnMvbGlnaHQvbGlieGxfcGNpLmMgfCAxMyArKysrKysrKysrKysrDQo+PiAgIDIgZmlsZXMgY2hh
bmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xp
Z2h0L01ha2VmaWxlIGIvdG9vbHMvbGlicy9saWdodC9NYWtlZmlsZQ0KPj4gaW5kZXggN2Q4YzUx
ZDQ5MjQyLi5iZDNmNmJlMmExODMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L01h
a2VmaWxlDQo+PiArKysgYi90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiBAQCAtNDYsNiAr
NDYsMTAgQEAgQ0ZMQUdTICs9IC1Xbm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1kZWNs
YXJhdGlvbnMgXA0KPj4gICAJLVduby1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVdmb3Jt
YXQtbm9ubGl0ZXJhbA0KPj4gICBDRkxBR1MgKz0gLUkuDQo+PiAgIA0KPj4gK2lmZXEgKCQoQ09O
RklHX1g4NikseSkNCj4+ICtDRkxBR1MgKz0gLURDT05GSUdfUENJX1NVUFBfTEVHQUNZX0lSUQ0K
Pj4gK2VuZGlmDQo+IFRCSCwgc2luY2UgQ09ORklHX1BDSV9TVVBQX0xFR0FDWV9JUlEgaXMgdXNl
ZCBpbiBhIHNpbmdsZSBwbGFjZSBpbiB0aGUNCj4gc291cmNlIEkgd291bGQgY29uc2lkZXIganVz
dCB1c2luZyBDT05GSUdfWDg2LCBhcyBJIHRoaW5rIGl0IHdvdWxkIGJlDQo+IGNsZWFyIGVub3Vn
aCB0aGF0IHNvbWUgYXJjaGVzIHN1cHBvcnQgbGVnYWN5IGludGVycnVwdCB3aGlsZSBvdGhlcnMN
Cj4gZG9uJ3QuIE5vdCBzdXJlIGl0J3Mgd29ydGggZ29pbmcgdGhyb3VnaCB0aGUgb2JmdXNjYXRp
b24gb2YgZGVmaW5pbmcgYQ0KPiBzZXBhcmF0ZSBvbmUuDQpUaGUgaWRlYSBiZWhpbmQgbm90IHVz
aW5nIENPTkZJR19YODYgaXMgdG8gYmUgYXJjaCBhZ25vc3RpYywNCnNvIENPTkZJR19QQ0lfU1VQ
UF9MRUdBQ1lfSVJRIG1ha2VzIG1vcmUgc2Vuc2Ugd2l0aCB0aGlzDQpyZXNwZWN0DQo+PiArDQo+
PiAgIFNSQ1MtJChDT05GSUdfWDg2KSArPSBsaWJ4bF9jcHVpZC5jDQo+PiAgIFNSQ1MtJChDT05G
SUdfWDg2KSArPSBsaWJ4bF94ODYuYw0KPj4gICBTUkNTLSQoQ09ORklHX1g4NikgKz0gbGlieGxf
cHNyLmMNCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4gaW5kZXggNTlmMzY4NmZjODVlLi40YzJkN2Fl
ZWZiYjIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiAr
KysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBAQCAtMTM2NCw2ICsxMzY0LDE1
IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfdGltZW91dChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19l
dl90aW1lICpldiwNCj4+ICAgICAgIHBjaV9hZGRfZG1fZG9uZShlZ2MsIHBhcywgcmMpOw0KPj4g
ICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBib29sIHBjaV9zdXBwX2xlZ2FjeV9pcnEodm9pZCkNCj4g
QSBuYW1pbmcgbW9yZSBpbmxpbmUgd2l0aCB0aGUgUENJIHNwZWNpZmljYXRpb24gKHNpbmNlIHdl
IGluc2lzdGVkIG9uDQo+IHVzaW5nIEVDQU0gaW5zdGVhZCBvZiBNQ0ZHKSB3b3VsZCBiZSBpbnR4
LCBpZTogcGNpX3N1cHBvcnRzX2ludHguDQpUaGlzIHdpbGwgcmVxdWlyZSBhIGZvbGxvdyB1cCBw
YXRjaCBpZiB3ZSBhbGwgYWdyZWUgdGhpcyBjaGFuZ2UgaXMgbmVlZGVkLg0KQEphbiwgYXJlIHlv
dSBvayB3aXRoIHRoZSByZW5hbWU/DQo+DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpP
bGVrc2FuZHI=

