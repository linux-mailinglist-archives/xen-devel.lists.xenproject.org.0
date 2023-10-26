Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D357D802F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623646.971682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxBG-00059m-MD; Thu, 26 Oct 2023 10:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623646.971682; Thu, 26 Oct 2023 10:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxBG-00056U-JT; Thu, 26 Oct 2023 10:01:34 +0000
Received: by outflank-mailman (input) for mailman id 623646;
 Thu, 26 Oct 2023 10:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3h0U=GI=epam.com=prvs=466334560c=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1qvxBF-00056O-8E
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:01:33 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d88d4c-73e6-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 12:01:30 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39Q88Psv030363; Thu, 26 Oct 2023 10:01:23 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tyav0hjyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 10:01:23 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AM9PR03MB7267.eurprd03.prod.outlook.com (2603:10a6:20b:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 10:01:20 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::eecf:7ef0:b4b5:fc42%4]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 10:01:20 +0000
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
X-Inumbo-ID: a1d88d4c-73e6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPCEPtU3HYRsK6tSq3Te83o4XFQczCiaHN4HWTjhpeVKX3JZPEoo0rmQlyhEtCjkn/7N+bxIvpupXlD+CVN3Pzyxe4bqqlc1p66sC3ENox7u800Dgcv7baCgagBmE9mI4WX57A3MCIi7dFxuxBOQFb8L2CHiMFAQ1QrRzBFw12uxs/Oy5KG6EeCR3o5L0WDSWQDz74xq1GhTPCK+UApp+1DNjjX4+oKdAorqUPeDbk8dUfhh66SU6+ZJ0VEOE8BYuockdAMvWOIx3eInxXds46DIJPBwu5GimbBhcoJx8NN02zeLsoHJNQg6WGFrkp9fL0HKUYgF5GfiZiXemiqZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9YFE75pw8/VAWAThuBbllni+dqgf/ZdZaW5cUijMn0=;
 b=C9BuQtvFiYrHXDKvwiwIvSGMxVXKl0Jpw9IjB0z05u/3Pa8TJS4G/ErQ5Rqd8FfhTG1PHdlDiWirORanSpv4hNVsPJCByyBbNhYYxd/r6p7HI6e/mC4+EozfIH+1c0dZIC8IsVwW/MZmlq0ETUyJW/MkuAQUViy+eWiuz/KbrOPwPVtf2/PNn3PzdompGoX9Pgpg1YRippcLqmi8xD+eGQ97uikVBK+AptjoQ4qqhTfOG6u38MXDghLdToXy/Ne1Pz2sIOnsnTK+5IFZMbwclbonTkitwfZZWjcOQNvZe+YvSHG+Ctt6/ZuxysCE37h+wB8jraDIXIFIjCYI4P1Vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9YFE75pw8/VAWAThuBbllni+dqgf/ZdZaW5cUijMn0=;
 b=E/wvCrKAmrUJDrR5IDeQ5CWe+wo5C+8PQzGoG1fwU4z9WfssSMukDPX45zqe5ee7fiuP66ztO1AjA6FaKCZ/W1tMlLd7XlkWDaEYF50gt1Hp7AI0R9r8cW1wF59FgWCTjfChKQ2IymDB2gM2Nm3BXwjY6L5QEmN74iCvxcSQPsVaQYrPbA1r2WrxvwSUnSSl2QWPzxjP5XXVjxZWDdO++OPwDDhTlpp0GbiB/PJ1UNsm/FWWjwaJAoUeEVnU9tI/Npl+MsTK4kcGR3UhD8dsf6Bmo7ZlBgqORVPhIb5mTIY+qKbFJkchKNlnOnK14JmVM726iDv8+7iIwEmVkSWwAg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Thread-Topic: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Thread-Index: AQHaByVKOarKe67VpUmvAyf2tK5K3LBaTAOAgAGMbAA=
Date: Thu, 26 Oct 2023 10:01:19 +0000
Message-ID: <6c5cb10b-7b61-4690-92b1-9c75a371af4d@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <b0b41f2065002e4cf7795ebfbf9f84624c2f150d.1698225630.git.mykyta_poturai@epam.com>
 <163d3326-38f2-40b6-a654-60f0221daa6c@xen.org>
