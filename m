Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C44A95AE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265195.458506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuTM-0001mS-Rt; Fri, 04 Feb 2022 09:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265195.458506; Fri, 04 Feb 2022 09:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuTM-0001j0-Oh; Fri, 04 Feb 2022 09:01:40 +0000
Received: by outflank-mailman (input) for mailman id 265195;
 Fri, 04 Feb 2022 09:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFuTL-0001iS-93
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:01:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e151329-8599-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 10:01:38 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2146HfsH021954;
 Fri, 4 Feb 2022 09:01:25 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0uysgsuu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 09:01:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2786.eurprd03.prod.outlook.com (2603:10a6:200:92::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 09:01:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:01:21 +0000
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
X-Inumbo-ID: 0e151329-8599-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb7OEP4zqa6Al//HcpZktsbEtuyumfiDSY5hFU4iKS1F/QaNdTZcanKgpis6OLDVV8iIQOUqiREXd5J/BNBD/xhKkY83FiCabJImGgueE2iQjXg+FHgg44tZG91r71GymBZ0UMTTpxPqF+dlzHcyAyyTCN/UZrsSdoxgdE0bYg6X4O84JeczWIkGVRU0XqUAKddZlOLvI9FoYFd4v9dheS3W+kZdOhsTjt5oy+l8Dbq/OcLazxH3+/8GA4IaGn4olMF/nT4eFrDM3pSmjsCwnB2i3JuYTi4qIfw6ThXgIf9mh69Oi9GAF/Hpopdo2bOWNXvflvJDRY7xtXkIlyd4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmkvB2Aufh6gUnuAZXvZdNGoZPqlCuNTXTrXiAAu9HY=;
 b=cXCBUvKCTTGpaLT+KTW/WCIIYTIsGJ9d1lkQkEAJvNRCdCAiR7X54+9iyB1biyq5NOQ2eGXGKfxVBL0Yp4Pm9ZGNIDqtfGGxOI/5m3YSzZ+5/Ld0hFdKkd8PJYKX6oA7NAcNvh1z71l55vi39wkmKW7XFvwkxFjdqGE07QnWdD0vzg7eXOuXQOwlWm2aa0pzzx4JLdp1WRPCxfLQulNQp4Lgbbs6lNK0otQdONXkLn1UGlVSU6Un+mhp9g+qWbhekr9dgBTEGRfUbBILyYUPugod/XClk+sBl1N0HEJ0EiTdfK9Ba8AvjhDoA8HAXAxAdYFc7GS4CzLUDf1Y2Dp3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmkvB2Aufh6gUnuAZXvZdNGoZPqlCuNTXTrXiAAu9HY=;
 b=PlSwGfKJOb4uEo4yAZ9ugAQxlD5qIR3FEPGVlN5rP8T1mp3kBOQlSf4X7S2GenXfL/NgHezo5SrufShOV4JXI7gobsLJEJVyq+rWi1s5JD10ZLHEsyZnsxybVcgyUznNB9M7jr2SKqZuvc5Pr+zL/fafeg2gKUhCEB4YnAQmvbMmK5/Xfl3KfPCkwFNqKcgfrLkoUElopRVs7a5H2wN6ertYzcqzzVicPhS7KHT+srpjSR1ytqOpEyfdr1VhtdvI3LzIBLhIe6Qfz6CT1YhtckZRSNQ9u1OUZcgXOGKRhuQu+FHyN0eUngHOzHtlFKq0dci1owXgGhE/8+g099aPRQ==
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
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Topic: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Index: AQHYGZFbEg6Erttt1UCNei+XrySHEqyDFYiAgAAC4gA=
Date: Fri, 4 Feb 2022 09:01:21 +0000
Message-ID: <19e50632-5865-9a75-756b-88db85007e96@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
 <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
In-Reply-To: <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23b864cf-3ece-4b39-9cc3-08d9e7bce9d3
x-ms-traffictypediagnostic: AM4PR0302MB2786:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0302MB27869B1C63CE39BAEC4F36B2E7299@AM4PR0302MB2786.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uCHJTAKYL6i6s8/6HQfYt134s9ykM8S7CvBihOkQHUCTSrGzemIyNj2pYGfRGFSxGn8jyGOq4D+MJd+fOO91+N4kLNEIFG7VR4q+x9QhTY2jluRKONtMzREfG6R30ujQ7YfFSq7cZbLzTsbtjFZGa16O3bih9T1363urkvqsaJ+vCMpNz+A3EdeFIfIWNGhispSXyaYN3ydcjvp8tEAMz5/dJQXMXJfvKW1Ps0hoQxR3DUtImJlVKQre/5AxyfYAUrHq2mgFb6LMf9qAbVYszMilP1f+gFGBWfqIS8NqVLN2lzwIQVgrWpp15nfuXK+S/Gv0W32Olnv+Jm8jIZhoh2KgTIg+u+vBoOfTR3X4AhY5Vj6rurGmtJwYYGluVdaRSr91hqQb5aI0WAv1NU1dExkC8RH+h4II7Ztwuw9MlbJaQeYYdSdXnwE5B9/F9GEhHWbmkaiyq1GE0XAH6Ljw0PxV0dDTI/UPCkBmkQsv+XrAcAU2e8GGgk+1uAKrvS7wlR4HhwSkuuK3SSLDOB3bljyUENplri0zdYabhobfdreAUgeuNTANKanKPO8AYqiHdOTiASEPdoGeSKRuyZnJZkWTTRBHX8i5nw5I4uigZ9JcrBCgASGMdlceMEm7bq2AkdCb7jdsIrEHrDq2KPLamDShHG0TvWYtvqGL3HDxpbYWdvYp6bxrwDKgvBQcKK4Tr6zIFz8osKpeW1YG2+l7icH58tGbPfvUqHfUSk4NWszjb+SE9I3e4Qbql46PWRob
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(53546011)(6512007)(71200400001)(6506007)(7416002)(64756008)(38070700005)(2906002)(26005)(31686004)(36756003)(6486002)(508600001)(107886003)(2616005)(8676002)(110136005)(186003)(83380400001)(86362001)(66476007)(54906003)(122000001)(8936002)(76116006)(66446008)(66946007)(38100700002)(5660300002)(4326008)(66556008)(91956017)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WE9tNGxySDFTa3d3TzRSTGtDdS9mTWlJSzBqK0tSenc1ZTRiSkEwVTJXOHpV?=
 =?utf-8?B?N1FQSVpwTTBwdGJ0WDJQbURPYURvdnRFR25TV1dFOXp3MFdDUVJXNkJyb1hM?=
 =?utf-8?B?VnhnY2ZMaHcxMUJ4QkdQdnkwbVZJMkxEWSs3bDBvckg0Rmx6VnMvTW9yNFBW?=
 =?utf-8?B?Y1ZzMFV2aXZHbXduSjZnTVlFZGpYOHo2VTc3bWp3czk3eGV1dzFFK2s2bGVp?=
 =?utf-8?B?cFlCa2xlSHZnZFBzUjFCTEExM3dvcmhGaDRvWkJSbENXVnVHSytaU0tySWNi?=
 =?utf-8?B?QzhQSGVXZFdmakhXOFJiV0tBUkJmcm9LUG04bG1Da0U1TnRvSGlNZmdNeDVL?=
 =?utf-8?B?Z1FEM2VJNW1aVDlvSDUwdGtmQllYb1JPN2tVK3RWN3ltMTJvckxCNmprOTBx?=
 =?utf-8?B?WGs2WHJEdkJSU0xIbnY5QVJnTEl3bTFxb0JZeUFoYVVlbWpRbUROZ2lSMHJ1?=
 =?utf-8?B?bHljbnVnNmtTcDJUczBFazZTcGRCS3VycElpaERRenhOTllHS2RzbFZBRDY2?=
 =?utf-8?B?TWgvaGpEdFhRZ1pDd1hqeXVyOFA0MkNERXRnWjBWQmx2MkhuNHZZdHR2RkZz?=
 =?utf-8?B?QUtTTVA0MlZLL1R0SnpmRFZ3dHVFbVhQQ2d0OUtxeGk1QS9JV1FhNmoyOFU5?=
 =?utf-8?B?Z1FvZDU3VENBOVl5U1AxMGFlYjdXaG4wK1gxaUVhQ2FycGZ3b1dJOGNVbEJx?=
 =?utf-8?B?T0VGUHFuOS9wZU5DWjRWRUFDWjVZVWpOSWxjRmtuUHVQRXo5Z2hrVlRBbXhH?=
 =?utf-8?B?NTdQU1BKdWpaMnB4WCtzS3A2TG9kdU1NM1Z2U2JaOWVGTFMydllGRGEvSVlm?=
 =?utf-8?B?MXFvMFpmSXkzd3ZlRkUyOUZpeXRrQk9XWFpQbVZnL1o5eDJ3UEdoQ0FmN3h3?=
 =?utf-8?B?a0hTOTMxV2Job0RGMGxIVi9DSWZ4elhQL29GWU05cjVJK0Q4VUx3T253WTZS?=
 =?utf-8?B?bzYzQTVibUM2NUpwVklET3FrRDlISU9oVW0wNEN3S3ZSY05mcDhqUHoxbFd0?=
 =?utf-8?B?aU80ejJDMkxPUnM5WklaVmgydk5kdFlCUHRDUHZ0ZE9haElGMEJHRDA4SmdF?=
 =?utf-8?B?MzcxaDhkRGNjSUlxUHJQVy8zWWtDem1Wa0I2SzAvODNlQmYzSWNScFpVZ25Z?=
 =?utf-8?B?M3JuL1hQcE91SkhOeTBHdWtlSHdpT3g2UVhFVTAzeXJZNjcxZkNRa0dqbFhv?=
 =?utf-8?B?MmtsQlYwKytUU1RCZ24ySUxuM2JhUW1hLytOY3FQSkVGQ2ZlYmM1MWtEMVJz?=
 =?utf-8?B?K01qS2JVd0J2UHhpakcxYlhCWVJRdU10YVNYVk5NaW1VMEVJTUpKNVFWT2hu?=
 =?utf-8?B?a2RlRGlwVVF2VkZjN00zazZYYlJ6c3dLY3RzRmtySldpaFBDSkI2MHBUcVZ5?=
 =?utf-8?B?REV6dUQwWDhrYm1OdDRqRkErTzRQUlZGZzcvZUZULzEyUHpoZXFkV2tXdDFa?=
 =?utf-8?B?Q1lsVUt6clJ2d0wrOU9nMGlKNWdpSUdpTjJuMTFvWGNFRVlmak9xbUdvSXAz?=
 =?utf-8?B?MkpWcVZuWjdmYU9McGl2Tzc3VUtLZ25RclQxeEhMTzkvVkE0Sm5Sd3hPVW9Z?=
 =?utf-8?B?bEsvVXhpY0FBMlRQWWR3bkFxbklQOURZYUJhY0ZGUy9XYnJQL1BPbWQzcGc1?=
 =?utf-8?B?Ylhuekg0d1p2RVlWNkpsNkVoZGUxN09SRWFDMnRBL3Y3N2x0QngyaHcxMCs1?=
 =?utf-8?B?dGxNck1mZDVjcWdLK09sbTllZEZYYlFPcXVvU0hDM2xVWTRGdTVQeWFwL1FH?=
 =?utf-8?B?U0NlcWJkcWVFUnNxdEdON01zVE9ySFJ6bEhsbHpDa0IzMHBwcFRvRmw1TER3?=
 =?utf-8?B?LzZxN3plb00vL1FXdmdRVit4RkxJc1k2cHUweHd2ekVPdk9XejAySHFPdEhl?=
 =?utf-8?B?enlURzArTVkrWmpEL0pJcWZHZ1Fqanoyc3YxeHZRVVFBVjlXemQwZXR3VXdX?=
 =?utf-8?B?SUp5bURXa3REOVpjcmdkNyt6RzMvQmJrM1prY2NhWEFHNjVkWm9jckcxY2h5?=
 =?utf-8?B?aDZCQm5vdUwzWW95SkpXS25Md0lzQVJ3d0VSR3VxMVBuclNaMGw5ZmNPT21V?=
 =?utf-8?B?SStJR1BGZ2Q1UVJZaEpBNFpVQWcvZkpBWVVIdFVRbFlDQUNETktNNmNDNWNm?=
 =?utf-8?B?cmNIWmtJQmxScCs1STN1TkR5SWlTd08vdmJ3c2FzdlcyQjY0ZHpGeU04UWFR?=
 =?utf-8?B?Zk1sUWFzN0dmMldaOXVmaXNIUW9iSTN4YzVkeVJ3TE0xWWdKUUh4bkVKRXVZ?=
 =?utf-8?B?UDN6WG5QeU1GZUxHYm5acmJuOUpVSnVlU05idnFMTS8vQnVLeDB2Mk81KzF2?=
 =?utf-8?B?ZFhzTmxJNU0zbCtkMHFFcjFMbWl5bUNldGRaR2xOdHl6UWFDbXFmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AD5D54CEC78BB4C95612CFE27490594@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b864cf-3ece-4b39-9cc3-08d9e7bce9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 09:01:21.1369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THEtpFfRnnp2NV5nixoH5B/jD2KnKqBe5+w5o519nCTpYcv437kuuLQaOdQS7XTxNzLmU/VzBx5k8JjNRSfeOZ/aHZk9Js1DZraeeJJvw08J4jktUy2r84WxjLlLa3Hl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2786
X-Proofpoint-GUID: NYVlNNvTQXIcCk-4DRr7Klud4GI6tfql
X-Proofpoint-ORIG-GUID: NYVlNNvTQXIcCk-4DRr7Klud4GI6tfql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040047

SGksIEp1bGllbiENCg0KT24gMDQuMDIuMjIgMTA6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGksDQo+DQo+IE9uIDA0LzAyLzIwMjIgMDY6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IEFkZCBhIHN0dWIgZm9yIGlzX21lbW9yeV9ob2xlIHdo
aWNoIGlzIHJlcXVpcmVkIGZvciBQQ0kgcGFzc3Rocm91Z2gNCj4+IG9uIEFybS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4NCj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+PiAtLS0NCj4+IE5ldyBpbiB2Ng0KPj4gLS0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDYgKysrKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMNCj4+
IGluZGV4IGIxZWFlNzY3YzI3Yy4uYzMyZTM0YTE4MmEyIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL21tLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+PiBAQCAtMTY0MCw2ICsx
NjQwLDEyIEBAIHVuc2lnbmVkIGxvbmcgZ2V0X3VwcGVyX21mbl9ib3VuZCh2b2lkKQ0KPj4gwqDC
oMKgwqDCoCByZXR1cm4gbWF4X3BhZ2UgLSAxOw0KPj4gwqAgfQ0KPj4gwqAgK2Jvb2wgaXNfbWVt
b3J5X2hvbGUobWZuX3Qgc3RhcnQsIG1mbl90IGVuZCkNCj4+ICt7DQo+PiArwqDCoMKgIC8qIFRP
RE86IHRoaXMgbmVlZHMgdG8gYmUgcHJvcGVybHkgaW1wbGVtZW50ZWQuICovDQo+DQo+IEkgd2Fz
IGhvcGluZyB0byBzZWUgYSBzdW1tYXJ5IG9mIHRoZSBkaXNjdXNzaW9uIGZyb20gSVJDIHNvbWV3
aGVyZSBpbiB0aGUgcGF0Y2ggKG1heWJlIGFmdGVyIC0tLSkuIFRoaXMgd291bGQgaGVscCB0byBi
cmluZyB1cCB0byBzcGVlZCB0aGUgb3RoZXJzIHRoYXQgd2VyZSBub3Qgb24gSVJDLg0KSSBhbSBu
b3QgcXVpdGUgc3VyZSB3aGF0IG5lZWRzIHRvIGJlIHB1dCBoZXJlIGFzIHRoZSBzdW1tYXJ5DQpD
b3VsZCB5b3UgcGxlYXNlIGhlbHAgbWUgd2l0aCB0aGUgZXhhY3QgbWVzc2FnZSB5b3Ugd291bGQg
bGlrZSB0byBzZWU/DQo+DQo+PiArwqDCoMKgIHJldHVybiB0cnVlOw0KPj4gK30NCj4+ICsNCj4+
IMKgIC8qDQo+PiDCoMKgICogTG9jYWwgdmFyaWFibGVzOg0KPj4gwqDCoCAqIG1vZGU6IEMNCj4N
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

