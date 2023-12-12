Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A110180F1C5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653257.1019717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5Dv-0008KR-JP; Tue, 12 Dec 2023 16:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653257.1019717; Tue, 12 Dec 2023 16:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5Dv-0008Hi-Gi; Tue, 12 Dec 2023 16:03:07 +0000
Received: by outflank-mailman (input) for mailman id 653257;
 Tue, 12 Dec 2023 16:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKsX=HX=epam.com=prvs=6710380681=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rD5Du-0008HW-1w
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:03:06 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee20ef90-9907-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:03:04 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCFMiOQ018897; Tue, 12 Dec 2023 16:02:52 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uxp2xh3uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 16:02:50 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB5PR03MB10049.eurprd03.prod.outlook.com (2603:10a6:10:4a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 16:02:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 16:02:46 +0000
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
X-Inumbo-ID: ee20ef90-9907-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENQJ6cdLi7EGbCFUy0jcHdVyKXf/YBTd9xRDsV9ApOxZ2rAXPkhJJNMEyygmd44VSuaLyxNT2uV/i1/SMAVZ0CTFnOcz1btaj/EB62XRGL7/ppbAzTEWgagT4/iRtOjp8zvatrS5oMhcljxa2lPJtg/+QPgl6ZHcm/kREbubrS2EJdtbLsWoOPaiWLQ3TgcbQ/cSh9SsmQjMKyYiKzaIPnhYrx3FLOn9jx5/tzMiJSoBCb/cs1tYDXd4Qs8AUK6e9NH8nSt6zw/cpSWj6QFZiACnyfIH4bBSEvDo5O3g8Aca1CUf13rgaZEdSM4qCqJ11BbX0FKhyTaHHGFmLbK4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU1oUH1d8zFL8xmrruy+aPayRsVnL/j6bzG3pXleM2E=;
 b=XMbVT6GnuLi7rInVmblGq5XFFR+ss9oPZ9UgTSJ2XCI+44glFAr6pXjhe6n/ucpkB8jCN34ZbL5GcVmAVWZkbd2cUViKfenmn26JXX5ZiS7XoEw1v5lB6mPl2ULNf9RsEScmLxv/cC0m4hC7RckGiu78HtHxE5B+5KQ5WwLUISSt7bKdJryHm/L8s3GI/ZL11XbHHX8bcg+C0+zdHtujiR9QHMjb8R8bFxd88jEARriLRDWn+k0kXDVoSzL5q2Kenok3Ryr/CgNCXIKXLAqh1ZrLWmo55FH5NkDb4Z9JMhgkvekXXbk7LWy9B5zJcB10zG5BgwChPV4wX79x3vwDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU1oUH1d8zFL8xmrruy+aPayRsVnL/j6bzG3pXleM2E=;
 b=hnCdwMYaWaF6S2MvnfxiuDfHJ2ydfjNqBDzAnf86FkQI/HSMd9hlPZQsmBKeFBLt8uiuYV3SZBA36FQ87TQsFuAS0IV27Vd5OHJQ8qLicwYVacE/wrg1hMj/TEWT54In0rOXFTfNQ6SV4YYczUt1Ks5K8gJTqKy/Ixegz/oarJhGCLi992GVgv5lFThxDzXGZf1Uu6A/TZS64q4N5rU3xGwFqle38dMYrp5houDQ38ZlJ0zWg8LDE3Li0DJd+4szYtHaBUxPN6GJN01Low6mxXejgar4NnEkxwpF3yIQHryBe29qSQUreHnXv6aXbsoRDVwWSrbukZn5NudXj+KJRg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Vikram Garhwal <vikram.garhwal@amd.com>,
        =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
        Michael Young
	<m.a.young@durham.ac.uk>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] fix qemu build with xen-4.18.0
