Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72C375E79
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 03:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123743.233450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lepTC-0000OS-Ji; Fri, 07 May 2021 01:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123743.233450; Fri, 07 May 2021 01:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lepTC-0000MX-G9; Fri, 07 May 2021 01:39:58 +0000
Received: by outflank-mailman (input) for mailman id 123743;
 Fri, 07 May 2021 01:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awOp=KC=epam.com=prvs=5761306b0d=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lepT9-0000MR-Ul
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 01:39:56 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 917d60dd-7417-4261-9b81-5c6ec8ea50e7;
 Fri, 07 May 2021 01:39:54 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1471VOM7029814; Fri, 7 May 2021 01:39:51 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 38csvw05by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 01:39:51 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com (2603:10a6:208:cd::14)
 by AM9PR03MB7027.eurprd03.prod.outlook.com (2603:10a6:20b:286::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 01:39:47 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e123:973d:6af2:97c]) by AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e123:973d:6af2:97c%5]) with mapi id 15.20.4108.026; Fri, 7 May 2021
 01:39:47 +0000
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
X-Inumbo-ID: 917d60dd-7417-4261-9b81-5c6ec8ea50e7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfAAxvj2k9zxJrIMqKh5MLLAw7C1npJ3BLFG2zAX4jAUi5kVxG+LWDTWY6aSP259DUkOBkxJoru9fN0RhdRtIfYrEFfm33zzTAeAoOsm7dBfl3d7C4LwvuilRHTqeIYSH1O7/Nit/VWUTOIo3HjTs+7WyzVNLFsMawBjSw9u5DolezzTr+TIAeEX0F9AopA8r+SugSxRpmWesbIIS6Jo7FgdB61DTP5XsliW39VdzIKFSdDBomdaoVJ+JCMOqf8sqUXAxSWVwdne7YQZ0SeJPcZ7z+mzi4K5kr/34u8kwcxAAhet2mtOJvWQYNwOJqLxnjEQc2b/EN3mj8CkHNjARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wuDkXPIYyz+us8xX2jgYYjsbG6TmWiFvdgkn5m+tMs=;
 b=AfVNo3NLNuBUjsHMlsUhI7BGqX3f4cq3HLjJS59Gwp9k/0VF0uonaI/NT6hUkZhyCPb5qOrFC/y3H3c1TCFwrDIhKa7pvTHzVCY3ckI19qDNq1RvosRwyLtpmlQplCzkJu+GGV8JTcewjueXDbyeAjbFB+wiikJF1A2PtZ8Xv/DMAPlRdItmZtvlWuXPzciOtpfFYoI3thQIxt4lSzP8WmuFJvKKznhDXZ8ttPuw3aMNhl644LLao27JsXTAJi45KsVoTDeMy5EwUz8VJfRNz2v57qQQxUVp6WykRmIEG7GSr9FDccUiJx2MmRpDCuoRP8V9F+0Pf9H7v4avVbWvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wuDkXPIYyz+us8xX2jgYYjsbG6TmWiFvdgkn5m+tMs=;
 b=i2QA0+TKz6XXqWyVh14DC/2+U9H9c8hgyGGmvoomjrzRHv1oXENtd+IqPamyd1KuKYxYjkNSU8ouf4vf/rR0dHYNw8o9SZePk/9EK9jN9iASz1VJ4zx9gJF1nK4QNONu7hwimOZO0VPcwvjkmDLbSKpMQP6R3JlLon7h371TiRzo8uqEshWknYELELcxS77txEpJ/8sJFqLVRHcVhhMpNOFTs9P6pJXkQzGtIFaUH3sRONUBAvHWFdrlRPhxfeNU3R2BoR6zmA8rFkzt614MJTr74a9fgkFeGYEeuo1uBYHZGgJdpq87wuqRkoqRvt8MzNCJcdesNN9LRIZnPnNAxg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
