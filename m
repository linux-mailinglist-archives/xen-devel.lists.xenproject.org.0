Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPl9D34M+2mbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:40:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871074D8BF8
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 11:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301450.1575736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYjb-00018B-Au; Wed, 06 May 2026 09:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301450.1575736; Wed, 06 May 2026 09:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKYjb-00013P-7N; Wed, 06 May 2026 09:40:03 +0000
Received: by outflank-mailman (input) for mailman id 1301450;
 Wed, 06 May 2026 09:40:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wKYjZ-0000ke-4d
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:40:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKYjY-00CnEU-H0
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:40:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69fb0c70-2eae-0a2a0a5409dd-0a2a450499ac-2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:40:00 +0200
Received: from [40.107.159.101]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69fb0c70-1dec-0a2a45040019-286b9f658583-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 11:40:00 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB9200.eurprd03.prod.outlook.com
 (2603:10a6:10:474::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:39:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:39:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FS9ZKLYgf+7eNrRZkkiuBs1zHA6sxXcFri8cBnQY0KYfdQf9OTE9CJRdNMnODMA6rBrPMEnxEo/dtL1oYzP1bG0FGQ7DVlHz4Qbuv1/dsEnNhxff3OkiOhoJnJLiMtxfTHMyp72KmNThC8sgpUnYK0MKsFmCbZI22Rzok2AysEPALPWKhK3gosOK5ypROfGz1lmGI/TxvHUTCP7VNEvRSxn9rFdPJGLn4EccsGCFKn8IbAXmQR/rRjzu2o+dV1A4kHGIWTtjtWJ+Gyp816AQWNxixdyZQ9Y9wfysrLZV+jUQyWmy0ncFdDl3guZNc4+v87RBjibQG5y70S+rMlX1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7amzujlHZzSzrXZ+W4vN9u3a7C4kW0IefvHvGxkayZo=;
 b=OJbmHQy+cDYJ7rHO1f/gtOrbuWy1IG/JUzOGi9aojOnXXowL/b/oqCfXfRwJq3StmK0gxsgVKEhisgCN7lRONmkQoLO6RznMGcK9pPS/UvWh/OqLbartVngwvoAjQcT9TXt4mvdqF8HbsV79TRh4caouaH+aF0mDAwLSuBV/EM7q3LsBI9Rojg3lGA9NkDvll9g3lhlxcLX3r+ByuWL8XiOnEo7wYADwFBNc9LCiuDQfX+YzoB5xewU+sJYBauKcEz7UmragR/1BwwisicsBg+IVZS0tJkx5HYq1XInEMD8Di3dzzmsA+5lwrHy/DM7JyAxBvvLGwYU/M8fCSNu6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7amzujlHZzSzrXZ+W4vN9u3a7C4kW0IefvHvGxkayZo=;
 b=iTSdw64vvDp4wHs8YGZem0a6Se+BYtR18dMK1EZnnIoKAxZ9AZL0YKmdz6UIQiIUiNG22cuuHbRRm1/L4Ibr0A1cIE9egEnbw9maFuce8ZDg+4rC9264zxh9FKVcoGBVAAL2womyAbagfgwWLi2Unh+jD+mv18W5vn6a/WRmmZUsNiav8bulJTKePOuleii4JG1ubkc+WCdFZABamw090FEXy6iEb2BYZisw+QNk0sCxY9QOJIi9z4UaWO5BLd34DH3gZeZq+v1t30fL95MM91ZAeNuhIu5KNxacBfq5E5mBWw5b8Cgc1MpyMu9IaqENQnloNIpzFmpeie8EyNKo2A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcyClfuk/Yqk/9/E2oGahG1JP+srXpqhqAgALY6YCAEPz5AIADaEkA
Date: Wed, 6 May 2026 09:39:57 +0000
Message-ID: <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
In-Reply-To: <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB9200:EE_
x-ms-office365-filtering-correlation-id: acf886a5-be79-4aa8-9a00-08deab536f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 NtZJA8XXYndrtJI5qN5Cvtu7m1Z2Kr1LHBogxXOb8DRmU7gOMq1cEHR9hNRUJL1xmvvcAtbGMW/zqA263JvCtgTpXhbd3jtfx9xbTehvdYNB0IopxMy/rXv4fWCbmBNEntsWYrcqRb1Wq2hWl5i+d0yRm4nYaxpopEoFOxFgofO7Xldo0j5cqNzki59LzU3M77U0IG1K0xSBaKXH87KHjNHx8vhlOLF9rRhuGoYwhigxGmsqIiVFrPODeVtq9gNDz+TFYkOt7G+QCb+R+ynChqo/SbvQdvaaHS2lrcEBiMHbDIxLmwPkSC2u4HsGy2ws5Vd2w3s227e16sHa5Z3X2EM061fryjlzZC8Ggz4tLyRmyGJVe94GRlPdl4OzzyVBba0osdfRwLEM7YdaI3JkmCWoMiw8TDUhYGLQtWsJSTyFAZ6FH5A4T2N+sCNfKviLVyG04XYgvhuBdO4aQcSfz3a/W0YBZbbpS+kmy1oVr6W6h246YFZ1WIkbVjtxyCncDNm7gdJXDmkCqx94g5M48mmN+/OpVyRMEzzKxTj7z6cMkAy89Ltlyzhcv9Vi5HW4sIjs+uunW+NU0kjfCKCEd7VMjFRZs3OTCvFOO/bb2NwU0639W+wr33Jh7q8rtVK1FzOseWTcIiQx4YW+kIOIIjR+JEDudi/bWXYISXRcQ2JSjR7pFyJe8316g8/nhkbFA13fpjexTwyNCKfCjXyugDTMffSEjnM1u6O9cj5Bl854fLnjqcYQ062c9s3Wjret
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MURTQmVZSEFaN2xmbXYvOFE3Sm1lR05EOGUwRHpNYU1KeEJJTDB3TUJVeXFh?=
 =?utf-8?B?UWdWYzdOUFRQc04vaXVCT1FISXdrc2p0R0UxSDNncTNTM0swZkJwNkJnOVBo?=
 =?utf-8?B?Z1pZRFdmdTg0a0MvSXQ0d2tEby9seE9obWtlbWhxSlA4U2tqMW54UWRZZUR6?=
 =?utf-8?B?R0JYb2xEaVU5bmE4TjRuVlMvenVuVUZWa3JHc3ZOd1ZHdW53dTBuVWd1ODhY?=
 =?utf-8?B?NUVPQzUwODM1OXBZOUpZTVByKzBVUmtGZmhWY3dxTlZ6dm1lamlrWnQyWmJk?=
 =?utf-8?B?YU5BdFREaGplWDBLWXJYWGpYWEw4Szk3dS8zNEJOcExWeHNxd0M4Y2REcHA2?=
 =?utf-8?B?Y2NwUVZVZFRVd2FlRWN1ajlGSGR6RG5jNUxUNFRaM2xFaVRHNE5XZFRHcFNr?=
 =?utf-8?B?a1lwanFXZ1U4Q01XMVZMN3A4eWdDVEVYN2IwRnVWKzVXajU5RVhIdzV5SS9O?=
 =?utf-8?B?M0hMNDF2WXBneENYcUtiU1dFc2dUaDg3QU5LNjBpM3E5NVJFUFRBWjhGeGdX?=
 =?utf-8?B?bmpGVS8rMUhybHIxTWRmUkVmbTh0V3drZ044YXUvRHovSzBBOGpScWx1NFc4?=
 =?utf-8?B?MUhlZnRpTkxEMzhTUlRjVnhGeEl5M1BMN2ZVWXpDY0xYVllwOVlHSEZJVlMz?=
 =?utf-8?B?L1Y1TEJ0UDNxcFdHM3lrakNNWXBRRDFWbDE1L0ZtcExVVkJZNlFvWFFFV3hL?=
 =?utf-8?B?eGtiRHZGM3pPS1NNVEZnVjZTODFhOFRhR0p6eitoM2VnZWF4emp5R1d5TTZU?=
 =?utf-8?B?Y2hWdS9JR3RZWnRTVEx6YmwzMjBLY1E5NkJSMlNsYWNNS28ycWdPZGh5STgx?=
 =?utf-8?B?WW9PQTNpNGhIbE5tQXpVMDRFdXF2djhKYkF1dG1ieHpJUmhqK2J2SDJlQnZY?=
 =?utf-8?B?anpOVFZ3Q3h1czBOQUlIYnIzZGN1aVVhOGxQcUFodW03TnlxN0d1OHZFcnBT?=
 =?utf-8?B?QWVEdmJiTlh2c1o0N3NpRXZsUEpEVmpycVE4ZFBzSGYyMWp3dkgzSmtaM0hX?=
 =?utf-8?B?aEhNYUYwMmN2cFp5eDk2MHJINm5OVjVXcXAzazI4T2drbjcvci9hVkUzdXNT?=
 =?utf-8?B?UHlRSERmRFpRVis1V0s0b25YZmlpNzVaWUYweko1eUlETU5uV2VDNkNVTGgz?=
 =?utf-8?B?aG1KbmpCZHhncTAyYzJ0UkN6Q2VLYUNLWVErSkEySGlEbCtkTnV1aWNUdHJ0?=
 =?utf-8?B?b1JTN0hqYS9iTHpQb2s2WlFTc2tGZTJ0Q1AzdHc3VVk5QWFQN1VYanlaRjRC?=
 =?utf-8?B?YXZyOWQzL3k1d2pka0c0R1lQQWw2aFd5K2tWVjRXWk9XVGZIVzhwUXJrZHBM?=
 =?utf-8?B?ZldLQlNmKzhxelhoWGdTNDJ4aXpGaE92T002RUlhMlgwTjRyTmtFdW5wUmNy?=
 =?utf-8?B?QzNBVkJjMXlpaDdLOXUvSnlkQlY4VG5Ub2RWdnJjZUlkRVJMMlQrWVd6YW9F?=
 =?utf-8?B?OHZqdFpCWlh2WlNNSTJEY04yUHdWVVE5ZWhSZTFVTFphN2FoNXcvdEVHOGpR?=
 =?utf-8?B?UjlhNWVkclhGbk5mNVluMVJqYXEvN2VaZVA0alpLakJJdWhRWmdVamFZeHRH?=
 =?utf-8?B?eUNRTnd2enB6M2YrQ1VuWktlbDRjSms2MEFjeVZINGw2N1lxQXQwWHRiZnYy?=
 =?utf-8?B?SWlBRXovUFNzczNwNmUrVEs4QXNRVVdiWmxmUlJUaDdHc3hKWS81T2R2WU0w?=
 =?utf-8?B?bGRpL2tNcVRjdjQwV3lkcEpMWjFuU2F0RVVQZlJoOFVDUGZuWXVWUjhKZnpk?=
 =?utf-8?B?bXByZDhrUnZYQTBxT3BUM3dZVG84M1MxUEwxbUxyY0hvWFFLbll6dkg2T3pu?=
 =?utf-8?B?QWptRzhLcGFldHJidHB0YnJnSkNmcSthelBwS3hpaEpldnlhS1pJQlgrZHVY?=
 =?utf-8?B?VlZrSlZEdytIZ1pMNlZPWURxc3ExUTVvbjQ2UXRkTC9NSDJNVlZrNXhOelJF?=
 =?utf-8?B?ZzA5QkRpMjc2K0FZSFJiNzJ6MUNMSEhlcDF2aXRadjQ1M1Ewc0JIRkJLODBo?=
 =?utf-8?B?MHFwejk2eGlZbnRNeVJ1NldPM2wyTEgzbzAvOFlYQlQxU2pBRG4wVlhYUWlS?=
 =?utf-8?B?ZWx3VGIrT1JxSmJNY3FHNEdJbENOdFQ2dHgyQUhOcVEyQlB6eXQyQWNaR3l6?=
 =?utf-8?B?VnNNb3JlYUpqUHFRc0s4UE9Ua0tuQTdJajNvN3JtTi82U0x4akdVMEZITG9E?=
 =?utf-8?B?S1RqZ0JYY0FVZFFlREhZSnRUc3VmaVV2NWRIVzdHRm9Qdy94RW9zS1NjZzRB?=
 =?utf-8?B?RWt4N0lPaHovT2NpYkV6RytNVkJSNmxaT0tlL1FEcXZCbmdKUWdDQ0s2S1Vo?=
 =?utf-8?B?TGhlNmxncllPODBDdTM5OXhUMU1OaWtKcGlUeVRXaHVjeUtNT2lPY2ZUWkda?=
 =?utf-8?Q?4O2JOJ743GdlAUHs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20424B698F3BC84B81F35442F8499809@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf886a5-be79-4aa8-9a00-08deab536f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 09:39:57.4671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GI4V76jneUcORIC72KKf6AFQ2KTbR5EDT0anvn/eE1Hq/i0IQzQi4oCz6NcEaxBARKKwVcCaNgrKWx6r+VRO7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9200
X-purgate-ID: tlsNG-ebf023/1778060400-417793FF-F71E1D0E/0/0
X-purgate-type: clean
X-purgate-size: 6782
X-Rspamd-Queue-Id: 871074D8BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gNS80LzI2IDA4OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjMuMDQuMjAyNiAxMjox
MiwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBPbiA0LzIxLzI2IDE3OjQzLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+PiBPbiAwOS4wNC4yMDI2IDE2OjAxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToN
Cj4+Pj4gRnJvbTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNv
bT4NCj4+Pj4NCj4+Pj4gVGhpcyBjb2RlIGlzIGV4cGVjdGVkIHRvIG9ubHkgYmUgdXNlZCBieSBw
cml2aWxlZ2VkIGRvbWFpbnMsDQo+Pj4+IHVucHJpdmlsZWdlZCBkb21haW5zIHNob3VsZCBub3Qg
Z2V0IGFjY2VzcyB0byB0aGUgU1ItSU9WIGNhcGFiaWxpdHkuDQo+Pj4+DQo+Pj4+IEltcGxlbWVu
dCBSVyBoYW5kbGVycyBmb3IgUENJX1NSSU9WX0NUUkwgcmVnaXN0ZXIgdG8gZHluYW1pY2FsbHkN
Cj4+Pj4gbWFwL3VubWFwIFZGIEJBUlMuIFJlY2FsY3VsYXRlIEJBUiBzaXplcyBiZWZvcmUgbWFw
cGluZyBWRnMgdG8gYWNjb3VudA0KPj4+PiBmb3IgcG9zc2libGUgY2hhbmdlcyBpbiB0aGUgc3lz
dGVtIHBhZ2Ugc2l6ZSByZWdpc3Rlci4gQWxzbyBmb3JjZSBWRnMgdG8NCj4+Pj4gYWx3YXlzIHVz
ZSBlbXVsYXRlZCByZWFkcyBmb3IgY29tbWFuZCByZWdpc3RlciwgdGhpcyBpcyBuZWVkZWQgdG8N
Cj4+Pj4gcHJldmVudCBzb21lIGRyaXZlcnMgYWNjaWRlbnRhbGx5IHVubWFwcGluZyBCQVJzLg0K
Pj4+DQo+Pj4gVGhpcyBhcHBhcmVudGx5IHJlZmVycyB0byB0aGUgY2hhbmdlIHRvIHZwY2lfaW5p
dF9oZWFkZXIoKS4gV3JpdGVzIGFyZQ0KPj4+IGFscmVhZHkgaW50ZXJjZXB0ZWQuIEhvdyB3b3Vs
ZCBhIHJlYWQgbGVhZCB0byBhY2NpZGVudGFsIEJBUiB1bm1hcD8gRXZlbg0KPj4+IGZvciB3cml0
ZXMgSSBkb24ndCBzZWUgaG93IGEgVkYgZHJpdmVyIGNvdWxkIGFjY2lkZW50YWxseSB1bm1hcCBC
QVJzLCBhcw0KPj4+IHRoZSBtZW1vcnkgZGVjb2RlIGJpdCB0aGVyZSBpcyBoYXJkd2lyZWQgdG8g
MC4NCj4+Pg0KPj4+PiBEaXNjb3Zlcnkgb2YgVkZzIGlzDQo+Pj4+IGRvbmUgYnkgRG9tMCwgd2hp
Y2ggbXVzdCByZWdpc3RlciB0aGVtIHdpdGggWGVuLg0KPj4+DQo+Pj4gSWYgd2UgaW50ZXJjZXB0
IGNvbnRyb2wgcmVnaXN0ZXIgd3JpdGVzLCB3aHkgd291bGQgd2Ugc3RpbGwgcmVxdWlyZQ0KPj4+
IERvbTAgdG8gcmVwb3J0IHRoZSBWRnMgdGhhdCBhcHBlYXI/DQo+Pj4NCj4+DQo+PiBTb3JyeSwg
SSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcXVlc3Rpb24uIFlvdSBzcGVjaWZpY2FsbHkgcmVxdWVz
dGVkIHRoaXMNCj4+IHRvIGJlIGRvbmUgdGhpcyB3YXkgaW4gVjIuIFF1b3RpbmcgeW91ciByZXBs
eSBmcm9tIFYyIGJlbG93Lg0KPj4NCj4+ICAgPiBBcmVuJ3QgeW91IGVmZmVjdGl2ZWx5IGJ1c3kt
d2FpdGluZyBmb3IgdGhlc2UgMTAwbXMsIGJ5IHNpbXBseQ0KPj4gcmV0dXJuaW5nICJ0cnVlIg0K
Pj4gICA+IGZyb20gdnBjaV9wcm9jZXNzX3BlbmRpbmcoKSB1bnRpbCB0aGUgdGltZSBoYXMgcGFz
c2VkPyBUaGlzIGltbyBpcyBhDQo+PiBuby1nby4gWW91DQo+PiAgID4gd2FudCB0byBzZXQgYSB0
aW1lciBhbmQgcHV0IHRoZSB2Q1BVIHRvIHNsZWVwLCB0byB3YWtlIGl0IHVwIGFnYWluDQo+PiB3
aGVuIHRoZQ0KPj4gICA+IHRpbWVyIGhhcyBleHBpcmVkLiBUaGF0J2xsIHRoZW4gZWxpbWluYXRl
IHRoZSBuZWVkIGZvciB0aGUNCj4+IG5vdC1zby1uaWNlIHBhdGNoIDQuDQo+Pg0KPj4gICA+IFF1
ZXN0aW9uIGlzIHdoZXRoZXIgd2UgbmVlZCB0byBhY3R1YWxseSBnbyB0aGlzIGZhciAocmlnaHQg
YXdheSkuIEkNCj4+IGV4cGVjdCB5b3UNCj4+ICAgPiBkb24ndCBtZWFuIHRvIGhhbmQgUEZzIHRv
IERvbVUtcy4gQXMgbG9uZyBhcyB3ZSBrZWVwIHRoZW0gaW4gdGhlIGhhcmR3YXJlDQo+PiAgID4g
ZG9tYWluLCBjYW4ndCB3ZSB0cnVzdCBpdCB0byBzZXQgdGhpbmdzIHVwIGNvcnJlY3RseSwganVz
dCBsaWtlIHdlDQo+PiB0cnVzdCBpdCBpbg0KPj4gICA+IGEgbnVtYmVyIG9mIG90aGVyIGFzcGVj
dHM/DQo+IA0KPiBIb3cncyBhbnkgb2YgdGhpcyByZWxhdGVkIHRvIHRoZSBxdWVzdGlvbiBJIHJh
aXNlZCBoZXJlLCBvciB5b3VyIHJlcGx5DQo+IHRoZXJldG8/IElmIHdlIGludGVyY2VwdCBQQ0lf
U1JJT1ZfQ1RSTCwgd2Uga25vdyB3aGVuIFZGcyBhcmUgY3JlYXRlZC4NCj4gV2h5IHN0aWxsIGRl
bWFuZCBEb20wIHRvIHJlcG9ydCB0aGVtIHRoZW4/DQo+IA0KDQpUaGUgc3BlYyBzdGF0ZXMgdGhh
dCBWRnMgY2FuIHRha2UgdXAgdG8gMTAwbXMgYWZ0ZXIgdGhlIFZGX0VOQUJMRSBiaXQgaXMgDQpz
ZXQgdG8gYmVjb21lIGFsaXZlLiBXZSBkaXNjdXNzZWQgaW4gdGhlIFYyIHRoYXQgaXQgaXMgbm90
IGFjY2VwdGFibGUgdG8gDQpkbyBhIHJlcXVpcmVkIDEwMG1zIHdhaXQgaW4gWGVuIHdoaWxlIGJs
b2NraW5nIGEgZG9tYWluLiBBbmQgbm90IGRvaW5nIA0KdGhhdCBibG9ja2luZyB3b3VsZCByZXF1
aXJlIHNvbWUgbWVjaGFuaXNtIHRvIG9ubHkgYWxsb3cgYSBkb21haW4gdG8gcnVuIA0KZm9yIHBy
ZWNpc2VseSA5OShvciBtb3JlPyltcy4gWW91IHlvdXJzZWxmIHN1Z2dlc3RlZCB0aGF0IHdlIGNh
biB0cnVzdCANCnRoZSBoYXJkd2FyZSBkb21haW4gd2l0aCByZWdpc3RlcmluZyBWRnMgaWYgd2Ug
YWxyZWFkeSB0cnVzdCBpdCB3aXRoIA0Kb3RoZXIgUENJLXJlbGF0ZWQgc3R1ZmYuIERpZCB5b3Ug
Y2hhbmdlIHlvdXIgbWluZCwgb3IgYW0gSSBjb21wbGV0ZWx5IA0KbWlzdW5kZXJzdGFuZGluZyB0
aGlzIHF1ZXN0aW9uPw0KDQo+Pj4+ICtzdGF0aWMgaW50IG1hcF92ZnMoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBmX3BkZXYsIHVpbnQxNl90IGNtZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3Qg
cGNpX2RldiAqdmZfcGRldjsNCj4+Pj4gKyAgICBpbnQgcmM7DQo+Pj4+ICsNCj4+Pj4gKyAgICBB
U1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZwZl9wZGV2LT5kb21haW4tPnBjaV9sb2NrKSk7DQo+
Pj4+ICsNCj4+Pj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHZmX3BkZXYsICZwZl9wZGV2LT52
Zl9saXN0LCB2Zl9saXN0KQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgcmMgPSB2cGNpX21v
ZGlmeV9iYXJzKHZmX3BkZXYsIGNtZCwgZmFsc2UpOw0KPj4+PiArICAgICAgICBpZiAoIHJjICkN
Cj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAi
ZmFpbGVkIHRvICVzIFZGICVwcDogJWRcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIChj
bWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpID8gIm1hcCIgOiAidW5tYXAiLA0KPj4+PiArICAgICAg
ICAgICAgICAgICAgICAmdmZfcGRldi0+c2JkZiwgcmMpOw0KPj4+PiArICAgICAgICAgICAgcmV0
dXJuIHJjOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgdmZfcGRldi0+
dnBjaS0+aGVhZGVyLmd1ZXN0X2NtZCAmPSB+UENJX0NPTU1BTkRfTUVNT1JZOw0KPj4+PiArICAg
ICAgICB2Zl9wZGV2LT52cGNpLT5oZWFkZXIuZ3Vlc3RfY21kIHw9IChjbWQgJiBQQ0lfQ09NTUFO
RF9NRU1PUlkpOw0KPj4+DQo+Pj4gQXMgbWVudGlvbmVkIGVsc2V3aGVyZSBhcyB3ZWxsLCB0aGlz
IGJpdCBpcyBzdXBwb3NlZCB0byBiZSAwIGZvciBWRnMuDQo+Pg0KPj4gVGhlcmUgYXJlIHNvbWUg
ZGV2aWNlcyB0aGF0IGV4cG9zZSBWRnMgd2l0aCB0aGUgc2FtZSBWSUQvRElEIGFzIGluIHRoZQ0K
Pj4gUEYsIGNhdXNpbmcgTGludXggdG8gdXNlIG5vcm1hbCBkcml2ZXIgZm9yIHRoZW0gYW5kIHRo
cmVhdCB0aGVtIGxpa2UNCj4+IG5vcm1hbCBkZXZpY2VzLiBBdCBzb21lIHBvaW50LCB0aG9zZSBu
b3JtYWwgZHJpdmVycyB0cnkgdG8gZG8gYQ0KPj4gcmVhZC1tb2RpZnktdXBkYXRlIG9mIHRoZSBj
b21tYW5kIHJlZ2lzdGVyIGFuZCBlbmQgdXAgd3JpdGluZyAwIHRvDQo+PiBQQ0lfQ09NTUFORF9N
RU1PUlksIGNhdXNpbmcgY21kX3dyaXRlIHRvIHVubWFwIHRoZSBCQVJTIG9mIHRoYXQgZGV2aWNl
Lg0KPj4gSSBhbSBub3Qgc3VyZSwgbWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3QgaWdu
b3JlIGNtZCB3cml0ZXMgZm9yIFZGcz8NCj4gDQo+IE5vLiBXZSBzaG91bGQgdHJlYXQgci9vIGJp
dHMgYXMgci9vICh3aGljaCBmb3IgdGhpcyBiaXQgaW1wbGllcyBpdCBub3QNCj4gY29udHJvbGxp
bmcgQkFSIG1hcHBpbmcpLg0KPiANCj4+Pj4gKyAgICBzcmlvdl9wb3MgPSBwY2lfZmluZF9leHRf
Y2FwYWJpbGl0eShwZl9wZGV2LCBQQ0lfRVhUX0NBUF9JRF9TUklPVik7DQo+Pj4+ICsgICAgY3Ry
bCA9IHBjaV9jb25mX3JlYWQxNihwZl9wZGV2LT5zYmRmLCBzcmlvdl9wb3MgKyBQQ0lfU1JJT1Zf
Q1RSTCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIChwZl9wZGV2LT5kb21haW4gPT0gdmZfcGRl
di0+ZG9tYWluKSAmJiAoY3RybCAmIFBDSV9TUklPVl9DVFJMX01TRSkgKQ0KPj4+PiArICAgIHsN
Cj4+Pj4gKyAgICAgICAgcmMgPSB2cGNpX21vZGlmeV9iYXJzKHZmX3BkZXYsIFBDSV9DT01NQU5E
X01FTU9SWSwgZmFsc2UpOw0KPj4+DQo+Pj4gRG9lc24ndCBWRiBlbmFibGUgYWxzbyBuZWVkIHRv
IGJlIHNldCBmb3IgdGhlIEJBUnMgdG8gYmUgbWFwcGVkPw0KPj4NCj4+IEkgZG9uJ3QgdGhpbmsg
c28uIEVuYWJsaW5nIG1lbW9yeSBzcGFjZSBsb2dpY2FsbHkgbWFwcyB2ZXJ5IHdlbGwgdG8NCj4+
IG1hcHBpbmcgbWVtb3J5IHRvIHRoZSBndWVzdC4gSSBkb27igJl0IHNlZSBhbnkgYmVuZWZpdCBv
ZiBhbHNvIHJlcXVpcmluZw0KPj4gVkZFIGJpdCBoZXJlLg0KPiANCj4gSWlyYyB0aGUgc3BlYyBp
cyBxdWl0ZSBleHBsaWNpdCBpbiB0aGlzIHJlZ2FyZC4NCj4gDQo+IEphbg0KDQpJIHdpbGwgcmVj
aGVjayB0aGUgc3BlYyByZWdhcmRpbmcgdGhpcyBxdWVzdGlvbi4NCg0KLS0gDQpNeWt5dGE=

