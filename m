Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B856375DCB4
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 15:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567943.887410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNCDe-0005y4-NZ; Sat, 22 Jul 2023 13:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567943.887410; Sat, 22 Jul 2023 13:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNCDe-0005vR-Jx; Sat, 22 Jul 2023 13:00:22 +0000
Received: by outflank-mailman (input) for mailman id 567943;
 Sat, 22 Jul 2023 13:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nq/f=DI=epam.com=prvs=1567f67e21=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qNCDc-0005vL-3L
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 13:00:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4571a74-288f-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 15:00:17 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36MCMi5g015320; Sat, 22 Jul 2023 13:00:07 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s0f21g1bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jul 2023 13:00:06 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM0PR03MB6290.eurprd03.prod.outlook.com (2603:10a6:20b:15f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 13:00:02 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::11f9:615a:4d9a:a5d2]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::11f9:615a:4d9a:a5d2%6]) with mapi id 15.20.6588.027; Sat, 22 Jul 2023
 13:00:02 +0000
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
X-Inumbo-ID: b4571a74-288f-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvEQKk5mLVB9YTb2GqU9cgs8Yc2DKK41dnvbSGgBEVwKBETOpbIL5P+wxLPI+u8RAnHmje+sRSoXJ057qLcaj6BTTEffPzwfXA3AkJQgoFZGSS7EDFcGuJsKcyj6oWpL48d4y8zWfg3yublKTfmLRQQ0XhPi0IQMQiSBYe1fhgn67gMKxg6vaeH7DL6+xzuyAnK+Otp7ydmD3NpmLhzXw7HZGMtMFOabHV2dI1LrYSOMbG4q9NLHQkAF4qmbxLRDv/1FnBetO9YDzPTmG070WNZAUp/6aTvZxJ/YxJk9izS1ilbLeFuYPuz1Nc1Zpbk/itLMewh+ykkIzWkkcBBemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyQncW3QjF1r9yAUxjyLtg5BVB8a24sKRAj9UFU6RFM=;
 b=CROasv3W34d9XufyPM4hz0cfG2ZaT3PtBgmK/+/LQv7bn3WLtWSo2kYFw45cEjnHfp9YTTSupl0iyrXinaV9cvBgnY4ABFxqHmQ8aJ+uMHX4ixQET4G4l0dcdvOrE5jLkzQlU9c54iYU2B8t5pSisTwOEEkB0lEmggNVOi6QRh6UM6mXDF57LGlWnU+RoPTGRSAnQWsTCKvoOag7PKB2BnlYxm4fXVBC1swle24FIWe5LR0jXQLMbn/X5k+/YFYiE3LGDcd6egMompDIExo4CsvIgFDo4WXCvvWk8w58Np9UrKgiITgtEzI38Io+v0MKzmNoom4PsHkPU+opiTAuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyQncW3QjF1r9yAUxjyLtg5BVB8a24sKRAj9UFU6RFM=;
 b=ZEy6Fb8jNshnMm8WmXqG3eT6n9XVRaylx5SIRBpQHBbQcko3b8SlRfTXA0PlNi64ulpUlnDnSO6SxLdlamZp0wWEpX5j+slwkoZ9oWH7a3ffGJbh9a6x8L3HPnMMZSf+BqQy4Gsetjzlfa/nOZJeVV16ExIc+hjJNCIVHMP4U+eQViRtFx6y8y0H9raZR8oUPF3UWU+yFr8m0dMJ2CkK8lhWieuIuRKsHw2CfSFEuiLp7ii3GXSznBxRTkni2rW7A/n/sqDqu2XSTkGLUqPtXbuh97gIHuKuQIYpB8heSArW0yAC5sAxiQbUHZkBXzJWx9/loHlEGy9TUWnvlUwjig==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "jgross@suse.com" <jgross@suse.com>
Subject: Re: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
Thread-Topic: [PATCH] xenbus: check xen_domain in xenbus_probe_initcall
Thread-Index: AQHZvCju+wR/K2O8tkyLPTyf5+laP6/FwIeA
Date: Sat, 22 Jul 2023 13:00:01 +0000
Message-ID: <1fa1bb86-f0a9-62f5-b61a-ffb29daa81f5@epam.com>
References: 
 <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2307211609140.3118466@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AM0PR03MB6290:EE_
