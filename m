Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C732242E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88524.166529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXt-0004jd-HR; Tue, 23 Feb 2021 02:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88524.166529; Tue, 23 Feb 2021 02:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXt-0004iV-AC; Tue, 23 Feb 2021 02:35:29 +0000
Received: by outflank-mailman (input) for mailman id 88524;
 Tue, 23 Feb 2021 02:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXr-00046p-7i
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:27 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f95cf823-5a6f-4cae-aced-a78d80284f96;
 Tue, 23 Feb 2021 02:35:05 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2QQxo004083; Tue, 23 Feb 2021 02:35:03 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 36vqte83qr-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:35:03 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR0302MB3235.eurprd03.prod.outlook.com (2603:10a6:208:a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 02:34:58 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:58 +0000
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
X-Inumbo-ID: f95cf823-5a6f-4cae-aced-a78d80284f96
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Box0ZW6cJts97vL+MA7FHGhTExkrOv+H0xYvOoLWoSAex+3v4NDWEvoaOGDmzmYtNlOmg/NUnpdBiDqKPBYeOUWcpQ/I0c0VlqMmtg3jg2MPTaIYi/26drW6h3/7UEcP+Vyvapdji3kNNbUty4rrcVgsm36UZ8gKvy4Lx2ZFLyj/gr7+4TAANZ5szhH6DKG1e3ciDXUN6zmh8paJrWBFSjM26CChOarY2WeE4ehbr21Uh0RJMjf8dIbjDGq6kOtc3+Iv288cRGxAyGsVprLYDGqk4sTTJ8O70yKAnXrNdXiHjEJIZbJCK0c1o0QRW/Zgo9LcZDA97nUn6rCtHcpH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77HrcIok9Ev7108K/qUYq6X0RM0POs+crZXjM8Ysf2c=;
 b=JXX58xLnl8fV4rPTTgIAgoZIAfRLCD6wBHiETxq5Ox6dRdwRpFg2xSEGSTKE01Ot9kjtMlCxBqiI0sy8r54/RCLEIO5rr+iYfbU0gRJwVdU+rKAQ8OZwrknDOXRmR8WKv3VyOntez6MQiGdGzZC+mTKYnyFQngeEl5nJHLf3lNc3zMXa+cyjDeR1EgalQvKLfk9cqsIQak4ZV2sIRLgvjn9rPna1J9dXyza2n3b0v3ElMoJkv74O+7+0nbsl/qxioORoR3UknCVUsftCjwv4sjYvZvPJdKb/tXSECe/9thod3op/Xhkh1uxZP0AkCVvLVasqHu4AN3qiNmbq2BEG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77HrcIok9Ev7108K/qUYq6X0RM0POs+crZXjM8Ysf2c=;
 b=IF0hKvbI5CNPPsygUhpYpltnYRwGQbrvAa+erWdPtZvlZ6t1GkdVVBW8eO1T++ZtSWT3a4SwwYPWsyPamc71Da7iscM4C4+FZU/ofs6hHy1IiQU3TlYxHK6r97GL9Aoq64YQ+cEXtId9Y9/O/FtbnV6LpQfdsxMLPkDwQu2pf1g7Oorzm7y+n1uo+puZ+YLmFkCqoEJXw1N55t/F4mn6AS+e2xHu9L+XKBuLvO/M/OdJXM0zM5vf4vHCtxUIXIDxT1+/BGqwCvfnDO8LrcSdkWAQ7Uo8K3pzYUzXILciz6sFWhVWNkNjxGW71Z6kYUb4f3qMnZipnn2YY71lHf5RaA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 09/10] arm: traps: try to preempt before leaving IRQ
 handler
Thread-Topic: [RFC PATCH 09/10] arm: traps: try to preempt before leaving IRQ
 handler