CC: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Subject: [PATCH] optee: enable OPTEE_SMC_SEC_CAP_MEMREF_NULL capability
Thread-Topic: [PATCH] optee: enable OPTEE_SMC_SEC_CAP_MEMREF_NULL capability
Thread-Index: AQHXQuHcC5ITAI62gUKYhtJEOCBguA==
Date: Fri, 7 May 2021 01:39:47 +0000
Message-ID: <20210507013938.676142-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.31.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 429301b4-28e4-4555-71f4-08d910f8ff9a
x-ms-traffictypediagnostic: AM9PR03MB7027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB70279D257CAFF5B0C18FDDF7E6579@AM9PR03MB7027.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B3OLqLbFWHhLVDZ83+oWBknpsb4MNa6CnuUnXKU3AidG0HPjOeRE3MaPrnpM4Hrm7JylUXZZ670p29JeelOlYOLPE6CR02goaJyWgsy1u2KgH6gPutx8j1C81RcfpHzdx3t7B6M1GPAlwSVKWuE+rYKNFelnqyS52/mzGgRvZ9tbeqcw/dxlPyhpmlb6wQXNyFtiRB+JQvpEZvzDkjd1Xy2CoEZdNyi3wFcuUoS4NT2WuDphydDHsAVswQNGo2GL4Xoc0xQtWotAl0FiszTwRM8EDlPAkajbTAUH8XOG1iARxcFyl8pRWO0P5OL5nhjnPFXXUeztDNR4/f80YXcxXza0CJ95x2cHjG/X0bKPQyqA8/HJ8T65urhHsUE0nAe9edqZMVfZFAc5L9LLfryhGCaKRkdeAf2YYYwYENXUyVP+qdne22oM5ZJfrbIgJhK5irgB5NQata050Xt7jDUHaZEqVUsqNPA/nYI26iF8bJoID+7xNKlOpfUX0CeGs00j6A80oksRX24xjls8KV7xeVrLSj8b5uwR1/5SFI53LNtglHlUlOs30QavCR1z2LweL5TXjN+GVllTEGAqAKpc6uZJFea2hpvu9uV98m4wsQo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4372.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(4326008)(1076003)(66556008)(64756008)(186003)(66476007)(66446008)(66946007)(5660300002)(6512007)(6506007)(71200400001)(91956017)(76116006)(55236004)(2906002)(2616005)(316002)(86362001)(36756003)(478600001)(8936002)(8676002)(122000001)(110136005)(38100700002)(6486002)(83380400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?0lPl7BxTNUA25BZ8EBv/bDFH1BvHKXOTXjSjbI4E3LHCBg2QfP402eDnWl?=
 =?iso-8859-1?Q?6OoTTr4hoYnjMQ/rn+dPsE6JwWpjLePzxrPFXQfa0P3l5ZJ4AXRv4WnK7N?=
 =?iso-8859-1?Q?iAJIPX1mO/xkg3YNULMeq0zpPNsXVm9mgMpMZ+6H5kxjG93fs1FKuc2bqW?=
 =?iso-8859-1?Q?17mYOjQHGDsXo6V5FjQYBouvxGS9kjK7BrrMNlqELO3rYOXX/WlUR2jqph?=
 =?iso-8859-1?Q?wkD9cLXOLpHbKrCn0RZ6xvd9y7xeA4a4FPsg31bbout/9g2daq3VcML2Ta?=
 =?iso-8859-1?Q?Ch0g8fRZvb37/XemyoxEE2ibTX9q9LqOhCh7pQvst2YO82c8/lBrwiIZCC?=
 =?iso-8859-1?Q?qz2rkW0pVtBBeLjkvR5calMKLycbUfvLNuAPggHPD840ZfXFwdzrCQ8qfi?=
 =?iso-8859-1?Q?Q8XeelQkrciO6opsUwtunvLA1LvfLdZGNY8tH5ZTNwp1O4fCidsE1CH3T2?=
 =?iso-8859-1?Q?hvZisiwEqSQ1YqSps6PIjMXsZCDCNps3S5Alg3dH5ByBRfxII4JBiJDVvl?=
 =?iso-8859-1?Q?LogEoaiTHUhtKBuAV9DBXLA9VBBVOMRuvkWBwz3Sn6COATAT7o7ULCgClu?=
 =?iso-8859-1?Q?YsNi734x+pX4hbGsNZaB4rLYo2lHlr+JRsR2bSAB3wazYkZosZ+QP0yAY5?=
 =?iso-8859-1?Q?X/gNWhDvLCj2ysaBSJuGCBpiz/ZcX2vJCa2YgTIk2jg4nD1EGWRGHp3N0N?=
 =?iso-8859-1?Q?kxppBXNER1WNWvfXszn9NFcIpeDSM10G/y31B7tvTF+0JZIpEzQmlzRUJN?=
 =?iso-8859-1?Q?4PlZlu4P5++dxtEDGl/ietVDTdZ5Oe/5gznSJjBcxQXqW85p2U4c1XKrlh?=
 =?iso-8859-1?Q?Qw5y5rql3l0LCC/+qAxIPtPjtlMq4phkpYeitchVDpUOnP6vHh6J1Fczef?=
 =?iso-8859-1?Q?qYR7PErvjznQwFVd4BAr0AcjpZQi5ptbV63nh9nXszwHTEmPd2JtdB5z/g?=
 =?iso-8859-1?Q?DzQuVdbNOxpkShKV6BVtVPmbsMuHmJRY+XxdabcTyXhk/GPp7841Gtf+Ar?=
 =?iso-8859-1?Q?tb0Sna0AhjT6YK+koYb+NNNoAy0xW8qGtuHf7IBHXKQ10fjkmynCzxEWae?=
 =?iso-8859-1?Q?nXBagJEnhBoxJc/+OA877DZUt3sh2bzmKCmitGryxpQJSOHNrxWn6aBBiU?=
 =?iso-8859-1?Q?Q9CggYBwmYzTVbq96HJoKn/IHtf2Cd/AhcKee29x625aeqozOWnxBPO9zm?=
 =?iso-8859-1?Q?Rdcww9O9iKeK58WnR1AK4jFy6NrkW1xEHzOlF3Z3Mkdbz5MGBuktHjHy9f?=
 =?iso-8859-1?Q?RU6K7EGE7xzkpmBIBJRD8Yu+G1meJqCOeq+ELTUPClrL7ninEfw5lY6qba?=
 =?iso-8859-1?Q?p/ZYbWmCvfVdMeTEeh/TxBe5PnBy3C2rXte2nSf+nZjO0Upn4/mKvZQMf5?=
 =?iso-8859-1?Q?QgpZHiLrD7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4372.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429301b4-28e4-4555-71f4-08d910f8ff9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 01:39:47.3752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9hBaoBFgJ+X4zY0nMuaRZKtrIEeSB0V3kl4dSN/sIjTy4P7vx3zDLnfFpPQEnTBMTm8qhy5Vfw9RuXiTLFCrb62CLNB4+o0QaP1l28zqnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7027
X-Proofpoint-GUID: yWQpnpTgGPGsV_wC6lwr9b0KuIGPnoEa
X-Proofpoint-ORIG-GUID: yWQpnpTgGPGsV_wC6lwr9b0KuIGPnoEa
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070007

OP-TEE mediator already have support for NULL memory references. It
was added in patch 0dbed3ad336 ("optee: allow plain TMEM buffers with
NULL address"). But it does not propagate
OPTEE_SMC_SEC_CAP_MEMREF_NULL capability flag to a guest, so well
behaving guest can't use this feature.

Note: linux optee driver honors this capability flag when handling
buffers from userspace clients, but ignores it when working with
internal calls. For instance, __optee_enumerate_devices() function
uses NULL argument to get buffer size hint from OP-TEE. This was the
reason, why "optee: allow plain TMEM buffers with NULL address" was
introduced in the first place.

This patch adds the mentioned capability to list of known
capabilities. From Linux point of view it means that userspace clients
can use this feature, which is confirmed by OP-TEE test suite:

* regression_1025 Test memref NULL and/or 0 bytes size
o regression_1025.1 Invalid NULL buffer memref registration
  regression_1025.1 OK
o regression_1025.2 Input/Output MEMREF Buffer NULL - Size 0 bytes
  regression_1025.2 OK
o regression_1025.3 Input MEMREF Buffer NULL - Size non 0 bytes
  regression_1025.3 OK
o regression_1025.4 Input MEMREF Buffer NULL over PTA invocation
  regression_1025.4 OK
  regression_1025 OK

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/tee/optee.c            | 3 ++-
 xen/include/asm-arm/tee/optee_smc.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 9570dc6771..6b59027964 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -96,7 +96,8 @@
 #define OPTEE_KNOWN_NSEC_CAPS OPTEE_SMC_NSEC_CAP_UNIPROCESSOR
 #define OPTEE_KNOWN_SEC_CAPS (OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM | \
                               OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM | \
-                              OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
+                              OPTEE_SMC_SEC_CAP_DYNAMIC_SHM | \
+                              OPTEE_SMC_SEC_CAP_MEMREF_NULL)
=20
 enum optee_call_state {
     OPTEE_CALL_NORMAL,
diff --git a/xen/include/asm-arm/tee/optee_smc.h b/xen/include/asm-arm/tee/=
optee_smc.h
index d568bb2fe1..2f5c702326 100644
--- a/xen/include/asm-arm/tee/optee_smc.h
+++ b/xen/include/asm-arm/tee/optee_smc.h
@@ -244,6 +244,9 @@
  */
 #define OPTEE_SMC_SEC_CAP_DYNAMIC_SHM		(1 << 2)
=20
+/* Secure world supports Shared Memory with a NULL reference */
+#define OPTEE_SMC_SEC_CAP_MEMREF_NULL		(1 << 4)
+
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
 	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES)
--=20
2.31.0

