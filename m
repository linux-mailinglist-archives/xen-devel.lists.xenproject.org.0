Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB084B69F4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273027.468070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvWW-0006Ov-Co; Tue, 15 Feb 2022 10:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273027.468070; Tue, 15 Feb 2022 10:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvWW-0006MZ-9V; Tue, 15 Feb 2022 10:57:32 +0000
Received: by outflank-mailman (input) for mailman id 273027;
 Tue, 15 Feb 2022 10:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJvWU-0005ps-E2
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:57:30 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 105add5b-8e4e-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:57:29 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FAk7ku031453;
 Tue, 15 Feb 2022 10:57:24 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e89njg8yw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 10:57:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3736.eurprd03.prod.outlook.com (2603:10a6:209:2d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 10:57:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 10:57:18 +0000
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
X-Inumbo-ID: 105add5b-8e4e-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8FBanfp5qEurTvx3l3qX/3WTsVDKAHl60YTTT9ZiX6wjFYQ+iJSSlr8Ndmv0W5q6hJ7gxX03rCkX+ZF8OlDhIcUddDL1w2VdaUHCLmY5nzEMsDMyGJNj5VG1YBYLjm3gsuhq6facJaqmxQfFngsTOat46Ub27jSKhc2gwfc+bSaVeQoqU60CDWBydPGo3eNw9YnU+5caxTPaHPxRAXDoOOk+jtxwta1Fq0AM7F27iLZWQEbxbmagjN4lDYLwtB+SIjtFO2PYjegoLDV/xkLO4mW5W04nvllPYeimyBmpitjdz8fl1/IZaTyvTVtm4XBUi7Gc6ZWIZfxfkuR+Gi7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFK5m9+VxwITfMlXzjygmB9ipTvuiWJCSP5a1hzhxvM=;
 b=D0wYGoYrx5T/3e3QNrAyLDflcUQ0RbhY0FfKZsS6govbQWqITYfQ2HNSWpyakygNWNEOZp9TtZGT7sZEf4fID4RfOvtMueGbnSm0wErlzLLY7Ffsa8ByXKW15Ap+8jRt8MY2COKhJ1WpfTzgO2vthCXEzzz/hc9zSrQZG/nSxgJ+ulhH8j7JY0KhiMRarUEHNcbfaiT68GaFJUvui2wN2Q9SxJI+mXnZQVog12P1BkgnMJbbYoKaMogvjj2Q/m8W8IQke3ZEWZLzaS1bE0+p4+8Mw9ZekUJlfWyQvtMGbmvX4ktP1fQZ+Ozz40n9G/zZDh56GjHZroZprokjVsc3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFK5m9+VxwITfMlXzjygmB9ipTvuiWJCSP5a1hzhxvM=;
 b=QkKgO2ZnOwIHZkCmpYXt9horrLuSNvazQ4d+gxzSv1WfI84/26jRXsuHqKjpKQeQhQlfM0ONMY6taJQCR+I0xAJ5pIK5OlWmGCvkPtV169vvJjFKtbd4+omcW/WFsbHhNUS1o0NcGIcCSZ327/QFBmhAioI7cStdVnzxCmJRbxxYRl2OW5H7ifA5EuSOizjKtxUXKiRbjFDD8S1Y2wOExP1s17/YdaHKSILLoNPFq2kDb7VtwE1D6cVE4Hct6aCoLXeJL5UyURhMS2tMhrJBzzJ6LCzChmqTgMnrHiX3lTR4enVkC6vorVidi+o0AIHhKNmojr1k7XqZ3DVN0YICXA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAACiYA=
Date: Tue, 15 Feb 2022 10:57:18 +0000
Message-ID: <516c4fef-2a3f-7358-8997-5dfdc11292ea@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
In-Reply-To: <YguE7RWOteSnvVNY@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23e9e70a-ee8b-4050-1166-08d9f071ef0f
x-ms-traffictypediagnostic: AM6PR03MB3736:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB37363BB1461322882DFF8CC1E7349@AM6PR03MB3736.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 839innFHo/71q8UukC5VR4Rct03Re/0LmQSlJFmG1AOWY4OfAmlfSoK23bOz0Tu2v5ospgwArBt5Wkb4sD+KXGkPH5tfSrSVLNwWBQaow9feSxboUZ05PvBvgO+ea3ojfTkcoQ0F+hu/0VcJkA8F0UOpwFTJ1+psTjvRiPYHbyxx4+DiSuuVK4QKudNUVDSlp25agVirKwnVqzSH076mmsilv+Q8lReDRL9PH1Er0u6xs8LAG5utkMXeK3pP4TZeWpnFzur33gheonnA5eYenQvcqqVatIRsS5HDascFURSSanKVjI4oJ/o4N+jLya9H1Nb20mKzoCz35JmHBnC0YpPLFcRgw6sDE5M2AqfHg98aQ1CkEaxk/nO3ZgbyF5QAMISzhc21liwlLRfkp+5QLFSb6p0ZxH0Zr8iN/u94Iq3V6jtJ+dJ4JmHWmLW77Jx2HsbfUcjuV9//2EiJm7jdcvhDwANKiQjViOiF6yzqYDeTy64kJnqL4Uuo9iw9tXT+Wos0AOzGXgJfR5CQg/2NSVUpBgnNirxINQIfS1X1ov9DGLADmmJ8uiKfrzFxWycv7jb7HZ6NxuIs7YQVOZgmamCWaTa0bbW/evz+44lCX8igW2p6Td8EfyZRUdkghjb1X/VAoLH8gweJF4H1oci9idHxQLjIFKRmo6M/AhAsCTC9btW7W6dzyOnjK1LDuYLOyDh9UXMUKcA6UOsYh9wyazjo8yP8if5CrtlGRC+IZHW51M6YnS2H/jcdvi7+nvnp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(71200400001)(55236004)(53546011)(508600001)(6486002)(6512007)(54906003)(6506007)(38100700002)(26005)(316002)(122000001)(6916009)(2616005)(38070700005)(4326008)(66946007)(107886003)(83380400001)(86362001)(31686004)(66446008)(5660300002)(66556008)(8936002)(31696002)(36756003)(76116006)(8676002)(2906002)(64756008)(91956017)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bDZuVENDK3BsOVloQkNQWGxSZTN4U1dadHo2eVU0TGVjSHR4MWJlWGd6eFli?=
 =?utf-8?B?RjJVVTVSd2FWdkpMeUdEVzAzSlZRRDJNRENJNUdwY3MxT2tjMDc5NktVblFQ?=
 =?utf-8?B?blNJbEJXYXVEVjVaYm9MdG1obEIwSXh4eXc2b0ZTekpIRzBaRnlkMEcxcUx2?=
 =?utf-8?B?dnNxbEt4bFJzMUFTUmRmNEwvWFlBYjU5ZHk3Vit1ZFdqMGJwUCt4VlovQ3dG?=
 =?utf-8?B?bk5rM0xmY2NLOUFTSGV1a1ZzeXpFYzMrMzgvMUxHUHN1aU1ReUdYNVBuNC81?=
 =?utf-8?B?STJwOTZWc3lGNjVQeUU0R0JRaTU3STUweDlUOGlrcmN5cHovREFBNlkrVFo5?=
 =?utf-8?B?YXpCajBiTStrVllscjlMODEwNmlOekxNUnJlaWpMWkVoMVlHcmthNnJobVp5?=
 =?utf-8?B?M3FFYzdVd2JjMm5xUXJZV09RNWNLMmhYc21kNFF5VGtjMXRMeThaTTcxdktl?=
 =?utf-8?B?STI3cHdBR1Y3V05Xbk1mTFZyTTMzNEpvTUhxOGQvK3lPWERvdzJuV1J4dU9Q?=
 =?utf-8?B?ckd4ZUNTRjlWd0Jsb200Ky8yckIxbW9wNmUvdlkxYUtyR3NBZXhkdkNtSUV5?=
 =?utf-8?B?V1dwTVNYUDQrT2lncjd6NlJZVS9nT2ZmQmF4REMxOU1WcWJQUDlNa2tPbmdB?=
 =?utf-8?B?Vnp1NWQybXNyZUFDWHlQU0dRWFJpTGZhM1Bjak5JTnE0WDJ2OXFWR20raW1w?=
 =?utf-8?B?TFZodDBuZUtjSWFOaUJCUDRUY3l5M21uZkdhRTZNZmZzK3FwbzBaWVhzZmpH?=
 =?utf-8?B?Mm5sWUEwYU1KNm0vcFZIUVpLc1JOTC9nRnlTamc3Qm9iZVR1V0hSalNJbEs3?=
 =?utf-8?B?dURkSmZEUGsxdTU2NG91TWJCVlQzVXVncktWRThFRkg4cFRUK2V0d0hYWmRU?=
 =?utf-8?B?NHYxRnJRellDa0pjU2hBTjVoOXdNME8vSGFtR3pBdVk1eGtWWEZUaE4xUW5t?=
 =?utf-8?B?bGZudmxHZEhYaHM2amEyMDZ2eHRmSW8rd0lsV0d1a3VITUpveXNrUUo5dmpJ?=
 =?utf-8?B?bXlYTmNOV1JRdHNlaTRQd1lWZE50dDdBc3hXdkNWcGRycmRMMVdtdENrYlFR?=
 =?utf-8?B?TDY5bnNkU3FYenFBTTFJakhHM2JWR29KWGNaWkZEbU4rdkFMVGJHSG5MV2R1?=
 =?utf-8?B?UkVvVWpnazcwc0hJU3NXQklOaTB1NCtJQnVuS3VleU9tYkxrZk00ZGVFTlRV?=
 =?utf-8?B?d0MxK1U3Z0h6S0ZxSFErRlVjWGEvejBjQUNIWEZpT3Z0dDZXWnZBRS9YTkJ3?=
 =?utf-8?B?R3RSa0xpYTBqbUxIejd3QVV1bHBQWTJMcjcyWXNwVy9TaEplSzZQdENFekJ2?=
 =?utf-8?B?cFlhK1lYTzVZdStKU01xREZSNEdKV0VvTXBGc0tWbVIvZVRIUmxVU0dwM0hV?=
 =?utf-8?B?SFdlbEFNVHoyeS9EaTFUbzVGWEZaZDBybCtTWjJrZjRxREwvYUdmVU1hMlhO?=
 =?utf-8?B?S3F1cERicnF2cTAxRFpVa2RvUEZyQmRXRzJ2eVh0U0xOSXFSOVhUcjdjY3Ur?=
 =?utf-8?B?K0hQbG5RRWpLOGVrWmNKYTU4MnJYRVU2ZXE5dVpjeWRLeUwxVS9mSWIrZnVs?=
 =?utf-8?B?eUFJbE56Y1dHMFpqZEw0SCt5aEhMU2FXUHEvZndZbHNtOHVrRWRQWEl0YnZs?=
 =?utf-8?B?RzF2RlkrVlI4aEZDTXZxL25hUVZjQmFuK1FIYjRNWWZVNmdCc0dTQkNjSGRq?=
 =?utf-8?B?MEhQVlNySDg4WjFBeVFCcU1ad2pMbUVOTUxqNVJDVkw0dnh3S0I1VDJUckhU?=
 =?utf-8?B?NE5tRHVyM05PYktPQlVmb0tQMnV1VHdvN0FPandmSnhIY3NreVlHRWFlRFhp?=
 =?utf-8?B?M0h2dllLMXZVVnhqcG1TVXRNMTZLNkpIMTgyOUpXSnd2amhmOTJxZEpqTFN2?=
 =?utf-8?B?S3UrRGMrZVhvOWZLT3NXZ3dzS3luazV1aTJNRW9TblJyTXJtUHdNVTZjVmox?=
 =?utf-8?B?cXZHcUY3SFR5WTRwdjA2WWVZdWR5dXBkclRoTnpaa1ZENXAvN0R6QzFVMGVT?=
 =?utf-8?B?NWkycklaN0NENnVCN2YxOTkzWGNjTkRNOXY4NHpPVkh6UHdReWkyUmMrekZJ?=
 =?utf-8?B?cHA2aWtUMkFwWEJHUjR0d3NUS0ZGL016K1cvWlR4MHZkNlJBWWUrSlhJVmNl?=
 =?utf-8?B?TGVJbVIvaWNoWFdodlNoYmZFR2czUUNoTGR3ZTVqZ081TFBFbjB4S0laMDNO?=
 =?utf-8?B?UWp5UUp6OS85aDVMVVBxVE9TTk1kMTBlbU5jSC9RZ2JyLzIrY2owcGxFc0Za?=
 =?utf-8?B?QnpQU0hPZ2RFT3hRSTNhSk9kWWxZZ3pLbEFibTVEVG1hSjMvaGZZU0pBN0Na?=
 =?utf-8?B?SDBGTStDM3dFM0FvZHBFUEp6ZHRYQUlZVHlhcEcrYVVGc1FzTWtFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB1EF6B1EC2F4E4E98FD62AE0D2F537B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e9e70a-ee8b-4050-1166-08d9f071ef0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 10:57:18.1255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQc2LUuT1Q68KKTElzm679tLXqRglqYqe9uhNZK6MwckzMpmb4Lj4o0qrzsdLgbNejXtrvxffw48z9EDysWVIcqtKLCkrhKzwDaUlD6Ho73yC/35w024ENx0+axHfiSP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3736
X-Proofpoint-ORIG-GUID: u7wZc7gwzmuPEV-1393EeQieJmBeKuye
X-Proofpoint-GUID: u7wZc7gwzmuPEV-1393EeQieJmBeKuye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=923 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150062

DQoNCk9uIDE1LjAyLjIyIDEyOjQ4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAxNSwgMjAyMiBhdCAxMDoxMTozNUFNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4gQEAgLTkxMSw3ICs5MTQsMTEgQEAgaW50IHZwY2lfbXNpeF9hcmNoX3ByaW50
KGNvbnN0IHN0cnVjdCB2cGNpX21zaXggKm1zaXgpDQo+PiAgICAgICAgICAgICAgIHN0cnVjdCBw
Y2lfZGV2ICpwZGV2ID0gbXNpeC0+cGRldjsNCj4+ICAgDQo+PiAgICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZtc2l4LT5wZGV2LT52cGNpLT5sb2NrKTsNCj4+ICsgICAgICAgICAgICBwY2lkZXZz
X3VubG9jaygpOw0KPj4gKyAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZwZGV2LT5kb21haW4tPnZw
Y2lfcndsb2NrKTsNCj4+ICAgICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7
DQo+PiArICAgICAgICAgICAgcmVhZF9sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsN
Cj4+ICsgICAgICAgICAgICBwY2lkZXZzX2xvY2soKTsNCj4gVGhpcyBpcyBhZ2FpbiBhbiBBQkJB
IHNpdHVhdGlvbjogdnBjaV9hZGRfaGFuZGxlcnMgd2lsbCBnZXQgY2FsbGVkDQo+IHdpdGggcGNp
X2RldnMgbG9ja2VkLCBhbmQgaXQgd2lsbCB0cnkgdG8gYWNxdWlyZSB0aGUgcGVyLWRvbWFpbiB2
cGNpDQo+IGxvY2sgKHNvIHBjaWRldnMgLT4gdnBjaV9yd2xvY2spIHdoaWxlIGhlcmUgYW5kIGlu
IG90aGVyIHBsYWNlcyBpbiB0aGUNCj4gcGF0Y2ggdG8geW91IGhhdmUgaW52ZXJzZSBsb2NraW5n
IG9yZGVyICh2cGNpX3J3bG9jayAtPiBwY2lkZXZzKS4NCkluZGVlZCwgSSBuZWVkIHRvIGFsd2F5
cyBsb2NrIGluIHRoaXMgb3JkZXI6IHBjaWRldnMgLT4gdnBjaV9yd2xvY2sNCnRvIHByZXZlbnQg
QUJCQSwgZ29vZCBjYXRjaA0KPg0KPj4gICAgICAgICAgICAgICAvKiBOQjogd2UgYXNzdW1lIHRo
YXQgcGRldiBjYW5ub3QgZ28gYXdheSBmb3IgYW4gYWxpdmUgZG9tYWluLiAqLw0KPj4gICAgICAg
ICAgICAgICBpZiAoICFwZGV2LT52cGNpIHx8ICFzcGluX3RyeWxvY2soJnBkZXYtPnZwY2ktPmxv
Y2spICkNCj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+PiBAQCAtMzIzLDEw
ICszMzQsMTggQEAgdWludDMyX3QgdnBjaV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQg
aW50IHJlZywgdW5zaWduZWQgaW50IHNpemUpDQo+PiAgICAgICB9DQo+PiAgIA0KPj4gICAgICAg
LyogRmluZCB0aGUgUENJIGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4gKi8NCj4+ICsgICAgcGNp
ZGV2c19sb2NrKCk7DQo+PiAgICAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBz
YmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOw0KPj4gKyAgICBwY2lkZXZzX3VubG9jaygp
Ow0KPj4gICAgICAgaWYgKCAhcGRldiApDQo+PiAgICAgICAgICAgcmV0dXJuIHZwY2lfcmVhZF9o
dyhzYmRmLCByZWcsIHNpemUpOw0KPiBUaGVyZSdzIGEgd2luZG93IGhlcmUgKGJldHdlZW4gZHJv
cHBpbmcgdGhlIHBjaWRldnMgbG9jayBhbmQgYWNxdWlyaW5nDQo+IHRoZSB2cGNpX3J3bG9jayB3
aGVyZSBlaXRoZXIgdGhlIHBkZXYgb3IgcGRldi0+dnBjaSBjb3VsZCBiZSByZW1vdmVkDQo+IG9y
IHJlY3JlYXRlZC4NClllcywgSSBrbm93IHRoYXQuIEJ1dCB0aGlzIGlzIHRoZSBiZXN0IEkgY2Ft
ZSB1cCB3aXRoLi4uDQo+DQo+IFRoYW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

