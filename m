Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0813C322431
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88522.166507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXo-0004Z3-Fa; Tue, 23 Feb 2021 02:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88522.166507; Tue, 23 Feb 2021 02:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXo-0004Y4-4Z; Tue, 23 Feb 2021 02:35:24 +0000
Received: by outflank-mailman (input) for mailman id 88522;
 Tue, 23 Feb 2021 02:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXm-00046p-7Z
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:22 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d010ed-a512-4352-a189-d6758d431a56;
 Tue, 23 Feb 2021 02:35:03 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxl004083; Tue, 23 Feb 2021 02:35:02 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:02 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:57 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:57 +0000
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
X-Inumbo-ID: f8d010ed-a512-4352-a189-d6758d431a56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTYi1KQbJDEeKaNrH+9ZtzE8sQo9fUaORjGHgdOBdARb2sqabg1zjHLer1dQcSoG3XRHIKE78LuNikZfsJROfhzRpToPesYTfDXQFX+drh7OXUGViT09G5HFGQa18UhGQAc7FYvsGfj+NB58B9WdTyIuwYMj+XFRVhyrv6ICTz60AmZcfTDHqO/zdez3sCzNP2M+y5ODBO+JlYDIiMrZoIFTBoCPtMV2teHLn82l4a6bzumgFgBkbF0zqEGV7sASrNYQnUPLcu6wV7YwokkYY56x5g4n3NoVfh9vPbzc1i7FvjdiGxrYZRQdkIBOTdlfQr4iqOhKjexy/B5FL23Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXx2B0ALYb183P5HVU3xyAVbUZAXMNspxc3XMEA+DN0=;
 b=MWpOqoNz4KU/wu/bP6KfsIS0TEsUSMSClO3p4gBuITAXlXsZw0YgreYE51mefXNtx/vrv+Ex/XywPqTCEJhXF6pe/LuMC6hz/peNpkFw7vIKTzelCCo0czVUbSn1Xzr14NZ4Q7HAqWmqlWYswaSvhnsfZ7lx6/GqLr9wugtdMUpwHLtD8JdmSdA9Hwt0QO3Lb6W0J64nKOpVVBhjzLwQk+9MH+ncBLdGLieDRUiOTflKLHwO+VemP7MQW8skIv+tdV7LH9YYY9tprp89M4P91UMu3d5uLBvya4A6PiRfL4EOM7tmOSQx/g1yC/uxPczmXc8AscFs00O1Q4s43L+zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXx2B0ALYb183P5HVU3xyAVbUZAXMNspxc3XMEA+DN0=;
 b=Oa1Kttm1BZZLoZhU2dHDs6moFOM8D7ZPERcj6v8svvPn0H2TmmLcMt6gTS9MgttWiKCCd5BOL3EP1EWFjW2TAb9bpG/5M4C95wWDg0HJVqpdUGLCG3RF/tvxDzOYWMQVxigEN+R4cQvOCUp4FdSMzyHQdtj9dF7XWCfNHKB1X8353T6iUA643LlVG8qre6azxFd8stdTEk/WuXO39EefurxWx/IdzQkzhXrxeYP+0od9aO8eNWRcJYktou7rbAmFZzFuTIUpcU6MXt0AP08JVH8F1iqkZ37tDk8cb/rriqqaGeLT0jrl7fs/Ci6O43Ftv92rv3HDiJf7u/EZs5itOg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 06/10] arm: setup: disable preemption during startup