Thread-Topic: [PATCH] fix qemu build with xen-4.18.0
Thread-Index: AQHaKijL3WADPEA59ECvZnvE/VRP97CluD+AgAAUgoCAAAP2AIAAAvkA
Date: Tue, 12 Dec 2023 16:02:46 +0000
Message-ID: <87plzb76je.fsf@epam.com>
References: 
 <277e21fc78b75ec459efc7f5fde628a0222c63b0.1701989261.git.m.a.young@durham.ac.uk>
 <ZXLg_YCHM-P6drQV@redhat.com>
 <alpine.DEB.2.22.394.2312081422490.1703076@ubuntu-linux-20-04-desktop>
 <8be72952-88b6-4c74-b696-fecfa8313c96@perard> <87wmtj77sl.fsf@epam.com>
 <CAJSP0QUytnP60HyWwG4AhjMZwCS6b+pJJm7AOWd8P8pu1SqJ=Q@mail.gmail.com>
In-Reply-To: 
 <CAJSP0QUytnP60HyWwG4AhjMZwCS6b+pJJm7AOWd8P8pu1SqJ=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB5PR03MB10049:EE_
x-ms-office365-filtering-correlation-id: fe4b8cb4-71df-4818-3316-08dbfb2bc84d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FQel1a+ZsRTOg4tpoR0+MerGeTlNVqnGCceShmCD6un1sYZFe8v7cZg5b0yOHuJ0pXvLj/VHCWwvIQzlKCI3d9wXqA5hbsQ1UUeQXrmaR8/gI5TOFhtybzPjU1v+hVWwPm4fpppjHlkvlHJxIAvZviT76rmnxU71UO8Kbw5qseP6ZXX1W3cZpzCj/DE6EoT/BiK4wOq5mbaklJrjZWMO2uZbYMO0UAmXgcLhLki3bo7d5yGu8fEx6iSiIQEu2XhEQm6tzSjX3R9hJqOuLC7xSfZqnbPod+/idXG6xOwkPTSh++FCtR0FZnICvei2P3vgE1Uilnn8t8HOlACJOQi1DWKEZWP42YSE9aJfCqokniBdyi+43vw/E7zOgr5aTtcUbgraOsPpvhED4BO62/2tWd9P0EpqiMHmzMMzQQ22tTLccsm01V3LVBrscmcRuXYOWIaelNsjkmxsiVZ7vvJPrBDTYTlr4Bp9y0hnp6XY9jMO1WRNXQirKZRSxzXmtB231fMcCXk1AyBTlHWvAEwlc3Gts0mGamWlSxtxNbe3g9jS6dYXmg+ucDx9YSHNQ0feS/JaRTQ0o05r/GUrsB3ruwhHRUCGewFTWRLbHmnw7EI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(84970400001)(26005)(2616005)(38070700009)(36756003)(38100700002)(86362001)(122000001)(6916009)(83380400001)(5660300002)(55236004)(6506007)(6512007)(316002)(76116006)(2906002)(66556008)(41300700001)(91956017)(966005)(66946007)(8936002)(8676002)(66446008)(64756008)(54906003)(6486002)(66476007)(4326008)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkIwejFvRmtiQ1gyeFFYdjZRTi93cFY1WVJDb3V1VG1oWklORm05YThjNlhJ?=
 =?utf-8?B?eWJFSFRGY2RZRGwzNzE5OGlmZ0VHcnlyWjQyYzRRVnNYSzdlS0RUellQOG9L?=
 =?utf-8?B?SmwvOEFuNFdxL0xwKzMxRGlTdkhzYTFMK2FyYkNkSWNjYjlVK1VPWjFyL0hY?=
 =?utf-8?B?Rnk1WHVBOWErdlpheGVHeHNBakR4NFdQalJiZHIwMkE4aHlzOGUySERzQ1Aw?=
 =?utf-8?B?cHB1UTI3V1I4QndUVGtDdk4rWmsxSFp4dlFFYWhkcXg1K1VIVlBjN1lBNHJs?=
 =?utf-8?B?ajFIR0dUdSt5ZnBORGdWUlk4dTBoR1hoeGg0SXhRM0VZanhjTFdYMEVlL3J5?=
 =?utf-8?B?Q21CMWNTL3BPRmpqMm1hbWZ1UDhTM0M1cmZyRGxld1UxdTY4UlhwdDNTZUVQ?=
 =?utf-8?B?YjVzalZXR3BzaWVVcW0xQkxFNnhaZmNtakZGNUhKR1FTczZIcmFOMGQ0V2Jo?=
 =?utf-8?B?NjNVMzQ0VG5hTkFrdWRDVVJzZWZWTE1ZTld5RCsyZTY3QVl3MU1XVm9tK3pm?=
 =?utf-8?B?ekRkK3JhYXhMVVQ2RU1CMWhzRkZiMmJqbnBBWTN6MDVyYm1ybnZwR002dU8z?=
 =?utf-8?B?R0VQMmp1QThMZ2lqTjJ0TXlaN0V2NUVZakZ2QjdZeFJ1TXhVbjAxM3BBV2hV?=
 =?utf-8?B?dmRMRWd6Vk9QM0ZpaEVwZSs1S1pXcVE1ZnRhMTUrZzVlTTUzbzlQbGZzZFZ4?=
 =?utf-8?B?S2lSSTFKKzJ0SU5VeWZWS0JVdWVpUlRweVVkaktZRkpEVmYwZjRuQlM3ZUFw?=
 =?utf-8?B?TTZuS054dDFMM2QwRzJUNlFNUmZEZlRVSkJwL0Fjb1ZFUHYzOFF5Yk5rWHBo?=
 =?utf-8?B?ZTlUbVFUeFF0ajdXTUFJWHR2QzJmRDMzaWRRdWhYS0IxZTEySVVKa3dKQjZv?=
 =?utf-8?B?S09CN01RNUwzOVZsbzlFaVoxRkJuRFA0U2FrL3BSeXJDZXJPUWpSQUN6QTV2?=
 =?utf-8?B?dGZPV0xqVUJYVFNMTkhzVHV6NVJWeExScC8vTU1rVVBxTUlOT0l5cjFjZEVK?=
 =?utf-8?B?MnA2RlQyd3BBMEpVT2ptUEhNUGtKZmhvODlySUR1YllkblRuYW55OGZuTzNV?=
 =?utf-8?B?U2ZyV0hGbzh4UEpSVzdxT3NSMW9VbXQvZDNhUTlQV2JkVmt1NGFoeGRhWW1S?=
 =?utf-8?B?TXh6Tk5kdEJvYjZ5ckJMRWI3RVJyenFYRjJoWVBIRWZaMkFIdWR4VU9BUGdv?=
 =?utf-8?B?T3RSWTVIQWJ5eWF5TGtIMUNEWFVROFBVZ3Z3ZXBTMXRsa1dXVC84KzF1M21L?=
 =?utf-8?B?Q1RJbnk5bEREMHZGWkJTOGJLTm9xcjZzcjZYazcwTkhnTDlFQ0tYS0FYQVBP?=
 =?utf-8?B?cjAvRlBjRTZ6WHhuNjVqTFdjdWJqY1NqcUlkZ3NRWnBoUWkvNDBXbmZYcFVm?=
 =?utf-8?B?My9pczNBRDNoWTZlZWpXK0M1MkJCSDJNVzV4b3llZWhoZVMzUzN4RyswWWN3?=
 =?utf-8?B?aklRWVpHOExicCs5ZDQrdFNSS3RkQUc3dGdmeU9kRXFYbEJ1RzRGWGQ2eHNQ?=
 =?utf-8?B?WE5IcXF0NkdpeU4wd2F6U1pRNUt2aXd6RkhkNGZUc0RQbVFvM2Q0V01wdy9X?=
 =?utf-8?B?WGxrRUgwd2FIM2lCdTRDUFkwbTRaZ1RKTDE0SEVIVnVRalpSV28rTTRIMyt3?=
 =?utf-8?B?dCtGaDdGSTVIUHhkVW5hb25ldnJua1JiSW1kM3NnL2lKazBZVXJERWhiTjVh?=
 =?utf-8?B?QnczTGM0aHRabm5kZzBBdHlSL2pERDBLTTU0RDNaRlRTN1hKSVdpWEtCU013?=
 =?utf-8?B?UXFSNzhycGJvUkE1ajVhSlJwSkZaMXJaY2pnQk5BWU96VjRpUHBvNXBsdjJW?=
 =?utf-8?B?TDZoS3pvd0hGVlNGd2VTMkU2akhVVWpwKzlhNHlDM0ZrUjVxVHlUM3lWcm5y?=
 =?utf-8?B?ZlVDcHFDRDJocjBYSVk2Qjgzd2wwNWJwbC9jUnM1NDZGdnI2aHFXOWhSTE1S?=
 =?utf-8?B?WG4zaVBGQVFtQ2FPWFVMUnEzOEJlbTJ4WS9GWWFPZGs4UnNvUlB0aHY4VFJh?=
 =?utf-8?B?U1V6WnVXS1pXWXU2V2s2bnZqcjZTNjV6MFZBU0R4VDRwanF5V1Rxb3AyMUJX?=
 =?utf-8?B?Y1Y0WGJyZFBkTVBaSkp3cHN6MW5nUDBhelVTRlRpZXNLbGhkRFVBSENmMVcv?=
 =?utf-8?B?SG04N1FBYnhxZStMVXFZNzlrNDlKcmQ5TjAycnZjNVc3T3lRYklNUEczTGhK?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14D114E0AFD6184880F6A445A5B35090@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4b8cb4-71df-4818-3316-08dbfb2bc84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 16:02:46.5370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8UkzxoPhciN5Ij7b+galhKH7419Ymge4ep6AXCirdDHCllhr/9Pk6Iq5EMozbOYeQwOb2i6vTHmmqV60X5VhV0nWD/b79mL+Xk7zT4wRPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10049