x-ms-office365-filtering-correlation-id: 27acd770-5aee-42e4-153e-08db8ab38fd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9/+NFFymxRQZh2G/vX2s6SoOWnm1Qlh6bGy85INuF9HS6KMvDBTDamG7G5jQJ5zI2cE41rllRJ/nTq5/3pJBN/nFsnsXGz9lLwL/GQKr7snZm3lzDdfbwORvBXmk7LZ5H7M0cws78/5vVIaOxvUfJfCnAlyJA0IkZq7i3dRsFcAO9/IMZrN3AhK+S18lEw+Q7n+aP5Q/ISbpm6A5qCTyCLPVFgTFXK6YDcxAAW/2MkA9rvg7BYdsrQVrs6FX2oVHQ6Oy1Gr66GQ6v06WAQkeGbLm69XlX7tfMLpyd0cSE1E4SFpUr4ZJrdZlmKbyjZnrjHCVj383LirDd8oILQ2lWZxpHXukjW2hKTejBZ2SK8g7cx1HfwbPnnKV70dal8W+SscYFJYQzuQIEvIOMd7OGoz5z9r5HZ/F8f4m/N9mRq6iJxVzw0Ay0OjHsah/ya6AJyzDvxBq4r5x9jtIU4TlF0yMFYcyoKJOjpT4YAqvex3g4HGQQIlZiA9DhvjAkYDFxSlvbvvAENIT+6C6i/tRLFY0RQfcSo/gNgyPmOiH14qr1+VteJ1BqA4FtpYU+M60RQj9hqwUkl5fBelf0fwgzvEzD+dkKkRx5Hwwynlq8RO3WqL8K4lz/N/CGzV0d6UgPJX3NWJRCEfCbemjv/RIZw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38100700002)(6512007)(122000001)(83380400001)(186003)(2616005)(26005)(6506007)(53546011)(5660300002)(86362001)(31696002)(8936002)(8676002)(38070700005)(36756003)(71200400001)(478600001)(6486002)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(41300700001)(316002)(54906003)(91956017)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V3YySlJHQld2N05EV01pbitjV3BVdHd6M0ZOWjhSckx2anJXSkR6UFBCQ29M?=
 =?utf-8?B?OE5qREZKWmY0aURjamJZcFAzK28yM0RFUHZDNm5XUXc3WUhwVkVYWjBxOGpK?=
 =?utf-8?B?bWR2dG01UEFhVE42SzZ0ZjVSL0t5ZlJJMG15Y29RVUEvOWhFakdHbE5Zazlo?=
 =?utf-8?B?TEY1SFZDb2pXNDI4RFpoQkg4U0diU21DRFMxK2Q4eEN0SnE4dnJqeml4QlN0?=
 =?utf-8?B?Z2dVek5IZkwwUmFWNkd0emVrYmNJRkRxMDB2bFFmVFRGcktJelRVbVVmdTFO?=
 =?utf-8?B?VWorNWVFMk93bE52d3g3alNRN0Vua2lIQit3anYvZzk0NUcwblFOS1h3MjBn?=
 =?utf-8?B?Q3NEWHFneENnanlWQnlIbzRKOCtwdlJob0o1MFhIL3p0ZHRBMVlpRXFvNHZG?=
 =?utf-8?B?bGUvRWlNKytidVQzOVE5ZmJ2K3BERnEydFhuL1FQN1dRTHVaYXR6NHBZOFNo?=
 =?utf-8?B?TlV5bzFWdktucEZZM3dtT2VIYlpmbDVlKzViZVJ0Q3oxRmk0MlJ0THZWZXk0?=
 =?utf-8?B?MHVrbW9hRmI5MXhUMTNwT3VieDVkd0tiSVlzKytDYnBnOVg2UG1LQjhOUmk5?=
 =?utf-8?B?VmQ2dFFPVUJVcTNGa3RVNTk2TmlMK0NoWnVPbGNkNWRLTEVocm1sOVgvekhG?=
 =?utf-8?B?eENyemk0TVZoWTVFMDZUQ1FHZXo1M1VYd3p3dnJKMUM2MGYxdHZ1cCtUcVhl?=
 =?utf-8?B?OG1hbWdiUUFOVTljaGlONXlydjVxcG81aklMMStzSUhZOGlMVTE5OFVaOFBG?=
 =?utf-8?B?TFVwYncyV0t1aUZQOG82QlRWdVR4RTNoK3ozMTV3WVhVNzExTWpkZzNxY3hw?=
 =?utf-8?B?cGZ6dS9SK3RBL1orOTkvU3R3NjlLYXNVOWx4MUppSU9iRHNBSCtHUWl4bkdi?=
 =?utf-8?B?alI4SEdpUi9KbG1yQk1aajZtZXVNOTZiSGltRVlsOWI2NWwzWGl3Z01jUEor?=
 =?utf-8?B?eHQzWHR1MnN6NjZ4OUlhN0xjZ1Z2ZDR0VFF3Wkl4dWpUTzF1SVJ5alhkUklM?=
 =?utf-8?B?dUJpZXd1cEthZEZ6U2Vwai9BNU1ObjVGbHJoeHdVbitRN1NKdldYWHBNaGNw?=
 =?utf-8?B?bzZlZU92d3gxbDN3dXNNVHV4NDBwUWZ0VEVDWUIvUlo1MmZOeDc1NnVmTVlG?=
 =?utf-8?B?aDRzbjNkaGllVlR2Sy82WXhQV3FkZ0pyRTJST1VqNlVzaWlIOWk0UUhIbjFI?=
 =?utf-8?B?bWNFYjUrWFRrbHlhVXhsM0h2bUdGb2FyZmluREhNY2ZyM0I2c1BzUWZQL2dK?=
 =?utf-8?B?Q25YeDFUUnUycnlrUTlhYkNac2pYN3c2V09VMC9DSlZ3cTNMM2s0UlBhM1RE?=
 =?utf-8?B?bmtTdjNhMmg2Yk1EOFJqS0liaWkxOHNoSGhzSFFTYVZ5Nnh6dUpzK29nMWtE?=
 =?utf-8?B?UDlPcVJqcFAvMSsxQ0Y2REJMY0ZlUG8xLzdva1JkWk4zd2QxRkllRjlxeXd0?=
 =?utf-8?B?QzY0UldUYmdITHlBZ2FMSHBYdlkrL0o0Wi9PcWQ5N0pndlp3WmZ6YUE4NFN0?=
 =?utf-8?B?QitLdk0yeStGSWNBT2tXcy9ST2VLbjNPYWQ1UWV4b3hSZDhuZXlXYlc1Y2xY?=
 =?utf-8?B?eVhvb3V0R2pqMjJJbFJSSW1PdUU5WGIraHhqVFFhMUhaT1ZYV1h6YmNRY3J1?=
 =?utf-8?B?WWg1Z1BoR3FzREsxSCtobUN3bGx3K1gzRlNuTSswNVVxcllDaEM5akltdzdp?=
 =?utf-8?B?VlBJaXByQzd1Q2NKR2lsQ3p3Z3pCVjBEZXFGMGYyTlB3WG53U0hibHhGbGtE?=
 =?utf-8?B?dnVCWkIvL1QzZHV4WUtRVVJQdTV6MzM3bjh3NkV5d1JMcUpNTzFOclVqOWYz?=
 =?utf-8?B?aDBBNDhBdnhUWFVlcENYSnh5azhXcWFkS3hKQm1VR0llbHVlbUdMRnRENktZ?=
 =?utf-8?B?UHVMRTRXbXNScGhrdmNsSXU5VGJidjRwdHMrTW5QNG5xT2daVXV5eDdBYkFk?=
 =?utf-8?B?eGUxVkFxQWptR0dLZ00xZDhmcDdqTjB1UHZqaG9VbURHVTlvUjIwZE45SUJG?=
 =?utf-8?B?eUlocG1PUVhaT0xLMWt2U2d0dVBxSnFtWUF2Q3JEUkZ0ckx1enBLTnA0U2pL?=
 =?utf-8?B?YXBwdUNrWmYwTUEwdW1RcksxMXd5T2gzMVhKVU1rNzZmU3ZwTjMyMW16QlV5?=
 =?utf-8?B?bURqRG40VjQ0ek52Y2Ura2VaTDZSMWZRcHZheGtLak1oT2ZwMTNNVkM3dzZv?=
 =?utf-8?Q?BzsqdKxPMMLfg/zBERhbpL4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <775BB6EE5BAAB84D96F782E9849EBCC5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27acd770-5aee-42e4-153e-08db8ab38fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 13:00:01.9759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OvUUGrYVmRbeBBlG/0c+W8v0/ZBTvgiaRRla3o7CKxtaW2nIpx90RzM/JPa1AFbbIbW17yTWnpBHZ+1YcPyZ+B9JZngw9cu3hTjAUynG2rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6290