Thread-Index: AQHXCYx6aQhBTjfpeUOOmxfCufx61A==
Date: Tue, 23 Feb 2021 02:34:58 +0000
Message-ID: <20210223023428.757694-10-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 5acda12d-2f42-4779-aa3c-08d8d7a39d19
x-ms-traffictypediagnostic: AM0PR0302MB3235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3235D1A9677897B3C93C0900E6809@AM0PR0302MB3235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YUQaa/FnT3MvD/24iWZzbvd71oeHj86lSWMrFzCZUZKFMc+WkFxbz5LiHZWwwXJZ/ZWMmuv90yeEVuxYMPpXgw2yPME+CK2SV37fvtvr3vlXZ/+SztoFbzLHR027WjhT7lJpz/fLmH4ocWEOQd7+6gQg8PEEqiKUfF9l58Q9rb5Mwithg03V3vSGeULKwQHCkeOY6CF/V3JEy1owHmfgRlODPr9zdte2yUFGBwljTB2lUhC23JHwMwHPMQEhvSi2+ZJkWtbBvhgRIELR+mrtp7iSuyL9pKcDz7DG8MkAflYpIbpShbpyMTjHIkJah1yAH8chcDYMR9XxCPujDNzwb/fPANAkmM8lv08arCPQztNOoLw4R91f6y4/URsl/EGRLnhuTtTN1LVumzlrY88ydKTXTS8uSXW2loKlwEy1KRXSAYmE/jJYiUucwP/Uww0aMa6/pvJURuxjh9NFi2T7HTpAdBw5fXPA5D3j1B3LwjYIAqzW05BzlWQmHyXkewdrtowjkCk3aQay+Bf+Tc17EA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(316002)(6512007)(4744005)(8936002)(8676002)(86362001)(2906002)(4326008)(478600001)(6486002)(186003)(107886003)(54906003)(66556008)(55236004)(66446008)(66946007)(66476007)(64756008)(71200400001)(1076003)(2616005)(26005)(76116006)(6916009)(36756003)(5660300002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?dQHEm3IGAN922H5DYg775cTiCxL8zP+0cWNFPD/H/NR8hwbpTjdYY56BHa?=
 =?iso-8859-1?Q?3j8Rw1UsY6lMjPThHc/hnOSw8Ka9Kf0V6Lq2KLDXsrXNRwAdQghVcvkYLU?=
 =?iso-8859-1?Q?PMfekSKH2zzPVhl2yZCm9APKxekkFqfo2edz8Is7pG/hQraNm3VEy+xtLg?=
 =?iso-8859-1?Q?UIGuqVfcHaoql5wxNzPL3GbRRiEfG6c8e6cTNrNgRkYErnG5he3X9trDwQ?=
 =?iso-8859-1?Q?mEVtIwPfKExEWqk1szSDUNKWvwevy/Dx3ieRXHp+TK9r3AVnjx8Eo87vVy?=
 =?iso-8859-1?Q?3Ab5+8gdqjhRGlED69mqxgCuTC6HLBMfcW99BAYm3zC7BShYsgqqexPmhV?=
 =?iso-8859-1?Q?PN9TZ/Ona51NwkQQVsq9+7YJYEwJlVs9jsqPFZZl9FtCrMykO/EaFj5n5f?=
 =?iso-8859-1?Q?7qaypnU8IwnxxvrUmJOaxD2ElVNgInewvLYfqLfX/FO/Taj9WtA7mQtDvT?=
 =?iso-8859-1?Q?wY0X66jGjh4Qv+p7hZDGkY2WMLMFYIT+vlBwEBdWdnEEMK3/4JLq0YplAf?=
 =?iso-8859-1?Q?ALnNYpnwdBsdvNMhbv5T1oJro4kF4i0NDPJL+su5SJk62DDSr8yv9oiXS0?=
 =?iso-8859-1?Q?NGqafX+rggLGGRYhIftdIH82zl6EpjxM80bzBYnndPlh7FRbwYpMoQ4+K9?=
 =?iso-8859-1?Q?crJvlHNDpCCzHMvUvqUCXd+h9WnzlyhDhYN2kTr5akSFG7cPeGkCUT/NmQ?=
 =?iso-8859-1?Q?up6lgiQZfR63Q09flMC0E/5MNVvelkQ5A8en6YR67k8QlLvYsn80YY/2yw?=
 =?iso-8859-1?Q?p+Hi3uYxgK7GgcU049TyNVWZU/aPP+JZmckqUBf+S/AOzkRkoIclq2mzlT?=
 =?iso-8859-1?Q?NY1PunTy9qEyTwc5NJiiKQYeBXgtKqmg9jzO5ZBMJ/JRsNBzrjI0g6ch89?=
 =?iso-8859-1?Q?Knwb9gxPfLBwIG1/QHn7EeAUoNXDE6yVKIf1yBglA+TxriaObqxxm8gmnm?=
 =?iso-8859-1?Q?JiBuNcVpGgq+ucrdvh1n7UCzQrD5+QhuwzmKJIKYCtHjqKa087O5ke/vFh?=
 =?iso-8859-1?Q?e8lKvDy8SEy0/lFtnqfgXnegieMKcJUQWKLfTJuXoZZxVnDByMA8/kCnjP?=
 =?iso-8859-1?Q?nfmLUYceIW9jjtj4aWbQMztv8U3m3cu8zRubWdjq0NRCizah5ybvv4U0wW?=
 =?iso-8859-1?Q?TWCB97wdOd5owo5dW1fA3vyNBhhPVTNOepDVdp+4Y+//d32ZK0JXowM8x0?=
 =?iso-8859-1?Q?adiYUMb2RGqcRRR0aP9rNORZ7yLqfX2IJfyhQ6bll9IgUpBR3GdUyYIZCC?=
 =?iso-8859-1?Q?sJAaMAqUyD3fwFwS0zE5xleNHSyWS8xb12fyNeS3MTIgr07IPQ6dApQZ7d?=
 =?iso-8859-1?Q?bjjsRd+E8p9F5nDWoPC+N/qo1deDFooreiJ84HxpFTHsJZZHiNl4jFznAO?=
 =?iso-8859-1?Q?2pACeCIQlg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acda12d-2f42-4779-aa3c-08d8d7a39d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:58.4833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjdn6W8pYOxYaazx2wU5MY23yUziY37gihP4izXveGMMtMPo2hMl1+haK9f7i/gIValS3T1h4oayqGOsUMHiYRk36P8hdD4+AOw3Jtkh9Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3235
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=730 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

Now we can try to preempt code that is running in hypervisor code. To
do so we need to try to invoke scheduler by calling try_preempt(),
while not in nested IRQ handler.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/traps.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 6fa135050b..98a4fb4904 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2260,7 +2260,14 @@ void do_trap_guest_serror(struct cpu_user_regs *regs=
)
=20
 void do_trap_irq(struct cpu_user_regs *regs)
 {
+    static DEFINE_PER_CPU(unsigned int, irq_entry_cnt);
+
+    this_cpu(irq_entry_cnt)++;
     gic_interrupt(regs, 0);
+    this_cpu(irq_entry_cnt)--;
+
+    if (this_cpu(irq_entry_cnt) =3D=3D 0)
+        try_preempt(true);
 }
=20
 void do_trap_fiq(struct cpu_user_regs *regs)
--=20
2.29.2