In-Reply-To: <163d3326-38f2-40b6-a654-60f0221daa6c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AM9PR03MB7267:EE_
x-ms-office365-filtering-correlation-id: 14da2412-15c3-436c-735a-08dbd60a80af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XT4N5Qr5hGQnBg8xxgd5O8fjCbPbL6SAW4TlyHRyoIx+7+zADaoETyU9dz/uUgs/iWiAMywieUpufyVQhO5WOXF8Z1Mh2aGO0hEbXBhQ932zovJhG0KV1XlJ9A3SA7ZfFUVQJ4jPTC2dVZHKx8H/i1cXhmn5Q6Xktw/O07u2CYSxC9w8wAuqAfEKlBZhkWQIFWm0Hnl+1ZtbtOAUYjMaE4IIGvA92Y3t32HGLvma0uR1TcCDsL07fIjlRLw+tS40fndwM3U/x64v41PTllIFYVzJzcOSbzmqXMettx33AmFPFXFn43rG0SoHXY9JaYR4AN5BnRzrqN7eHyp6BRPfAzeHbbmGmfGFwU5scV/CzG7xROkUqwLNK4yvcQZLJJ9byySZ/zOSm7AJmBBhFcXfg6emeKfGUOWnnMVnGgVDm3QW5ZNIIT1OXPj2LEFVei+DDJzBhzFoyX87OvQWjffiT+5EPOWOBH5uhTnx1RbLWxK+If+vTJobe76B3qzOtYvwfYqKwb/+F2iDxBB5vINIbw40UphvnCNVNyBV8lp1oY8yIGQpQcIZBvaW7tHvhzFnXzFkoGp2sdQnnEcMkyPOY9qXFOLMT9UNJq45mbqrFMJtLXJQdM54gudfG9J97i/cqbd8/wpr422ufR4RAsEhQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(38100700002)(2906002)(86362001)(31686004)(31696002)(4744005)(107886003)(5660300002)(2616005)(6512007)(66899024)(41300700001)(122000001)(110136005)(91956017)(36756003)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(316002)(76116006)(53546011)(71200400001)(6506007)(38070700009)(6486002)(8676002)(26005)(478600001)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHpMeVg2N29xTlU5QkxqUE5jaS8ybUl1bjdGeG54aXhhUFdra0NYMDZIQnA3?=
 =?utf-8?B?UjgrSXRKdnZET1VFT1dsTWtLTno3dHk2aXFrSjdHaVlJMzh1UFF2MFR2cXlr?=
 =?utf-8?B?K29EQTVzQzl3SzBqaExKdHVxc1AxQ2szR09abHVQMm5VRll1UnhSNWgyc1Yz?=
 =?utf-8?B?dFF3dXhzUFNNbEpCanNZMk5GS2o3cTAycUlhY2V2T1FNNGVkK1NqNTh2THgx?=
 =?utf-8?B?WUNLeGJqWlF5N2lqakVsc1IrNmhZeW9TRU53Z1IzbURFenRyYmp3RSsxYjRr?=
 =?utf-8?B?ZURUT21zOEdmSzFsbml5RnNpZVhuRThEeUtkT0thVDJIaC84bkIwalB1YnFX?=
 =?utf-8?B?REU3SGhuMDh4R2NkeVBsZldzTGJpZ3hnWHQ3TkI1VE1rZ09zZGV3TEVocWZM?=
 =?utf-8?B?Nlh5Nzlsd1BaVThYN0ozMXg5bWZHVDMvL2FaWkFnS2dCdzBaSlMyejBCc1pE?=
 =?utf-8?B?QkNtblhXTDNJalpOZlBpMHhUQm8wVmtySFlRR1BRbWgyOTA1Mi9MNzI5cGhs?=
 =?utf-8?B?TkRwSnArb0VaVWFvQmdEeWREb21qc1AvWnVPMUU4SjFKbXAvRzFaajhpMlVR?=
 =?utf-8?B?L1Vmb01mSzdEanZabE9STndkcFRRSkh0NTROUjBLZUxKVnRHYU04bnA0UFFC?=
 =?utf-8?B?SXg0MFZ6NGZVRjl5UWZCWGJDa1hhUDhvU0gvZjF4dVlaQS8wU2xQckE1a0Uz?=
 =?utf-8?B?VnlyeEdOZ05kL01UcUZzL1VkVXNQeE16MEhqdFpONm14Y2xnZEZldlEzMVVL?=
 =?utf-8?B?SEY3TktpMDBXaDBlYm50Y1NtWk1jdUtEdnJMU3FLM1huSlJwQkF4a25GaVZX?=
 =?utf-8?B?S0J5MEp3VHZHTDlPSXc5VGxHK2xRa2Z3M05vNklvTit0QjkwUFVEUUNrTUtB?=
 =?utf-8?B?cVNzWXQ0czN6QzVkZEdTQVQ3V2EzZm83N2UrbExsR3dibzVXdmdjSlBLaThl?=
 =?utf-8?B?Y1hUU0RtVzYxVlZsZlN5R1ZWR1FWZUR3NGVMUjVMS1dINS9zalNQOFhYeU9F?=
 =?utf-8?B?NytwNE5aNElWaFpNbkRLOHduVmNYRW1FdnI4bTg5TlVWMkFpa2tvMFFxN1h0?=
 =?utf-8?B?UTZtUUpMWFJtNGprYmpUUGQyeVVNL2dEaWJCWkNqSnl2cmUwNU90Y0oyRkgy?=
 =?utf-8?B?eEQxd1JoN0JMa2p6ZGlmWk9ONFpJZEVVbUxnOXpIREFiMEg1YXVmd2RxTWxZ?=
 =?utf-8?B?N01takV0WVo4TmxmenJ5VlpTcVF2MnhmVGRFcEF3cDFEZFc1OEhwQ0gvWnBL?=
 =?utf-8?B?ZzY3NjJGZStvY3ZoUlNvMEdveENrbWI1Sklia0l4cmhRcjZnajdLK0FTUVZZ?=
 =?utf-8?B?ZmlFS0I5YmxnRDdFcHdaVEorSkM4cWUwVlpLalo3WGxLVVRJU3dJVUgzQm9K?=
 =?utf-8?B?WWJhN3FjeGV1MXhndmhxUlNQY2JyOHUycWlWbTdNTk43MzFDSWVuV25oK25D?=
 =?utf-8?B?RmVoZkpTb1NhczhPVW16ZTEzM1BZVlpGYU1kTWNFR0xDRGI0M3BNU0NBYXpS?=
 =?utf-8?B?SkNPUkNjeExtdTc1Nk45YUIvNzA5bURlcmlsS0NUSHkrRXVtMzNjVDYyRm50?=
 =?utf-8?B?T2lGaXRjRWZPRWVGL1k0aEhwTUNNTWU0QlBBOW9ZS1hwOUViV0FrSnhQOURQ?=
 =?utf-8?B?WjIzY1VRcE93VE4ra1M4Vk1PSXBDZEhFMVQ5ZkhHS3NZSkRuRDNXc2cvZ3I1?=
 =?utf-8?B?KzBLY3kycDJ0QVUwcVVyQkY1SlZwSlFncldKc2wyZDEwZGFGTVJoOTRZWkVI?=
 =?utf-8?B?UGlVUHI3d1dLY1lhTC9tclFjQThlUFlCbE1RQzByU0lQQk9MWW9DZkQ1UWFp?=
 =?utf-8?B?RWtYUE5KNldoMzFTZEgySUNVcmdKTXBLdi95ajBkTit4SUZ6cUtVMjVOSHJE?=
 =?utf-8?B?eGxSVXNvVXJtekhGdGRCamtKRVRCNEZiakpFZWJlSXEzL2dBTVhFUms0MWRy?=
 =?utf-8?B?SWlkRjR6eEFQekw4YlQ2RmRPL2hndHFZVS91R2dSVGJreDJRVEo3TGExUE5F?=
 =?utf-8?B?ejlzUFV4a0xKMDh4K25vb1J4RGUvM0pxY2FiR1lMcFU3akdQTit2c1NrZHF0?=
 =?utf-8?B?aGp4V1liSmowUXEvZW1SMmtDTStza0NtdXBLaHlxakc1azV2Qk9XSkwxYnk4?=
 =?utf-8?B?eVhLeFNqQ0FNZ3NHWkJGVWt1bFlJRDViS3JwZ1hpSEVnREJSakc0N1BoNWxH?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFFE84629717EE48B880C666D4D957B8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14da2412-15c3-436c-735a-08dbd60a80af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 10:01:19.9793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlekU2rPFF3/enjGSUI3n3nHyqCO2y39R3TSxfD3fCQ3am1F/kO/qVMe8sGq1QBYFpKeGR/nBiH+8pa8SjHu4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7267