Thread-Topic: [RFC PATCH 06/10] arm: setup: disable preemption during startup
Thread-Index: AQHXCYx5K2kzQwNs80ySE93i7jtdRg==
Date: Tue, 23 Feb 2021 02:34:57 +0000
Message-ID: <20210223023428.757694-7-volodymyr_babchuk@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce111a5f-bbea-45ee-3d0e-08d8d7a39c67
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235A936D4E52685F52AB7C7E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cSdecW6WPoe9LB+WlAGvJQ84X3CaS7/RSWKbEWrTpW7SSRqU9UVo79qjl9b7oJTvmeK5cV8LdlqLN/l0JuDR4TvZugxgSmU57Nzn+cDyoBrpkAsC1py4+k28u5qx5I9S84eqE2RF769ZcCVaPYP+sDqisx2RnUxYLWEfwtCCnvbAASB4FokEd/wvZoKm6WNcIWxUiuOt3fSj4PE5NnfxYnxbpNl7DC6XpIwxsRoQgb38xlpSjJ+NdlVQWYRXdbnewBCXa7yXhTBPW3+d/PfhE/9K1XxXdjCcSk8T9cyPI8/YeypJxj4RzjrrWz4nUstpIYheTzHxr+qyCbw0CGDW8SWHZvfG6dKrf1heJYlTLgMb+lDLfELEDap5Gf35QqNz4ECHFDcfHSmVHI03SsDRECgbC2yULM2r5MnyybHouFbVWBYpl3LhGeQGeglofHg154Sj8mArdNEDxnLxnmMj0fTz7XDXSpVY5m32dTJAgl9dDQrREOQQq5isWOslmgg7+koL8phO5pORJAkzCRiT0w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(4744005)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(107886003)(54906003)(66556008)(55236004)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?ppOJi/8P8oq+XZHJ+oFQMSc+h/swovuz7JkKwn0FF7Jsll5+ZY7hfsg/0q?=
 =?iso-8859-1?Q?Hf392GJdsE+U2asyKtQpzj6LE5KsqKcfQYwAw57dZx9z+3SNAvgHHwKeBC?=
 =?iso-8859-1?Q?sSHrg9ChWmPDFr8QlmWT7GeKvXnpLr6T8LJABevFh83RTyBcBfEqsLmjKn?=
 =?iso-8859-1?Q?qzax37jMUuM4oUwzdrKUHLNlJafDRSL6CGOk8tjAeA0ZFXyDvztiAoCzNh?=
 =?iso-8859-1?Q?o8yz4yApKhdpvspiqAO1LvGqQUTTPnRjHDoH1YmzcS4dGnBYtfDP5y69G2?=
 =?iso-8859-1?Q?CCxrmpAzdJwihstsvR3e28HrnbGUREjZKbzf8D6ZBnIgRvACYdJecyMP9T?=
 =?iso-8859-1?Q?IBSrSLU20VSnmfpm8/6yIeIWIUX3yPiWepp/ZcRVKdmM/Xy3I+tkk/aCt/?=
 =?iso-8859-1?Q?neEDPmoeSHfWuOwVubykgmSUe/kzQ7Yo1mNUZ5Fz2v5516n5dbGIuKznat?=
 =?iso-8859-1?Q?La5tsLmGZzsZefrh9XTGKt/eBuK7ERpQQ6ATxgOnYu241wkuAJYzrFrSHT?=
 =?iso-8859-1?Q?WQ8LFcK1yii/rO4OI/xve/Z91yN3hndezWjtv7Aeax69wepxYy+v+Ww53T?=
 =?iso-8859-1?Q?dUu92PQzVmiAsIiIK1b+RcX3JKZFe4YQuBFErdyxwmBEmM/YNtlH424Biz?=
 =?iso-8859-1?Q?HPA9mvMuHkt+y6hYn0EFaCwGc5Yw0nK2J/0GWrcXMT+oo4Bm0RwLa/SMtR?=
 =?iso-8859-1?Q?MAZfGQ5opzvJTIsQ0exx2qy5NZqeeW23eYvFBL7ImbprFvSG4b6MYDo8Py?=
 =?iso-8859-1?Q?HFUiI/91fV8C8CxFhlh6t7pkCVsiX3Z2dCWowpe0nizDCzEeJMFcZYM/ez?=
 =?iso-8859-1?Q?xEGedH1O0iPmx0jXIj7ft6M8lMbprpJ3R26vuOxajr3WymRRrx63u9lJv5?=
 =?iso-8859-1?Q?RRDAc9c+QxxzEC4zd9sD1/DlJOxjJLYWXHmJV2HUEQcQ3VBPrj2t12qyn2?=
 =?iso-8859-1?Q?R9tqwWodb0eYLNJYZvgxm5Z1hTi8o6PAvrByi7TPzEo/wQO6My5Is++Ha8?=
 =?iso-8859-1?Q?Az88KfE2Ix820Z/xTn5RKwSJ9UHifArbjykASAxQ6NgDUiD0ySA4ev+Lpg?=
 =?iso-8859-1?Q?LYiOJZXDypoP5XA5YbCYK8asnQqQct+92CuYsWSsIVoOkoKwvi3RZQqzFI?=
 =?iso-8859-1?Q?l/UbCjM20JIv4V+V4xEhcY89nrSqbU/qrBpuBRTbG/wacVXwhihFdaeoYz?=
 =?iso-8859-1?Q?FXj0/SrGkup0/ae/RO55/UrqGAXThDSWR8KhwTeYEkfnEyom533fyjez3Z?=
 =?iso-8859-1?Q?pEAxDQc8VZuOyumyLeZL49hmkmVpkFMXVOv6kVZ/CPi1bnitWJWZTSe692?=
 =?iso-8859-1?Q?FsKiot3njZ/+4U+IITnm+BW/saswZ6ypRlOmU4ARAhrtdEiGTilYsLChEg?=
 =?iso-8859-1?Q?VHjFqNX+9P?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce111a5f-bbea-45ee-3d0e-08d8d7a39c67
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:57.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkQcUQgbc8b2ynvWj4QyAsST9R3nPGDvp11O5xsLzt51L6BvKTjzPyMVejIzbWkmvppAB00my1Dt+KU3NcY87TcpaHPRUXJ1HTF2BGSwLas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=697 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

In the subsequent patches we will enable preemption in the hypervisor
mode. But we don't want any preemption attempts while system is
still not ready to call scheduler. So we should disable preemption
during early boot stages and enable it only when we switched to idle
vCPU stack.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2532ec9739..15a618b87c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -78,6 +78,9 @@ static __used void init_done(void)
     unregister_init_virtual_region();
=20
     free_init_memory();
+
+    preempt_enable();
+
     startup_cpu_idle_loop();
 }
=20
@@ -920,6 +923,7 @@ void __init start_xen(unsigned long boot_phys_offset,
=20
     setup_system_domains();
=20
+    preempt_disable();
     local_irq_enable();
     local_abort_enable();
=20
--=20
2.29.2