X-Proofpoint-GUID: 4g_17uf2VOTZWJq7LFWGtJFlu-R7_xsK
X-Proofpoint-ORIG-GUID: 4g_17uf2VOTZWJq7LFWGtJFlu-R7_xsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120123

DQpIaSBTdGVmYW4sDQoNClN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAZ21haWwuY29tPiB3cml0
ZXM6DQoNCj4gT24gVHVlLCAxMiBEZWMgMjAyMyBhdCAxMDozNiwgVm9sb2R5bXlyIEJhYmNodWsN
Cj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPiB3cm90ZToNCj4+DQo+PiBIaSBBbnRob255
DQo+Pg0KPj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyaXRl
czoNCj4+DQo+PiA+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAyOjQ5OjI3UE0gLTA4MDAsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+ID4+IE9uIEZyaSwgOCBEZWMgMjAyMywgRGFuaWVs
IFAuIEJlcnJhbmfDqSB3cm90ZToNCj4+ID4+ID4gT24gVGh1LCBEZWMgMDcsIDIwMjMgYXQgMTE6
MTI6NDhQTSArMDAwMCwgTWljaGFlbCBZb3VuZyB3cm90ZToNCj4+ID4+ID4gPiBCdWlsZHMgb2Yg
cWVtdS04LjIuMHJjMiB3aXRoIHhlbi00LjE4LjAgYXJlIGN1cnJlbnRseSBmYWlsaW5nDQo+PiA+
PiA+ID4gd2l0aCBlcnJvcnMgbGlrZQ0KPj4gPj4gPiA+IC4uL2h3L2FybS94ZW5fYXJtLmM6NzQ6
NTogZXJyb3I6IOKAmEdVRVNUX1ZJUlRJT19NTUlPX1NQSV9MQVNU4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPj4gPj4gPiA+ICAgIDc0IHwgICAgKEdVRVNUX1ZJ
UlRJT19NTUlPX1NQSV9MQVNUIC0gR1VFU1RfVklSVElPX01NSU9fU1BJX0ZJUlNUKQ0KPj4gPj4g
PiA+ICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiA+PiA+ID4NCj4+
ID4+ID4gPiBhcyB0aGVyZSBpcyBhbiBpbmNvcnJlY3QgY29tcGFyaXNpb24gaW4gaW5jbHVkZS9o
dy94ZW4veGVuX25hdGl2ZS5oDQo+PiA+PiA+ID4gd2hpY2ggbWVhbnMgdGhhdCBzZXR0aW5ncyBs
aWtlIEdVRVNUX1ZJUlRJT19NTUlPX1NQSV9MQVNUDQo+PiA+PiA+ID4gYXJlbid0IGJlaW5nIGRl
ZmluZWQgZm9yIHhlbi00LjE4LjANCj4+ID4+ID4NCj4+ID4+ID4gVGhlIGNvbmRpdGlvbnMgaW4g
YXJjaC1hcm0uaCBmb3IgeGVuIDQuMTggc2hvdzoNCj4+ID4+ID4NCj4+ID4+ID4gJCBjcHBpIGFy
Y2gtYXJtLmggfCBncmVwIC1FICcoIy4qaWYpfE1NSU8nDQo+PiA+PiA+ICNpZm5kZWYgX19YRU5f
UFVCTElDX0FSQ0hfQVJNX0hfXw0KPj4gPj4gPiAjIGlmIGRlZmluZWQoX19YRU5fXykgfHwgZGVm
aW5lZChfX1hFTl9UT09MU19fKSB8fCBkZWZpbmVkKF9fR05VQ19fKQ0KPj4gPj4gPiAjIGVuZGlm
DQo+PiA+PiA+ICMgaWZuZGVmIF9fQVNTRU1CTFlfXw0KPj4gPj4gPiAjICBpZiBkZWZpbmVkKF9f
WEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykNCj4+ID4+ID4gIyAgIGlmIGRlZmluZWQo
X19HTlVDX18pICYmICFkZWZpbmVkKF9fU1RSSUNUX0FOU0lfXykNCj4+ID4+ID4gIyAgIGVuZGlm
DQo+PiA+PiA+ICMgIGVuZGlmIC8qIF9fWEVOX18gfHwgX19YRU5fVE9PTFNfXyAqLw0KPj4gPj4g
PiAjIGVuZGlmDQo+PiA+PiA+ICMgaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVO
X1RPT0xTX18pDQo+PiA+PiA+ICMgIGRlZmluZSBQU1JfTU9ERV9CSVQgIDB4MTBVIC8qIFNldCBp
ZmYgQUFyY2gzMiAqLw0KPj4gPj4gPiAvKiBWaXJ0aW8gTU1JTyBtYXBwaW5ncyAqLw0KPj4gPj4g
PiAjICBkZWZpbmUgR1VFU1RfVklSVElPX01NSU9fQkFTRSAgIHhlbl9ta191bGxvbmcoMHgwMjAw
MDAwMCkNCj4+ID4+ID4gIyAgZGVmaW5lIEdVRVNUX1ZJUlRJT19NTUlPX1NJWkUgICB4ZW5fbWtf
dWxsb25nKDB4MDAxMDAwMDApDQo+PiA+PiA+ICMgIGRlZmluZSBHVUVTVF9WSVJUSU9fTU1JT19T
UElfRklSU1QgICAzMw0KPj4gPj4gPiAjICBkZWZpbmUgR1VFU1RfVklSVElPX01NSU9fU1BJX0xB
U1QgICAgNDMNCj4+ID4+ID4gIyBlbmRpZg0KPj4gPj4gPiAjIGlmbmRlZiBfX0FTU0VNQkxZX18N
Cj4+ID4+ID4gIyBlbmRpZg0KPj4gPj4gPiAjZW5kaWYgLyogIF9fWEVOX1BVQkxJQ19BUkNIX0FS
TV9IX18gKi8NCj4+ID4+ID4NCj4+ID4+ID4gU28gdGhlIE1NSU8gY29uc3RhbnRzIGFyZSBhdmFp
bGFibGUgaWYgX19YRU5fXyBvciBfX1hFTl9UT09MU19fDQo+PiA+PiA+IGFyZSBkZWZpbmVkLiBU
aGlzIGlzIG5vIGRpZmZlcmVudCB0byB0aGUgY29uZGl0aW9uIHRoYXQgd2FzDQo+PiA+PiA+IHBy
ZXNlbnQgaW4gWGVuIDQuMTcuDQo+PiA+PiA+DQo+PiA+PiA+IFdoYXQgeW91IGRpZG4ndCBtZW50
aW9uIHdhcyB0aGF0IHRoZSBGZWRvcmEgYnVpbGQgZmFpbHVyZSBpcw0KPj4gPj4gPiBzZWVuIG9u
IGFuIHg4Nl82NCBob3N0LCB3aGVuIGJ1aWxkaW5nIHRoZSBhYXJjaDY0IHRhcmdldCBRRU1VLA0K
Pj4gPj4gPiBhbmQgSSB0aGluayB0aGlzIGlzIHRoZSBrZXkgaXNzdWUuDQo+PiA+Pg0KPj4gPj4g
SGkgRGFuaWVsLCB0aGFua3MgZm9yIGxvb2tpbmcgaW50byBpdC4NCj4+ID4+DQo+PiA+PiAtIHlv
dSBhcmUgYnVpbGRpbmcgb24gYSB4ODZfNjQgaG9zdA0KPj4gPj4gLSB0aGUgdGFyZ2V0IGlzIGFh
cmNoNjQNCj4+ID4+IC0gdGhlIHRhcmdldCBpcyB0aGUgYWFyY2g2NCBYZW4gUFZIIG1hY2hpbmUg
KHhlbl9hcm0uYykNCj4+ID4+DQo+PiA+PiBCdXQgaXMgdGhlIHJlc3VsdGluZyBRRU1VIGJpbmFy
eSBleHBlY3RlZCB0byBiZSBhbiB4ODYgYmluYXJ5PyBPciBhcmUNCj4+ID4+IHlvdSBjcm9zcyBj
b21waWxpbmcgQVJNIGJpbmFyaWVzIG9uIGEgeDg2IGhvc3Q/DQo+PiA+Pg0KPj4gPj4gSW4gb3Ro
ZXIgd29yZCwgaXMgdGhlIHJlc3VsdGluZyBRRU1VIGJpbmFyeSBleHBlY3RlZCB0byBydW4gb24g
QVJNIG9yDQo+PiA+PiB4ODY/DQo+PiA+Pg0KPj4gPj4NCj4+ID4+ID4gQXJlIHdlIGV4cGVjdGlu
ZyB0byBidWlsZCBYZW4gc3VwcG9ydCBmb3Igbm9uLWFyY2ggbmF0aXZlIFFFTVUNCj4+ID4+ID4g
c3lzdGVtIGJpbmFyaWVzIG9yIG5vdCA/DQo+PiA+Pg0KPj4gPj4gVGhlIEFSTSB4ZW5wdmggbWFj
aGluZSAoeGVuX2FybS5jKSBpcyBtZWFudCB0byB3b3JrIHdpdGggWGVuIG9uIEFSTSwgbm90DQo+
PiA+PiBYZW4gb24geDg2LiAgU28gdGhpcyBpcyBvbmx5IGV4cGVjdGVkIHRvIHdvcmsgaWYgeW91
IGFyZQ0KPj4gPj4gY3Jvc3MtY29tcGlsaW5nLiBCdXQgeW91IGNhbiBjcm9zcy1jb21waWxlIGJv
dGggWGVuIGFuZCBRRU1VLCBhbmQgSSBhbQ0KPj4gPj4gcHJldHR5IHN1cmUgdGhhdCBZb2N0byBp
cyBhYmxlIHRvIGJ1aWxkIFhlbiwgWGVuIHVzZXJzcGFjZSB0b29scywgYW5kDQo+PiA+PiBRRU1V
IGZvciBYZW4vQVJNIG9uIGFuIHg4NiBob3N0IHRvZGF5Lg0KPj4gPj4NCj4+ID4+DQo+PiA+PiA+
IFRoZSBjb25zdGFudHMgYXJlIGRlZmluZWQgaW4gYXJjaC1hcm0uaCwgd2hpY2ggaXMgb25seSBp
bmNsdWRlZA0KPj4gPj4gPiB1bmRlcjoNCj4+ID4+ID4NCj4+ID4+ID4gICAjaWYgZGVmaW5lZChf
X2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQ0KPj4gPj4gPiAgICNpbmNsdWRlICJhcmNo
LXg4Ni94ZW4uaCINCj4+ID4+ID4gICAjZWxpZiBkZWZpbmVkKF9fYXJtX18pIHx8IGRlZmluZWQg
KF9fYWFyY2g2NF9fKQ0KPj4gPj4gPiAgICNpbmNsdWRlICJhcmNoLWFybS5oIg0KPj4gPj4gPiAg
ICNlbHNlDQo+PiA+PiA+ICAgI2Vycm9yICJVbnN1cHBvcnRlZCBhcmNoaXRlY3R1cmUiDQo+PiA+
PiA+ICAgI2VuZGlmDQo+PiA+PiA+DQo+PiA+PiA+DQo+PiA+PiA+IFdoZW4gd2UgYXJlIGJ1aWxk
aW5nIG9uIGFuIHg4Nl82NCBob3N0LCB3ZSBub3QgZ29pbmcgdG8gZ2V0DQo+PiA+PiA+IGFyY2gt
YXJtLmggaW5jbHVkZWQsIGV2ZW4gaWYgd2UncmUgdHJ5aW5nIHRvIGJ1aWxkIHRoZSBhYXJjaDY0
DQo+PiA+PiA+IHN5c3RlbSBlbXVsYXRvci4NCj4+ID4+ID4NCj4+ID4+ID4gSSBkb24ndCBrbm93
IGhvdyB0aGlzIGlzIHN1cHBvc2VkIHRvIHdvcmsgPw0KPj4gPj4NCj4+ID4+IEl0IGxvb2tzIGxp
a2UgYSBob3N0IHZzLiB0YXJnZXQgYXJjaGl0ZWN0dXJlIG1pc21hdGNoOiB0aGUgI2lmIGRlZmlu
ZWQNCj4+ID4+IChfX2FhcmNoNjRfXykgY2hlY2sgc2hvdWxkIHBhc3MgSSB0aGluay4NCj4+ID4N
Cj4+ID4NCj4+ID4gQnVpbGRpbmcgcWVtdSB3aXRoIHNvbWV0aGluZyBsaWtlOg0KPj4gPiAgICAg
Li9jb25maWd1cmUgLS1lbmFibGUteGVuIC0tY3B1PXg4Nl82NA0KPj4gPiB1c2VkIHRvIHdvcmsu
IENhbiB3ZSBmaXggdGhhdD8gSXQgc3RpbGwgd29ya3Mgd2l0aCB2OC4xLjAuDQo+PiA+IEF0IGxl
YXN0LCBpdCB3b3JrcyBvbiB4ODYsIEkgbmV2ZXIgcmVhbGx5IHRyeSB0byBidWlsZCBxZW11IGZv
ciBhcm0uDQo+PiA+IE5vdGljZSB0aGF0IHRoZXJlJ3Mgbm8gIi0tdGFyZ2V0LWxpc3QiIG9uIHRo
ZSBjb25maWd1cmUgY29tbWFuZCBsaW5lLg0KPj4gPiBJIGRvbid0IGtub3cgaWYgLS1jcHUgaXMg
dXNlZnVsIGhlcmUuDQo+PiA+DQo+PiA+IExvb2tzIGxpa2UgdGhlIGZpcnN0IGNvbW1pdCB3aGVy
ZSB0aGUgYnVpbGQgZG9lc24ndCB3b3JrIGlzDQo+PiA+IDc4OTlmNjU4OWI3OCAoInhlbl9hcm06
IEFkZCB2aXJ0dWFsIFBDSWUgaG9zdCBicmlkZ2Ugc3VwcG9ydCIpLg0KPj4NCj4+IEkgYW0gY3Vy
cmVudGx5IHRyeWluZyB0byB1cHN0cmVhbSB0aGlzIHBhdGNoLiBJdCBpcyBpbiB0aGUgUUVNVSBt
YWlsaW5nDQo+PiBsaXN0IGJ1dCBpdCB3YXMgbmV2ZXIgYWNjZXB0ZWQuIEl0IGlzIG5vdCByZXZp
ZXdlZCBpbiBmYWN0LiBJJ2xsIHRha2UgYQ0KPj4gbG9vayBhdCBpdCwgYnV0IEkgZG9uJ3QgdW5k
ZXJzdGFuZCBob3cgZGlkIHlvdSBnZXQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPg0KPiBIaSBWb2xv
ZHlteXIsDQo+IFBhb2xvIEJvbnppbmkgc2VudCBhIHB1bGwgcmVxdWVzdCB3aXRoIHNpbWlsYXIg
Y29kZSBjaGFuZ2VzIHRoaXMNCj4gbW9ybmluZyBhbmQgSSBoYXZlIG1lcmdlZCBpdCBpbnRvIHRo
ZSBxZW11LmdpdC9zdGFnaW5nIGJyYW5jaDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2NvbW1pdC9lYWFlNTlhZjQw
MzU3NzA5NzViMGNlOTM2NGI1ODcyMjNhOTA5NTAxX187ISFHRl8yOWRiY1FJVUJQQSF5RmdTeEFF
Z1hQamNrRjhwaVN0MFQ3N2JiZWdnU2d3Qy02LXhEdVptenE0YThVN0hFUDhYeEdueHdJaGdBOWl5
RlZpZS1mZFZnQVZBNXdWaXBuZXdiTE5wJA0KPiBbZ2l0bGFiWy5dY29tXQ0KPg0KPiBJZiB5b3Ug
c3BvdCBzb21ldGhpbmcgdGhhdCBpcyBub3QgY29ycmVjdCwgcGxlYXNlIHJlcGx5IGhlcmUuDQo+
DQoNCk5vLCBpdCBpcyBhbGwgZmluZSBpbiB0aGF0IHB1bGwgcmVxdWVzdC4gSSB3YXMgdGFsa2lu
ZyBhYm91dCBwYXRjaA0KInhlbl9hcm06IEFkZCB2aXJ0dWFsIFBDSWUgaG9zdCBicmlkZ2Ugc3Vw
cG9ydCIgd2hpY2ggaXMgc3RpbGwgb24NCnJldmlldzoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIwMjMxMjAyMDE0MTA4LjIwMTc4MDMtNy12
b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbS8NCg0KSSB3YXMgc3VycHJpc2VkIHdoZW4gQW50aG9u
eSBtZW50aW9uZWQgdGhhdCB0aGlzIHBhdGNoIGJyZWFrcyB0aGUNCmJ1aWxkLCBiZWNhdXNlIHRo
ZSBwYXRjaCBpcyBub3QgaW5jbHVkZWQgaW4gUUVNVSB0cmVlLg0KDQotLSANCldCUiwgVm9sb2R5
bXly

