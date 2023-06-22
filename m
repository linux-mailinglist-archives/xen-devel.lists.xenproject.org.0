Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3E73AB74
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554158.865193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRgc-0005Rs-IE; Thu, 22 Jun 2023 21:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554158.865193; Thu, 22 Jun 2023 21:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRgc-0005PL-FK; Thu, 22 Jun 2023 21:17:50 +0000
Received: by outflank-mailman (input) for mailman id 554158;
 Thu, 22 Jun 2023 21:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyU+=CK=epam.com=prvs=053747cf20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qCRgb-0005PF-1Z
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 21:17:49 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b7c8c20-1142-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 23:17:47 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35MIcApZ006075;
 Thu, 22 Jun 2023 21:17:40 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rcurhgbed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 21:17:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PR3PR03MB6489.eurprd03.prod.outlook.com (2603:10a6:102:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 21:17:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 21:17:36 +0000
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
X-Inumbo-ID: 3b7c8c20-1142-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdzhSZOHAT9hoRBMvzbp5ZTmI3aIb2sD4i9o/td568ym5X7PqEBa8WsOQrLP4p34QoHYv/leE6TbXhZcTTFPukUU0VF292Q9jIVqvTqBlg4WMqAmFrpLP6EoQ8xcArwsYwDPnKax2CtcmIgACrp7lTH1sE6J78jPhD0JCQh5XER8dp8NfpMd7Py/T5xn9pjUlNgD69yjfNntX745/SlP9B0WymzLuc01tSoYU+3tKygEgKWJcTQq9LDVEbHf2cgcNaBLaTnYEYrTUHH8WM0YbQkII4v+S++dtuyUk4Tc6FUbIiDlH82D2i8R98rkWEn/hzTjGouQm862a7FxnP7fFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuWtZyvMN74HmxoPbGl7Sz2qlnsZHWevtMTb1H0S/0k=;
 b=D392m4RnLQfQp2eydohGJZ70hxOkYJeVWSPmYd+/O3FnLrqdCxJVTX84AluoeKMK/0LIUUe46p8J8Xuyxo45CZEbT0FuRYknAayONOdWw/NLZEfndqyXUwl7AKFAeMiIlkveMAGb8nOnBJMzpDG73PcSIsIful4OE7HVN2KTpLZUMGcW1Kepurvz8zWVknXu2FXU1N3lRwDdFO06EdJdXrtGEl/SfVAdjfdayaDb2b6sR/AhGBtpHSvgtQ6PNuCT42LKjg9NqfeFAFzdia1jJ9N6LAjWjzfe7XHyDKfiXf81a0fNkMly1l4tn0mFgscAsN/a7cypKsK3n7jpf3dZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuWtZyvMN74HmxoPbGl7Sz2qlnsZHWevtMTb1H0S/0k=;
 b=UL5KZ4vst/UF4EMDMWJ55foSbQS6FmULErQu8ny2oIP2CffM//axlrw7cnVQXXP19wOaJ4edMulMbo8dnl3vzoG6A9e9Cp8USF8cxar1ZMi69XtVPRteBifWz7D/G03unBUEUsiTfjwkV1hT6om3/w+dCMm3JZgaCsGnDQQnBrNvBgJf22dlLKjWVqqZUA7HAtXBT8hW8ytgM3pttvy2eGot9uqB+i4SagOV+Q5FhdeIaYWEIfxBzRK/tRh2zo/oibbXKbn1b+cXdFs2h4Xgatk4tbKsSXhlVWOvh00Y+GE7MyJKDK9jecMPzm7cUjAH9l7H4xeOMO4mlf7oXzuClw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+No9OAgAgqUACAALl2AIAAzUWA
Date: Thu, 22 Jun 2023 21:17:36 +0000
Message-ID: <87ilbfnqmo.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PR3PR03MB6489:EE_
x-ms-office365-filtering-correlation-id: a3b10824-7ef0-4a91-d418-08db73661a0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9Cagx+O5jULYFWHuC0MtaNUdW+FXZlSndhJiMbs+a3kVK7agzgIZtMZS+bJon2KGGF8GNHYh591El2msKeM3VGpBnAFQw/9al/Zw5GrBb7jM+YDDH3/cseDT6Mgl5LueiTgiF5H5vWGLS1nYAx5EwJiU7inlao/ITq1qfSR1zn0YVuZovJYNEchD7DhXZKre4kCdt84K51ga1+UIDDAFuNZ+Hf7kcuTMu1g4BAcN66YmH2WxRSyDWh/uxYIOiTL4UQulA3KMsMoEjkwZ08AUDLiTtLr7l3lb1ni4E3SkoZO4ZSYUO1WJcxTgZo2bk3GVGSPUXt4P2VHssXgTxGc7PUHaUeNtd6ryD5zLgVXIrY0plxXqbSFBoBGJscf8BOc76iz9LUeGDa2PT82ZznAI2KOzW2AUwRtK9n0lI+Vru1o4tAgV/KIDEymyymAARNzr6mP0halyAteW2CHnyNj0WbWRhyTp2GQOkswThPhMlbSNjpmPYTR+jGOffQwoBHa0jHUUV41HLetZcLrNianQTAuUGOwBYPKx5ARh7uVIIAqKUnClaaZuiJ4aNCuxx1oj90nE9HN7jR8XZ3he0J7wHnxnrEAR8uwXqANm3Myy/hM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(5660300002)(36756003)(8936002)(8676002)(122000001)(38100700002)(2906002)(38070700005)(478600001)(186003)(6486002)(71200400001)(54906003)(2616005)(86362001)(966005)(55236004)(26005)(6512007)(6506007)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(83380400001)(91956017)(76116006)(316002)(66899021)(41300700001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emQrYms1STU5cGpxcGJLeWp2Q25nZExiWHgxVktvVmlCRmpJcnVsWGdEQXNG?=
 =?utf-8?B?WHJHVVRxQnEvVHd4U3ZWVUQwUE1LejVYMkd3V2hCM2FFbWg2NXFlREVZd1E5?=
 =?utf-8?B?RzVGTk1GM2g4V1VaSFB4NE5YakZDZi9vRnJxcVlZVTNEVlc3aW1Cb3lxNU1B?=
 =?utf-8?B?Rkg0dkdiczV5WG90bnBRalUrZkN0YUx6ZHl0MGdneVFRaTlBc3FLTEhQTStR?=
 =?utf-8?B?TzVpek83b0JvRGhoZkdNVHVHTXlaQmJ3bTlEZ1VXUEJ4ZWgzWUVEekVZUmUv?=
 =?utf-8?B?SEp4dStsNm9JWXg2Y2Q1cDRWNlpUZXZMSGptd2xvMHlOSVBZSmhUVG9oOWZ2?=
 =?utf-8?B?WTRVczVMcWlHZWFGWjdVMktPc1pHVTZLTXB1NGphcktML1ZsN2tnOXRKNnhX?=
 =?utf-8?B?ZktEcDVTb1F6aDlVY1ZYUzBOYkZ2YTU2Lys2WVZHcWpLUW9ZenZGbzVrckc3?=
 =?utf-8?B?NlFmVWNXSHB4UGRPN0dITWhPT1JWU2w5UytLS1lTT0Z3c0p0RDU0ZTkzN2RS?=
 =?utf-8?B?K3ZQQTJmTW9KNi9rV2dPcUFPSTgrK0pBK3ZNVFpkRlpiRlQ2dWpkWDV0alhF?=
 =?utf-8?B?RDgrbDM0WmNXYnhvaG5rdmZGRFhWUkxncWplRWpOWGtyenI2aW1kelBsMHlR?=
 =?utf-8?B?WkROR0hyaCthM3lJTlhMRXl6VU94eHZZUU1Pb0MyUi9lVmZMcDRUYTREWGx1?=
 =?utf-8?B?NGdHNi9XSkRMYWg3WkllS2JaOHhmMXJWaDRGMVJJYnAwYW82UXhoUlJIeUF1?=
 =?utf-8?B?eTAxTnB2R1BQejhJTXg1SnFpN3M3WTVhQURuOHhQS3hCZFI1T2Fqajh3UWsz?=
 =?utf-8?B?dGR3UkVlR0IrT2RPUndqVUlzMVBZZ3JOUm5UMVppa1gwSUVGdnFkbXBkYlUy?=
 =?utf-8?B?U3BpSlVtMFMzajRLZG5hUnFYVFFSY24reGxmZ2VpT2J1NC9XMEJqRVZHS01T?=
 =?utf-8?B?MlZiVlVCMUJUOWRTRDUya1RUOXppSDA1blJURGY3dm54OEowR1pNUXBGNTJy?=
 =?utf-8?B?ZEJiY0l6dE5ITWRoS1VaV3Vlb3VvZHZtM3Ftd2pPNHk3cjRrYnVIR3crZmZH?=
 =?utf-8?B?djd5ZTZTYzdON2RmSzkzbDRTNDJINllTTE9YYWVPcUVncmRlVGxuR3NoeXo4?=
 =?utf-8?B?S1dYelJxVHFyN1dCajFrRHg4aFZZMUQydlRaeUpIcW9ZSmNGNmJBVW5pbTRP?=
 =?utf-8?B?b3YrZVV0SGFIYk1YYUhWUGVua09wUGxEYTdZcXFaV2U3TU5iLy9vMkw1N0c5?=
 =?utf-8?B?WlYyVGgzLzFnZEFpbmNzR3FvMlJLWTVtT2JoMk90K0hJV0VweHNUdTZ1bzZ5?=
 =?utf-8?B?Q2k1MldDSjBSR0pqTjdIR1k3N003MHBmYTkrQW1DM3BXTzRRcU1HZmVjZWND?=
 =?utf-8?B?WWhTZTE0NmFDWERSWjJtWkVyZjdPNGY0c3JUeWw5WXJ6c0JMdkpwcGhMUjFB?=
 =?utf-8?B?QzIvSWF1dlhwbmlndjh1Q0s3ekpPdGxEeFFWbjBzVDYzUitsbFpYMlRWa3dZ?=
 =?utf-8?B?dzhISEh4bkhCejNBQ3ZsOGsxbGcvamVDWEIvdzBhRFgvanpGcUdYalVycSt2?=
 =?utf-8?B?bWhESlBxdUxCSG9RTmhmYzZXM2VVNHQ1SUhSVjNPby82akFGNVFFdkVuOHdt?=
 =?utf-8?B?UU1xMkhXc1d0TUlrZTFzMmRpak1rOEpnNm1ZRFVLOXBUYWo1QlM1MnZMdmRP?=
 =?utf-8?B?bG94SHd6NUFjNVJkSUpRODNySWE2ck14Y3VLcVMySUh2T3FRN0d1V1hVVVlS?=
 =?utf-8?B?ZEt1aS92M2h3RFpKUWU5ZGtROW5OTUdTaXFZRWcxNUtXeXRKUHpoTUo5Mk1H?=
 =?utf-8?B?OUVoUVVQZGFQRlB4ZzNRKzdkZktJRHB6eFFIZEJMNVFPdno0bWhzdnBTekNZ?=
 =?utf-8?B?R2MrZlJYNFV4bXFlSHgySnZoTUV4Q2U4Y25KRlhLbDFwMXpudlRsUWhNd1BS?=
 =?utf-8?B?eURJQjFVaHA3dUtCSkkvdnEvTGZSQVZ4dzlKckRQQm5jWlRHbnYwbWk5emhk?=
 =?utf-8?B?dkpzSnAvUytiNk4wS0VWZ1piVEc5T1h6Ti9RYkl2amFBY1YyTVhadFhKOEdB?=
 =?utf-8?B?SitDU1hvd1VnVkgwT01PYmovV3BSMGtDUXdtUkNvdi9ZUVJxeWY5V0VkZm10?=
 =?utf-8?B?eVovYmgva0JJeXhSa2lsbGRlcmxnQUJFR3VMdGFGTk5heGM0MWxCOG5oYUF6?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62F1306582A2AB4D96B7FE9806C75596@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b10824-7ef0-4a91-d418-08db73661a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 21:17:36.3805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+rtJUP01DAXmumoUHYI82fAuev+lSKOoKIupms6NQwcwexrHjruJMD3uNuDKmJmdikIY6+TCGP1WvlAsVUSt8GL3IsF81ht9+0P7hsoMMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6489
X-Proofpoint-ORIG-GUID: Xm0i3W3jXFn5CzFQ78Ox_AHvP-ZAs40r
X-Proofpoint-GUID: Xm0i3W3jXFn5CzFQ78Ox_AHvP-ZAs40r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=726 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220181

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAxMDowNzoyMFBNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4gSGkgUm9nZXIsDQo+PiANCj4+IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0ZXM6DQo+PiANCj4+ID4gT24gVHVl
LCBKdW4gMTMsIDIwMjMgYXQgMTA6MzI6MjZBTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+PiA+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+DQo+PiA+PiANCj4+ID4+IEludHJvZHVjZSBhIHBlci1kb21haW4g
cmVhZC93cml0ZSBsb2NrIHRvIGNoZWNrIHdoZXRoZXIgdnBjaSBpcyBwcmVzZW50LA0KPj4gPj4g
c28gd2UgYXJlIHN1cmUgdGhlcmUgYXJlIG5vIGFjY2Vzc2VzIHRvIHRoZSBjb250ZW50cyBvZiB0
aGUgdnBjaSBzdHJ1Y3QNCj4+ID4+IGlmIG5vdC4gVGhpcyBsb2NrIGNhbiBiZSB1c2VkIChhbmQg
aW4gYSBmZXcgY2FzZXMgaXMgdXNlZCByaWdodCBhd2F5KQ0KPj4gPj4gc28gdGhhdCB2cGNpIHJl
bW92YWwgY2FuIGJlIHBlcmZvcm1lZCB3aGlsZSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlDQo+
PiA+PiBtb2RlLiBQcmV2aW91c2x5IHN1Y2ggcmVtb3ZhbCBjb3VsZCByYWNlIHdpdGggdnBjaV9y
ZWFkIGZvciBleGFtcGxlLg0KPj4gPj4gDQo+PiA+PiAxLiBQZXItZG9tYWluJ3MgdnBjaV9yd2xv
Y2sgaXMgdXNlZCB0byBwcm90ZWN0IHBkZXYtPnZwY2kgc3RydWN0dXJlDQo+PiA+PiBmcm9tIGJl
aW5nIHJlbW92ZWQuDQo+PiA+PiANCj4+ID4+IDIuIFdyaXRpbmcgdGhlIGNvbW1hbmQgcmVnaXN0
ZXIgYW5kIFJPTSBCQVIgcmVnaXN0ZXIgbWF5IHRyaWdnZXINCj4+ID4+IG1vZGlmeV9iYXJzIHRv
IHJ1biwgd2hpY2ggaW4gdHVybiBtYXkgYWNjZXNzIG11bHRpcGxlIHBkZXZzIHdoaWxlDQo+PiA+
PiBjaGVja2luZyBmb3IgdGhlIGV4aXN0aW5nIEJBUidzIG92ZXJsYXAuIFRoZSBvdmVybGFwcGlu
ZyBjaGVjaywgaWYgZG9uZQ0KPj4gPj4gdW5kZXIgdGhlIHJlYWQgbG9jaywgcmVxdWlyZXMgdnBj
aS0+bG9jayB0byBiZSBhY3F1aXJlZCBvbiBib3RoIGRldmljZXMNCj4+ID4+IGJlaW5nIGNvbXBh
cmVkLCB3aGljaCBtYXkgcHJvZHVjZSBhIGRlYWRsb2NrLiBJdCBpcyBub3QgcG9zc2libGUgdG8N
Cj4+ID4+IHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gc3VjaCBhIGNhc2UuIFNv
LCBpbiBvcmRlciB0byBwcmV2ZW50DQo+PiA+PiB0aGUgZGVhZGxvY2ssIGNoZWNrIHdoaWNoIHJl
Z2lzdGVycyBhcmUgZ29pbmcgdG8gYmUgd3JpdHRlbiBhbmQgYWNxdWlyZQ0KPj4gPj4gdGhlIGxv
Y2sgaW4gdGhlIGFwcHJvcHJpYXRlIG1vZGUgZnJvbSB0aGUgYmVnaW5uaW5nLg0KPj4gPj4gDQo+
PiA+PiBBbGwgb3RoZXIgY29kZSwgd2hpY2ggZG9lc24ndCBsZWFkIHRvIHBkZXYtPnZwY2kgZGVz
dHJ1Y3Rpb24gYW5kIGRvZXMgbm90DQo+PiA+PiBhY2Nlc3MgbXVsdGlwbGUgcGRldnMgYXQgdGhl
IHNhbWUgdGltZSwgY2FuIHN0aWxsIHVzZSBhIGNvbWJpbmF0aW9uIG9mIHRoZQ0KPj4gPj4gcmVh
ZCBsb2NrIGFuZCBwZGV2LT52cGNpLT5sb2NrLg0KPj4gPj4gDQo+PiA+PiAzLiBPcHRpbWl6ZSBp
ZiBST00gQkFSIHdyaXRlIGxvY2sgcmVxdWlyZWQgZGV0ZWN0aW9uIGJ5IGNhY2hpbmcgb2Zmc2V0
DQo+PiA+PiBvZiB0aGUgUk9NIEJBUiByZWdpc3RlciBpbiB2cGNpLT5oZWFkZXItPnJvbV9yZWcg
d2hpY2ggZGVwZW5kcyBvbg0KPj4gPj4gaGVhZGVyJ3MgdHlwZS4NCj4+ID4+IA0KPj4gPj4gNC4g
UmVkdWNlIGxvY2tlZCByZWdpb24gaW4gdnBjaV9yZW1vdmVfZGV2aWNlIGFzIGl0IGlzIG5vdyBw
b3NzaWJsZQ0KPj4gPj4gdG8gc2V0IHBkZXYtPnZwY2kgdG8gTlVMTCBlYXJseSByaWdodCBhZnRl
ciB0aGUgd3JpdGUgbG9jayBpcyBhY3F1aXJlZC4NCj4+ID4+IA0KPj4gPj4gNS4gUmVkdWNlIGxv
Y2tlZCByZWdpb24gaW4gdnBjaV9hZGRfaGFuZGxlcnMgYXMgaXQgaXMgcG9zc2libGUgdG8NCj4+
ID4+IGluaXRpYWxpemUgbWFueSBtb3JlIGZpZWxkcyBvZiB0aGUgc3RydWN0IHZwY2kgYmVmb3Jl
IGFzc2lnbmluZyBpdCB0bw0KPj4gPj4gcGRldi0+dnBjaS4NCj4+ID4+IA0KPj4gPj4gNi4gdnBj
aV97YWRkfHJlbW92ZX1fcmVnaXN0ZXIgYXJlIHJlcXVpcmVkIHRvIGJlIGNhbGxlZCB3aXRoIHRo
ZSB3cml0ZSBsb2NrDQo+PiA+PiBoZWxkLCBidXQgaXQgaXMgbm90IGZlYXNpYmxlIHRvIGFkZCBh
biBhc3NlcnQgdGhlcmUgYXMgaXQgcmVxdWlyZXMNCj4+ID4+IHN0cnVjdCBkb21haW4gdG8gYmUg
cGFzc2VkIGZvciB0aGF0LiBTbywgYWRkIGEgY29tbWVudCBhYm91dCB0aGlzIHJlcXVpcmVtZW50
DQo+PiA+PiB0byB0aGVzZSBhbmQgb3RoZXIgZnVuY3Rpb25zIHdpdGggdGhlIGVxdWl2YWxlbnQg
Y29uc3RyYWludHMuDQo+PiA+PiANCj4+ID4+IDcuIERyb3AgY29uc3QgcXVhbGlmaWVyIHdoZXJl
IHRoZSBuZXcgcndsb2NrIGlzIHVzZWQgYW5kIHRoaXMgaXMgYXBwcm9wcmlhdGUuDQo+PiA+PiAN
Cj4+ID4+IDguIERvIG5vdCBjYWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyB3aXRoIGFueSBs
b2NrcyBoZWxkLiBGb3IgdGhhdCB1bmxvY2sNCj4+ID4+IHByaW9yIHRoZSBjYWxsIGFuZCByZS1h
Y3F1aXJlIHRoZSBsb2NrcyBhZnRlci4gQWZ0ZXIgcmUtYWNxdWlyaW5nIHRoZQ0KPj4gPj4gbG9j
ayB0aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrIGlmIHBkZXYtPnZwY2kgZXhpc3RzOg0KPj4gPj4g
IC0gaW4gYXBwbHlfbWFwIGJlY2F1c2Ugb2YgdGhlIGNvbnRleHQgaXQgaXMgY2FsbGVkIChubyBy
YWNlIGNvbmRpdGlvbg0KPj4gPj4gICAgcG9zc2libGUpDQo+PiA+PiAgLSBmb3IgTVNJL01TSS1Y
IGRlYnVnIGNvZGUgYmVjYXVzZSBpdCBpcyBjYWxsZWQgYXQgdGhlIGVuZCBvZg0KPj4gPj4gICAg
cGRldi0+dnBjaSBhY2Nlc3MgYW5kIG5vIGZ1cnRoZXIgYWNjZXNzIHRvIHBkZXYtPnZwY2kgaXMg
bWFkZQ0KPj4gPj4gDQo+PiA+PiA5LiBDaGVjayBmb3IgIXBkZXYtPnZwY2kgaW4gdnBjaV97cmVh
ZHx3cml0ZX0gYWZ0ZXIgYWNxdWlyaW5nIHRoZSBsb2NrDQo+PiA+PiBhbmQgaWYgc28sIGFsbG93
IHJlYWRpbmcgb3Igd3JpdGluZyB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIgZGlyZWN0bHkuIFRoaXMg
aXMNCj4+ID4+IGFjY2VwdGFibGUgYXMgd2Ugb25seSBkZWFsIHdpdGggRG9tMCBhcyBvZiBub3cu
IE9uY2UgRG9tVSBzdXBwb3J0IGlzDQo+PiA+PiBhZGRlZCB0aGUgd3JpdGUgd2lsbCBuZWVkIHRv
IGJlIGlnbm9yZWQgYW5kIHJlYWQgcmV0dXJuIGFsbCAwJ3MgZm9yIHRoZQ0KPj4gPj4gZ3Vlc3Rz
LCB3aGlsZSBEb20wIGNhbiBzdGlsbCBhY2Nlc3MgdGhlIHJlZ2lzdGVycyBkaXJlY3RseS4NCj4+
ID4+IA0KPj4gPj4gMTAuIEludHJvZHVjZSBwY2lkZXZzX3RyeWxvY2ssIHNvIHRoZXJlIGlzIGEg
cG9zc2liaWxpdHkgdG8gdHJ5IGxvY2tpbmcNCj4+ID4+IHRoZSBwY2lkZXYncyBsb2NrLg0KPj4g
Pj4gDQo+PiA+PiAxMS4gVXNlIHBjaWRldidzIGxvY2sgYXJvdW5kIGZvcl9lYWNoX3BkZXYgYW5k
IHBjaV9nZXRfcGRldl9ieV9kb21haW4NCj4+ID4+IHdoaWxlIGFjY2Vzc2luZyBwZGV2cyBpbiB2
cGNpIGNvZGUuDQo+PiA+PiANCj4+ID4+IDEyLiBUaGlzIGlzIGJhc2VkIG9uIHRoZSBkaXNjdXNz
aW9uIGF0IFsxXS4NCj4+ID4+IA0KPj4gPj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAyMDQwNjM0NTkuNjgwOTYxLTQtYW5k
cjIwMDBAZ21haWwuY29tL19fOyEhR0ZfMjlkYmNRSVVCUEEhelB5MzFDV0ZXbHlDMHhoRUhpU2o2
ck9QZTdSRFNqTHJhbkk5S1pxaEc0c3NtQ2hKTVd2c1BMSlBRR1RjVnNubm93WnBQOC1MYUtKa0lX
SXpiOHVlMERvWWhnJCBbbG9yZVsuXWtlcm5lbFsuXW9yZ10NCj4+ID4+IA0KPj4gPj4gU3VnZ2Vz
dGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+ID4+IFN1
Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gPj4gU2lnbmVk
LW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPg0KPj4gPg0KPj4gPiBUaGFua3MuDQo+PiA+DQo+PiA+IEkgaGF2ZW4ndCBsb29r
ZWQgaW4gZnVsbCBkZXRhaWwsIGJ1dCBJJ20gYWZyYWlkIHRoZXJlJ3MgYW4gQUJCQQ0KPj4gPiBk
ZWFkbG9jayB3aXRoIHRoZSBwZXItZG9tYWluIHZwY2kgbG9jayBhbmQgdGhlIHBjaWRldnMgbG9j
ayBpbg0KPj4gPiBtb2RpZnlfYmFycygpIHZzICB2cGNpX2FkZF9oYW5kbGVycygpIGFuZCB2cGNp
X3JlbW92ZV9kZXZpY2UoKS4NCj4+ID4NCj4+ID4gSSd2ZSBtYWRlIHNvbWUgY29tbWVudHMgYmVs
b3cuDQo+PiANCj4+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSBiZWxpZXZlIHRoYXQgaXQg
aXMgYSBnb29kIGlkZWEgdG8gaGF2ZSBhDQo+PiBwZXItZG9tYWluIHBkZXZfbGlzdCBsb2NrLiBT
ZWUgbXkgYW5zd2VycyBiZWxvdy4NCj4NCj4gSSB0aGluayBpdCdzIGltcG9ydGFudCB0aGF0IHRo
ZSBsb2NrIHRoYXQgcHJvdGVjdHMgZG9tYWluLT5wZGV2X2xpc3QNCj4gbXVzdCBiZSB0aGUgc2Ft
ZSB0aGF0IGFsc28gcHJvdGVjdHMgcGRldi0+dnBjaSwgb3IgZWxzZSB5b3UgbWlnaHQgcnVuDQo+
IGludG8gc2ltaWxhciBBQkJBIGRlYWRsb2NrIHNpdHVhdGlvbnMuDQo+DQo+IFRoZSBwcm9ibGVt
IHRoZW4gY291bGQgYmUgdGhhdCBpbiB2cGNpX3tyZWFkLHdyaXRlfSB5b3Ugd2lsbCB0YWtlIHRo
ZQ0KPiBwZXItZG9tYWluIHBkZXYgbG9jayBpbiByZWFkIG1vZGUgaW4gb3JkZXIgdG8gZ2V0IHRo
ZSBwZGV2LCBhbmQgZm9yDQo+IHdyaXRlcyB0byB0aGUgY29tbWFuZCByZWdpc3RlciBvciB0aGUg
Uk9NIEJBUiB5b3Ugd291bGQgaGF2ZSB0bw0KPiB1cGdyYWRlIHN1Y2ggbG9jayB0byBhIHdyaXRl
IGxvY2sgd2l0aG91dCBkcm9wcGluZyBpdCwgYW5kIHdlIGRvbid0DQo+IGhhdmUgc3VjaCBmdW5j
dGlvbmFsaXR5IGZvciBydyBsb2NrcyBBVE0uDQo+DQo+IE1heWJlIGp1c3QgcmUtc3RhcnRpbmcg
dGhlIGZ1bmN0aW9uIGtub3dpbmcgdGhhdCB0aGUgbG9jayBtdXN0IGJlDQo+IHRha2VuIGluIHdy
aXRlIG1vZGUgd291bGQgYmUgYSBnb29kIHNvbHV0aW9uOiB3cml0ZXMgdG8gdGhlIGNvbW1hbmQN
Cj4gcmVnaXN0ZXIgd2lsbCBhbHJlYWR5IGJlIHNsb3cgc2luY2UgdGhleSBhcmUgbGlrZWx5IHRv
IGludm9sdmUNCj4gbW9kaWZpY2F0aW9ucyB0byB0aGUgcDJtLg0KDQpMb29rcyBsaWtlIG1vZGlm
eV9iYXJzKCkgaXMgdGhlIG9ubHkgY2F1c2UgZm9yIHRoaXMgZXh0ZW5kZWQgbG9jay4gSQ0Ka25v
dyB0aGF0IHRoaXMgd2FzIGRpc2N1c3NlZCBlYXJsaWVyLCBidXQgY2FuIHdlIHJld29yayBtb2Rp
ZnlfYmFycyB0bw0Kbm90IGl0ZXJhdGUgb3ZlciBhbGwgdGhlIHBkZXZzPyBXZSBjYW4gc3RvcmUg
Y29weSBvZiBhbGwgZW5hYmxlZCBCQVJzIGluDQphIGRvbWFpbiBzdHJ1Y3R1cmUsIHByb3RlY3Rl
ZCBieSBkb21haW4tPnZwY2lfbG9jay4gU29tZXRoaW5nIGFraW4gdG8NCg0Kc3RydWN0IHZwY2lf
YmFyIHsNCiAgICAgICAgbGlzdF9oZWFkIGxpc3Q7DQogICAgICAgIHN0cnVjdCB2cGNpICp2cGNp
Ow0KICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0Ow0KICAgICAgICB1bnNpZ25lZCBsb25nIGVu
ZDsNCiAgICAgICAgYm9vbCBpc19yb207DQp9Ow0KDQoNCj4+ID4+IEBAIC0yMTMsNiArMjI3LDcg
QEAgc3RhdGljIHZvaWQgZGVmZXJfbWFwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2
ICpwZGV2LA0KPj4gPj4gICAgICByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpOw0KPj4g
Pj4gIH0NCj4+ID4+ICANCj4+ID4+ICsvKiBUaGlzIG11c3QgaG9sZCBkb21haW4ncyB2cGNpX3J3
bG9jayBpbiB3cml0ZSBtb2RlLiAqLw0KPj4gPg0KPj4gPiBXaHkgaXQgbXVzdCBiZSBpbiB3cml0
ZSBtb2RlPw0KPj4gPg0KPj4gPiBJcyB0aGlzIHRvIGF2b2lkIEFCQkEgZGVhZGxvY2tzIGFzIG5v
dCB0YWtpbmcgdGhlIHBlci1kb21haW4gbG9jayBpbg0KPj4gPiB3cml0ZSBtb2RlIHdvdWxkIHRo
ZW4gZm9yY2UgdXMgdG8gdGFrZSBlYWNoIHBkZXYtPnZwY2ktPmxvY2sgaW4gb3JkZXINCj4+ID4g
dG8gcHJldmVudCBjb25jdXJyZW50IG1vZGlmaWNhdGlvbnMgb2YgcmVtb3RlIGRldmljZXM/DQo+
PiANCj4+IFllcywgZXhhY3RseSB0aGlzLiBUaGlzIGlzIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U6DQo+PiANCj4+ICAgICAyLiBXcml0aW5nIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGFu
ZCBST00gQkFSIHJlZ2lzdGVyIG1heSB0cmlnZ2VyDQo+PiAgICAgbW9kaWZ5X2JhcnMgdG8gcnVu
LCB3aGljaCBpbiB0dXJuIG1heSBhY2Nlc3MgbXVsdGlwbGUgcGRldnMgd2hpbGUNCj4+ICAgICBj
aGVja2luZyBmb3IgdGhlIGV4aXN0aW5nIEJBUidzIG92ZXJsYXAuIFRoZSBvdmVybGFwcGluZyBj
aGVjaywgaWYgZG9uZQ0KPj4gICAgIHVuZGVyIHRoZSByZWFkIGxvY2ssIHJlcXVpcmVzIHZwY2kt
PmxvY2sgdG8gYmUgYWNxdWlyZWQgb24gYm90aCBkZXZpY2VzDQo+PiAgICAgYmVpbmcgY29tcGFy
ZWQsIHdoaWNoIG1heSBwcm9kdWNlIGEgZGVhZGxvY2suIEl0IGlzIG5vdCBwb3NzaWJsZSB0bw0K
Pj4gICAgIHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gc3VjaCBhIGNhc2UuIFNv
LCBpbiBvcmRlciB0byBwcmV2ZW50DQo+PiAgICAgdGhlIGRlYWRsb2NrLCBjaGVjayB3aGljaCBy
ZWdpc3RlcnMgYXJlIGdvaW5nIHRvIGJlIHdyaXR0ZW4gYW5kIGFjcXVpcmUNCj4+ICAgICB0aGUg
bG9jayBpbiB0aGUgYXBwcm9wcmlhdGUgbW9kZSBmcm9tIHRoZSBiZWdpbm5pbmcuDQo+DQo+IE1p
Z2h0IGJlIGdvb2QgdG8gcHV0IHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBjb2Rl
IGNvbW1lbnQsDQo+IGp1c3Qgc2F5aW5nIHRoYXQgdGhlIGxvY2sgbXVzdCBiZSB0YWtlbiBpbiB3
cml0ZSBtb2RlIGlzIG5vdCB2ZXJ5DQo+IGluZm9ybWF0aXZlLg0KPg0KPiAvKg0KPiAgKiBUaGUg
PGxvY2stbmFtZT4gcGVyIGRvbWFpbiBsb2NrIG11c3QgYmUgdGFrZW4gaW4gd3JpdGUgbW9kZSBp
bg0KPiAgKiBvcmRlciB0byBwcmV2ZW50IGNoYW5nZXMgdG8gdGhlIHZQQ0kgZGF0YSBvZiBkZXZp
Y2VzIGFzc2lnbmVkIHRvDQo+ICAqIHRoZSBkb21haW4sIHNpbmNlIHRoZSBmdW5jdGlvbiBwYXJz
ZXMgc3VjaCBkYXRhLg0KPiAgKi8NCj4NCg0KQWdyZWUuIEFsc28sIEknbGwgYWRkIGEgY29ycmVz
cG9uZGluZyBBU1NFUlQoKQ0KDQotLSANCldCUiwgVm9sb2R5bXly