X-Proofpoint-ORIG-GUID: 234ol2GAL7Syfjqfw4DnrQ5qCN9c2WYL
X-Proofpoint-GUID: 234ol2GAL7Syfjqfw4DnrQ5qCN9c2WYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-22_04,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307220116

DQoNCk9uIDIyLjA3LjIzIDAyOjEzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQoNCkhlbGxv
IFN0ZWZhbm8NCg0KDQo+IFRoZSBzYW1lIHdheSB3ZSBhbHJlYWR5IGRvIGluIHhlbmJ1c19pbml0
Lg0KPiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6DQo+IA0KPiBbICAzNTIuMTc1NTYzXSBU
cnlpbmcgdG8gZnJlZSBhbHJlYWR5LWZyZWUgSVJRIDANCj4gWyAgMzUyLjE3NzM1NV0gV0FSTklO
RzogQ1BVOiAxIFBJRDogODggYXQga2VybmVsL2lycS9tYW5hZ2UuYzoxODkzIGZyZWVfaXJxKzB4
YmYvMHgzNTANCj4gWy4uLl0NCj4gWyAgMzUyLjIxMzk1MV0gQ2FsbCBUcmFjZToNCj4gWyAgMzUy
LjIxNDM5MF0gIDxUQVNLPg0KPiBbICAzNTIuMjE0NzE3XSAgPyBfX3dhcm4rMHg4MS8weDE3MA0K
PiBbICAzNTIuMjE1NDM2XSAgPyBmcmVlX2lycSsweGJmLzB4MzUwDQo+IFsgIDM1Mi4yMTU5MDZd
ICA/IHJlcG9ydF9idWcrMHgxMGIvMHgyMDANCj4gWyAgMzUyLjIxNjQwOF0gID8gcHJiX3JlYWRf
dmFsaWQrMHgxNy8weDIwDQo+IFsgIDM1Mi4yMTY5MjZdICA/IGhhbmRsZV9idWcrMHg0NC8weDgw
DQo+IFsgIDM1Mi4yMTc0MDldICA/IGV4Y19pbnZhbGlkX29wKzB4MTMvMHg2MA0KPiBbICAzNTIu
MjE3OTMyXSAgPyBhc21fZXhjX2ludmFsaWRfb3ArMHgxNi8weDIwDQo+IFsgIDM1Mi4yMTg0OTdd
ICA/IGZyZWVfaXJxKzB4YmYvMHgzNTANCj4gWyAgMzUyLjIxODk3OV0gID8gX19wZnhfeGVuYnVz
X3Byb2JlX3RocmVhZCsweDEwLzB4MTANCj4gWyAgMzUyLjIxOTYwMF0gIHhlbmJ1c19wcm9iZSsw
eDdhLzB4ODANCj4gWyAgMzUyLjIyMTAzMF0gIHhlbmJ1c19wcm9iZV90aHJlYWQrMHg3Ni8weGMw
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUBhbWQuY29tPg0KPiBUZXN0ZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29t
Pg0KDQoNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+DQoNCkkgZ3Vlc3MgdGhpcyB3YW50cyB0byBnYWluIHRoZSBGaXhlcyB0
YWc6DQoNCkZpeGVzOiA1YjMzNTM5NDllODkgKCJ4ZW46IGFkZCBzdXBwb3J0IGZvciBpbml0aWFs
aXppbmcgeGVuc3RvcmUgbGF0ZXIgDQphcyBIVk0gZG9tYWluIikNCg0KDQoNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX3Byb2JlLmMNCj4gaW5kZXggNThiNzMyZGNiZmI4Li5lOWJkM2VkNzAxMDgg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYw0KPiArKysg
Yi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMNCj4gQEAgLTgxMSw2ICs4MTIsOSBA
QCBzdGF0aWMgaW50IHhlbmJ1c19wcm9iZV90aHJlYWQodm9pZCAqdW51c2VkKQ0KPiAgIA0KPiAg
IHN0YXRpYyBpbnQgX19pbml0IHhlbmJ1c19wcm9iZV9pbml0Y2FsbCh2b2lkKQ0KPiAgIHsNCj4g
KwlpZiAoIXhlbl9kb21haW4oKSkNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gICAJLyoN
Cj4gICAJICogUHJvYmUgWGVuQnVzIGhlcmUgaW4gdGhlIFhTX1BWIGNhc2UsIGFuZCBhbHNvIFhT
X0hWTSB1bmxlc3Mgd2UNCj4gICAJICogbmVlZCB0byB3YWl0IGZvciB0aGUgcGxhdGZvcm0gUENJ
IGRldmljZSB0byBjb21lIHVwIG9y

