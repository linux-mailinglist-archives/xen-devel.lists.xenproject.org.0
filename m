Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0E7D4DB4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621815.968646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEcf-0003if-VQ; Tue, 24 Oct 2023 10:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621815.968646; Tue, 24 Oct 2023 10:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEcf-0003gZ-Rx; Tue, 24 Oct 2023 10:26:53 +0000
Received: by outflank-mailman (input) for mailman id 621815;
 Tue, 24 Oct 2023 10:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvEcf-0003g6-46
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:26:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6859124-7257-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 12:26:49 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 06:26:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Tue, 24 Oct
 2023 10:26:42 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 10:26:42 +0000
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
X-Inumbo-ID: d6859124-7257-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698143209;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=PhXHBDCpwE+acywSfYOPcjdc2YO42okjcIDkUNGR2lU=;
  b=XfO2bTblOxen91ND9AbJpHJ8d7o3HOQ2SykM862YqCqDmRNBPwEMde6N
   fKyLeh3wrhwxO50XK+7Hf2551Q0YG4lW4SIxbXLbfUhw9adj27rQRFdQh
   zDonRVDUFKUyQaHWT3MHjiqD/5YtY/k5vQgj19rf2PkXEt6pnpp1mGS0C
   4=;
X-CSE-ConnectionGUID: LTL04e+8Qem7ylh1voh9eQ==
X-CSE-MsgGUID: Xbwupy+uTJGRuRZzYv527g==
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 125069397
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:7gIX2KzdnZvHDWFVmKd6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkUFx
 2AXXj3QMqyJNmfweNl+OYu+oEwGuJHTmNRrHQE/+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmP6wT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUVy0
 aREJXNdVx2G2POywOulTek9i/12eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFUZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LKXw3KgCd16+LuQxvR1nUWChXEvKjIsSGGJs8in1xThVIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxQ5eIgAQJG4GIDQCFA0M5oG5pJlp1k6WCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:lwjUKq0ZIA6s3r5PUdraCAqjBTNyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLULbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy7MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njDsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqv9jIDPr3DtiEmEESttu+aXvUjZ1REhkF2nAib0idqrD
 ALmWZkAy080QKUQoj/m2qR5+Cp6kdT15al8y7UvZKrm72GeNo3ZvAx+r5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa4HZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjHT4Je1rex2Gzj2MRWAYQg=
X-Talos-CUID: =?us-ascii?q?9a23=3AW+MD/2uPZgFPuhPQFwRM+7Lj6IsBTlmFkHqTc3a?=
 =?us-ascii?q?1DDl4TL3MV1iQqa5dxp8=3D?=
X-Talos-MUID: 9a23:5RYEuAj4W42QlAWwP+cKt8MpBM13/ry/S10xs7o8pvO2Jx1uZm3Cg2Hi
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="125069397"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbILVGEykJVEUvI8tQvUwYctXfdNzjwQaSMr/9Xad6lcnrTQmAmwuFC5aN8SSchEbNvhuPvPdivs0gUETT9xMPaHOXjKHue8DHtH5yOhjkLhOvTAW2zldcmFdEXdnsgzV/UGcrQtQan9QsSsz2PXLiYcU8BNb5rJuM38hN/l1aSx8TmponCaA2NN/x2E6NAmO9+k8SHYysQphSUeHmYVARp4SSS3VvkDsOslCz2QBk/xwO708lhal15q2qDKC51vjH6ggxKqF0/cc9SAZIGJPr5SlOF6jtYoLT9r7Fvbyc93dScT+Fh4XlrDF/NV6NdK7dNVkCnh90UiiX1z4ddVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBSxkr80y2D7Yl0jWPOGJABCEKQmi+24UWVd2iKXgGQ=;
 b=STHFdAuDW+ZFYM3GBVmRdHfKFm1JjrrqHyLmCcMxbTHVhiWwxEs/9YEVm+OlR9I6ns6YbJSeJDZzMqCHpmKNI7S00uToT721NNRLWkqwfQW8It6eJlIOaWwsJ+ssyEnw3Pl6Mvdke+SEvIUIo2wH8nvUvBLRvTo+vmPyaAPiFHRzRuIQtpWWJqrutfEUHaKRXVCviZx95MFetVq2s22QOt1pTX/t6K6W6ZJVNo4854hkZqKbOmWeLbVJqKyKSpKdN+59/yA6rzEDagiHC0po+VaZdhTihwgZuOEWrVNa5N7tUa7+1GQbSGc7A+lLJWF08ZOYDG4ztS8dfqobBcql0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBSxkr80y2D7Yl0jWPOGJABCEKQmi+24UWVd2iKXgGQ=;
 b=iQ0YnFZOoMMhIGWuxp5TULPeT2tsfONDiRKJYUY/3zD/JF1yOS6wghbjTbHst8PrCDbf3hZ3URA1zKiQR34KmbmUWmgaH1aQMvr6f764K2MB1NX7V7VYmdeqO9OR4TR/DuaYQwgvOLyHBv+LygL/gpN45FQ2rZAER9A2OcfhNiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER
Date: Tue, 24 Oct 2023 12:26:30 +0200
Message-ID: <20231024102630.47691-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9c9627-5a67-454d-6129-08dbd47bb721
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tSmDcozvIKeHw0o8b/wTxv8a6n1oxhRPbM+OVD23majsJ2169EOP9hFrcCJo56d1VytxJjSuNwe4JdgiSOk6G3g3ww9kYblfafs0cGcMEUfr6F0HUimBH375MCZpNAqLOlyjIakG74wFV5wLS29Z8f4d9p2ozeqL2WD60FX5u0cpNVR6s+RLEqjuuMjISI9hlYCzpdjMzmxHDfCrfeLNB2ZXqiHXeb5Sfl75KqNRHmAxKZlDEkgKqEqr2/i+ovBUWPRRvwxfek62bPIYbn+6xZ/dSZAoYfLxKEbhpQnyl/2dr9YLFLKg2kkaAKsD2Pdh6K24RBG/1aqf8KKSOVFnmTNwsSIpnK1sjfkVkXIHLfwe94KbOp50Vor/W2QtEl75IcTx4ba4QP79OXb0OnRQtrddlheftDFRnmG2YNgQheNlhyR/aRv8Vtlv8wY4NnB5BnM5BcNICSKF9y05QcVlZSHS6jLDTlVpKYrWeZ2RycDRuTUe+f4xtElO8G+uElh+7y3hz5xSl4POaisSOoxAzH3CC8DFep9lQSh2hY+DAmP6qxvSUIamb3MHzxizvkbj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(5660300002)(86362001)(8936002)(8676002)(4326008)(82960400001)(66476007)(54906003)(66556008)(66946007)(6916009)(316002)(478600001)(6486002)(2906002)(36756003)(26005)(1076003)(2616005)(38100700002)(83380400001)(6512007)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTZBQVdqY091WitiQkQzNmxDS1dVWnNDQVNDdmh4bURWL254Zk5XcUhrZUw3?=
 =?utf-8?B?RGEwaGlRdXkxYmMwQW42RnpVeWhIb2c4MFU4cFRadEtZY1d0SGxzOHlNNWht?=
 =?utf-8?B?UUxzSnBLa0xtUElxVndPZHQvL2cxNDRpVnFxTHBaam9DMHVUbzRsOTdSOHN2?=
 =?utf-8?B?Q3VWa3UxNkh0d3FhdXJyNGZzaGdnTVVlMWJlTjY3dU1kMFN6T2V6Z0RUNTNU?=
 =?utf-8?B?MnR3SmVTMWxvWUxvK1Y2QmhFMU04TW5SKzRsbmt5YnlCVWFZbklXRzJCVGxT?=
 =?utf-8?B?NndPVlZmMWMxVFlsZjhoK1NKU2RSaHJnd1lIZ21hNFMzM3Z3ekFJeHRMdXZs?=
 =?utf-8?B?ZW1kcW1kTHlhNldMWkZRbkZZeXBYZ2w4WmtQOTBkWjhFcmZUdmJZMHFHeDNn?=
 =?utf-8?B?Z2dTK2NGR0J2NVNuc1dJcDBMQjM5UzdyRE1xQVhOTzh4Z0k0Si94Z0E3dnNl?=
 =?utf-8?B?R2pNTEtWZHlTMnlzSFBOcllId3kxOWp5M0l0VjJNcVkwOGhmbTRyQlNXbVkv?=
 =?utf-8?B?a0dDdERaYlpwNEh4M1JneWpNNnEzRFdpRTVJbEg1SnVPVUZqWXdDL1Rrc3pY?=
 =?utf-8?B?NGZRZWJxK1lOZytTaWdKazR3Y3d3WnRXTnE2ZHFYQlJJb2VxTmdxYlV0WktQ?=
 =?utf-8?B?MmJQMnZ4M2t3R2lvdElkRVpNRVU1MFJTYjBHMjM2MG1uU2c0bXF0Ujl3bGl1?=
 =?utf-8?B?bXJPcWg5VXdRcDVaazMvTmc1cVJwaVB0Nlo0ZWRoMjVZMDN2TkpxWExFb3Nm?=
 =?utf-8?B?SUVYUy9HUGFzWW5UUGh4Qk5WYzJPRVNWdGdmam1GZnVlVkVBcjN1K3hScm93?=
 =?utf-8?B?TzUyVXprSlBtR0ZPdGkwRTlaN0xoc3ArVkRhQ1BMdVZzclJQWmQzaUdlOGNv?=
 =?utf-8?B?KzIzYkx5M2NYT01hUDFpNHBTYkwzbVdId0VnK3RjVEhFMFdFeDVJZVJLSlds?=
 =?utf-8?B?eGhVT08yYlNra1BzZStUNFNtdUp2SHpmT0V4MmszNUxvYlVIYkNiK0tTSDho?=
 =?utf-8?B?VjB6RCtLNjlNTnlKU0lrNWpmVlpKMmFZRnZsbFJVTWJ5TDJzb1RoRk5oVDFF?=
 =?utf-8?B?ZXZVMmtvdHpvRHpVbG5PLy9kK0MveVJIWklqdGw5L0NOV3NSSzBtVzZlZDcr?=
 =?utf-8?B?cHJBSytLM1VxTXAwcktvZm5mNXJJNm80ODlzK3ZzT2ZqbGNZRXlpL1ZDMTl6?=
 =?utf-8?B?Nm15UG1TekRCcTc3MkJsVFRpVlE1ZmpTSmdzdkxxZ0VudVpOa0h1MzZlY2s2?=
 =?utf-8?B?VTZNMTBFL3plRVNEbEhITDFXQ0ZKL2ZiNjNaL2JON094SXRTclhtcUNLY2tO?=
 =?utf-8?B?aDFaVEJHc1ljUFgzVDNOTUl4cEhWSDBKMzB2MUlHYXN1NmtaRllxbjZrZ0NC?=
 =?utf-8?B?Zis1MmN0aVdMVW8wTGhwMlpkWUtZRngxT3pnR1A0RVo1UWFZazBHU0NpRG1N?=
 =?utf-8?B?T2U1TnBEdTBtVE8vRmp2SUZBTWZXbEFuSi80WTh6TUpmcWNJL1ZheHBoN3JO?=
 =?utf-8?B?dm9KeU4rMFNqOEp2elF6L0RieSszRGxkODQ3VzJ2aTFmdjZwanE5VjVLNTVJ?=
 =?utf-8?B?VnF6U291VUpHK1ZqNWxTamZJU1RJMjdNNjFCb0tCZnJ6L2tLVk50NEdCc0Y0?=
 =?utf-8?B?S3k4Q3A0bDJLdGpzSERoaiszWHhsSmhneXNLdEV6SWdUb09VTVg4LzJpTFZI?=
 =?utf-8?B?dzZ3ZmUxbE1HM0hQa2p0U2tCOXMrQVNRNDNKN3BFeDZQSWRMOTRYYzhCNTBV?=
 =?utf-8?B?djNvS1c1S3NiZUZodlV6YTMxWGZXNi83dUtnM2NrdnJvcVdxb09PWFVid0RU?=
 =?utf-8?B?aHFaV1B6bEROZ0pyc1BvTDA2SHRXTGJ0V3MwWjNNMitiRktNTFlsSnI0VkZN?=
 =?utf-8?B?RWdUV0lmZ0xyOTMyVzIzclR1dXNkempGMTJjODU3SXdCM3p4N29heVpaSzBY?=
 =?utf-8?B?d0YzWTE5TlppdE16TUhxRk40WmtHenA3NkJsTHVZMXIvRVg2dG1RSE5UZmxT?=
 =?utf-8?B?b0tjdS80ZFduWjZjazNkc2RLQ1RsaDJXY05na3dSZTZhTFRpdHVTRDg3bXJE?=
 =?utf-8?B?NEJ3bWRNdzZmRUwzOTJvMmpCdWdiMkJjaS9JUmY1bTdXRDhvV0lJMENnbmFF?=
 =?utf-8?Q?qFVsxzP/gPrgL0Bd1JJZnGLku?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Wv7pzTUX1Y0bNrXUuZzTxIn9iR5SfUDkjMEsm+0cDgqmXA16X+ZsiYzhlrJTZqhNUJFeQ2Kx4CZSM/d/CRzO71TKcnDLG4uye6arOJUxLzYh5L1nBocIa33R7p50Z0Phvze//clc09kMkuWPw9bL1XtNewWYmpKyP28Moc7bmk/xorayJNW0cdP6ayDYTAD4WP3EgdL2BBjsKNK2euy6st4myZVWsjXmNJrYTwo76jPY09MqIMx8bQdo2egwX5yxgRTEheCP+aI2LRFVvR9uaygCgoJ4EFQattcE3yqdrkOOdjBNNdFJQknsILfOKPD3aofnNMPFL4xfc3QLLs7ynf2S4/6gKiLWklF3/DL1fs2VJQHNLbnttTRsd4Mjc3nGERVHtC4Qd7chcOP1MaqYsv2dViDYp6vIa2UTMffZY5DchvRa/j5bBR/dUZi7Ejz144Lh0zK81DaVvkO4sd9Wq1hkjE4GgvP9LD6woItIhUpGSagrw4h0uSpAFbBSpAOXs1vRfUIDyU//GxWK2UlEhNqr/vaopJcWO8eowag1f0yKxL113iLhR4I0QjZMeKbWPdo8GZozxgh1rKe9Ua/RwiAYkn/grmXElxxk/Ps5TL8ATqEeVRfQFz8GiIHgyCM4uArD8uWFP7xm5mQuGGIhxRK0OMNkD2AsP03hjrlkpEMuueJlGLtO78Jw//luL6TPDcFMrkXiVksZqnuIB6k89wrO7XoRmOgWnhEqtxxFIBMshhhWvslqGiKDwnLPdqsNsJLPvbGFOMaDt0WarTAG1NxSS7xTWvurskixgKM6hE/CoMO43jtDVdXEqCNrtGqvmOz9zkUJV+MNdUP77NS0A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9c9627-5a67-454d-6129-08dbd47bb721
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 10:26:42.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YyFJHJJqs5ujQ8sxWD81zjYIQm6GV15ILq5rqKMnKEWxbEgjY0Ft3LCX04E3Mwo9k9w+Sq74wj963dymqvBMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5468

The ACPI FADT APIC_CLUSTER flag mandates that when the interrupt delivery is
Logical mode APIC must be configured for Cluster destination model.  However in
apic_x2apic_probe() such flag is incorrectly used to gate whether Physical mode
can be used.

Since Xen when in x2APIC mode only uses Logical mode together with Cluster
model completely remove checking for ACPI_FADT_APIC_CLUSTER, as Xen always
fulfills the requirement signaled by the flag.

Fixes: eb40ae41b658 ('x86/Kconfig: add option for default x2APIC destination mode')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/x2apic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index ca1db27157e2..707deef98c27 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -231,8 +231,7 @@ const struct genapic *__init apic_x2apic_probe(void)
          */
         x2apic_phys = iommu_intremap != iommu_intremap_full ||
                       (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
-                      (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
-                       !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));
+                      IS_ENABLED(CONFIG_X2APIC_PHYSICAL);
     }
     else if ( !x2apic_phys )
         switch ( iommu_intremap )
-- 
2.42.0