X-Proofpoint-ORIG-GUID: F2qvGkae99osNCjh4PxGwTV93SAlBTDx
X-Proofpoint-GUID: F2qvGkae99osNCjh4PxGwTV93SAlBTDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_07,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=731 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310260084

SGkgSnVsaWVuLA0KDQoNCk9uIDI1LjEwLjIzIDEzOjIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IExvb2tpbmcgYXQgdGhlIGNoYW5nZSwgeW91IG1haW5seSBhZGQgI2lmZGVmIGluIHRoZSBjb2Rl
LiBUaGUgZ29hbCBvZiANCj4gZ2ljLXYzLWxwaS5jIHdhcyB0byBiZSBhZ25vc3RpYyBmcm9tIHRo
ZSBkaWZmZXJlbnQgdkdJQy4gU28gcGxlYXNlIA0KPiBhYnN0cmFjdCBpdC4NCg0KDQpXb3VsZCBp
dCBiZSBva2F5IHRvIGFkZCBzb21ldGhpbmcgbGlrZSAidHlwZWRlZiBzdHJ1Y3QgdmdpY19pcnEg
DQpwZW5kaW5nX2lycSIgdG8gZGVhbCB3aXRoIHRoZSB0eXBlIGRpZmZlcmVuY2VzIG9yIGlzIGl0
IGJldHRlciB0byANCmNvbXBsZXRlbHkgbW92ZSB0aGUgY29kZSB0aGF0IG1lbnRpb25zIHRoZW0g
aW50byB2Z2ljIGZpbGVzPw0KDQoNClJlZ2FyZHMsDQoNCk15a3l0YQ0K

