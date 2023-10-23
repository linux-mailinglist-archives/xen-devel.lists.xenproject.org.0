Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC17D3818
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621462.967909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quv2J-0007KE-Hf; Mon, 23 Oct 2023 13:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621462.967909; Mon, 23 Oct 2023 13:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quv2J-0007He-Ey; Mon, 23 Oct 2023 13:32:03 +0000
Received: by outflank-mailman (input) for mailman id 621462;
 Mon, 23 Oct 2023 13:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rddO=GF=citrix.com=prvs=653ff57d6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1quv2H-0007HY-9X
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:32:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89695bd5-71a8-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 15:31:59 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2023 09:31:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM8PR03MB6248.namprd03.prod.outlook.com (2603:10b6:8:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Mon, 23 Oct
 2023 13:31:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 13:31:40 +0000
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
X-Inumbo-ID: 89695bd5-71a8-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698067919;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=a/HsEo6LR3iHkGEIna76xOPj1PvZEM/62oHAgdqWUHw=;
  b=FC+1ZaJbpDeKLQXJuR2bbAnb47AY3oxXDlhyrijRdc/JvW+4u9lSswDK
   cwm3QRmrnye/NEidNuzjEHQOEwSaabhgcLrneU9Eag4yC0eS6xToFosHD
   dJ66Zj+Lcv+1PzfmF0vYajTpqc3GMYge21y7tItNlGwF4p7Vaji7Ngwi0
   E=;
X-CSE-ConnectionGUID: Gz1Yup/nTQebIx1dQlf+Zg==
X-CSE-MsgGUID: iUd9Wbp5SLOR8m+zdKxOLw==
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 125616366
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:rNJiMq9jzAfhy7MZsmAEDrUDoX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GEZCGCCbvmMNmP8f48gaIqz/UxTuMXSx9Y1GgdrpCo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPaoQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklh5
 6UpNShKaCy6iuiX0Ou3c+1ixfYseZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwH2iBtlMStVU8NZrvVHC+WYLVSYycmHrpLqrhm2ufPZAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRgxc5dDm+dg3lkiWEIclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:eAhSmawRjhNhqxeCCOQzKrPxR+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhOZICOgqTM6ftWzd1FdAQ7sSibcKrweBJ8SczJ8h6U
 4DSdkYNDSYNzET46fHCWGDYqwdKbK8gcWVbInlvhRQpVYAUdAa0+41MHftLqUwLzM2dKYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5nmhY/rehkPAj8g8U2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/M28ZOH8uFj+kSM3HJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qd/hb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/GrdbiTDw3JsJdjcYBGyGponYIjZVZ6u
 ZmzmiZv51YAVfpmzn83cHBU1VPmlCvqXQvvOYPhzh0UJcYapVWsYsDlXklZqsoLWbf0sQKAe
 NuBMbT6LJ/dk6bVWnQui1VzNmlTh0Ib2W7a3lHnvbQ/yldnXh/wUdd7tcYhG08+JU0TIQBz/
 jYM4xz/Ys+AfM+XOZYPqMsUMG3AmvCTVbnK2SJO2nqE6kBJjbkt4P32rMo/+unEaZ4gKfaoK
 6xEW+wiFRCO34HUaa1rd52G1H2MSiAtA3Wu49jD8MTgMy/eFLpWRfzO2zG3fHQ5sn3OferJc
 pbCKgmf8MLElGeZrqhpzeOPaW6CUNuJfH96exLL26mk4bsFrDAkND9XbL6GIfNeAxUKl8XRE
 FzFgTOGA==
X-Talos-CUID: 9a23:OTUsc2C20wzFJSj6EwZ1rX8JAocjTkTQxlbAekOBDWgqerLAHA==
X-Talos-MUID: 9a23:hE0+rgVc74idoU7q/D7RiGBdPt812ICJMhAI0ocKmNmjETMlbg==
X-IronPort-AV: E=Sophos;i="6.03,244,1694750400"; 
   d="scan'208";a="125616366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9N2IvJ4B/McY9XaiHM3p/MVpo6t6EikL+FruyRbYeCXOocNe2l5MmErYg3cInngWgVe0TzSiDQUsrixIH9XUUTW2MuDTOGhiW80Sg+aR7x+RFH+34C5tZk9lNIhsIIiyeBQB9NsgKkTcdY9PkxVvIsiApkyAEbzZir7CItZmQrJ+do5XOvRNov7kGSKp57zNSftKQKY0vUS5fWHGz/xcfk3IOn/xB5GAm70lQJSe3j5gp9BUFzQO31+KYfKBRKXzOoBSTtsbEFqid/0h6roNlqfu5gOyXuxIJHlRAMnUUt+ButhKCP2MxZliCaZp41omywada+Xq0GAE9Yf8Bf5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSXlqjPToKHgQULyC976CQxyVan704f+/BpCJVPz8xg=;
 b=jyVVZxU0tVR3cuI/gUtcqO0FFmG9PHE4rigFQ+bt5FTVxhRsXYfgGdTTztGRAwGlyeYYHESOncLTr8+LTrbsnNlEgcWcxqlCWlkmEDFZKYrkBRZlhTYuXeN6i3Y8zYhy/ix1aeuaebsngwRmXNAZygdRqb5sgFOSY7PKJeGe7I/pcVT+/hNBq4FCf4QIgeZT+H0CDvIhqFt8hcTxm8YyGM4DR+zV1oIiJDLWr0EjMtNEs9F/g86/gWnmMqwLpv0K7XOqoP3+OsDUM99auXSBuxKI04c0Hgl9jrrg3AP2dkgMbNV7Qk6kkHk5/tvujdx5VrtTzel3czTQyOKx4RP5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSXlqjPToKHgQULyC976CQxyVan704f+/BpCJVPz8xg=;
 b=rccTDWb06JvCmhwIWSCnjkRbGsrJmN7E9DLSy8kVrC9nxeOLvhs9ireoSywCGqgA8zP0B59WfNzzhRlTYBrnFXM1yfNQ9o+raTm2O4nhp6RYBPpw9FTkkhz9WykmhncoHtv60ZtYl6Rg1Le48XCgGMfUV6lAXcOq1felMh7uDOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Date: Mon, 23 Oct 2023 14:46:35 +0200
Message-ID: <20231023124635.44266-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM8PR03MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba19280-761d-4eaa-95eb-08dbd3cc6385
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oWR6w+XLTmNehRAshv2Txhud+gt398oNgZzvuhs4Q8zj8WW5drZQsNrxJbsgbNkyNGTMrsa5p9IzCf1n/iFa6biEcQUxadiyyGQTxS8RoXXtf7+XIWsyRINK+U18qFdEB3nkPeBpe2LH3SAobqVkKGar9SkXaHyHmor55tLS9x/14WNJqbaLgCANkjOdC5USH5HUjtce71gE12Gmh5xb7nuxUHUKeWS/JmboSG8vdjXTBLWGUQWzJmSEckNNDz3vWR4pMCiQqXBACp8Zch1FqKJYr4ZznJuzboN/OZiz6g+Rd/Csmnbps2xBEXohxE97+v1HD3IngE8u6PgUWpp0QNQ4sgQa7MvFZUDnRFaQ/6T/PMEOIeqwXB3JNLrknnl1bxOD2yQPLSVl7Z3HX3k8wYHK2mV8kfIU+SFY1DzgEhhaDphWEaijcQFhts+nyZnxyDBlR165uSVfXM7ymX+MbAEObIIB06cCM8ZKskPf74538yAlr5PNZZ7s0NrbsOo4FMdM2365TsviVKoiCW4y0ukZTANtzCuLIpMsH4dm5gVhEiAzpRFAOQQE0kLEZe2+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(36756003)(2906002)(316002)(41300700001)(86362001)(66946007)(66556008)(54906003)(6916009)(66476007)(5660300002)(4326008)(8936002)(8676002)(82960400001)(478600001)(6512007)(6506007)(38100700002)(6666004)(83380400001)(6486002)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUNheFJ1bzF6azRGRDh3VjR1VjUwOE5wR1Q2STNwOUw0dWxBb1BOMW9vUkU4?=
 =?utf-8?B?SFUzMW9ucEtGWjQ3VW8wVDFVcGhRS3JsOTNaQ3JYY2svYmZIeHhxWEMvNjBQ?=
 =?utf-8?B?akNKWjJZSk9ZV3pKVng4TEdVSytXS0hUWEMzRHRoY05uL0JzY1BWRUg5ZGI4?=
 =?utf-8?B?NEwxRGxMcS9lR25Ybk90VjU5dGs2NDlQK0txcFNORnBFR3YxMU52ajQrUzBE?=
 =?utf-8?B?MUhibXdZU1REMkkxQWJzYWNKR090bGhNYXVxTlBmc3lSQWo1WVZmalFpamta?=
 =?utf-8?B?VldpbVJTT2tLRWxtcDlKcHVFWlhvckk0TDdQNnB4T282ZHlDNjlHOWV0UVcz?=
 =?utf-8?B?N3g3K0dOam8zZXB5MHBzRnNpNGUxNmZCNHpFamtXNC9STzA2c2N3Q3crbDVm?=
 =?utf-8?B?Y0pnZndsK2NId09DK2JYZ1Q4cHhiQllyVUMyY2M4T29mQ2pTYS9WTWoyWnBT?=
 =?utf-8?B?enIyajB4SE9tN3BpUmtIL1l6Z2RjRVdzRFZ3RUdwTkp0eEZBVTJTWEpNcWJq?=
 =?utf-8?B?RDFpYU5hbkNpeTBVQ3VuZzdoMFM4Nm9VcklCZFExL3pub3o4MEpSa2wvYmtt?=
 =?utf-8?B?NGM4RUhiUHdtMHdaMGI3MUZqU2RVSUV1YjRyR0Fodytxam85a1BJOWJOaDZa?=
 =?utf-8?B?MDBBTU5Bdlhtc0VkZmZDcTZhbG5qUnp2Y0k1WmpCRUZacEw3MWtMZlBEZE9F?=
 =?utf-8?B?VkNFMC84L1F1M09PaFU4UVRtWk1IaXN5K04wTWRmdkpuc1Z1ZWZ2RGhadHZo?=
 =?utf-8?B?ckdMNWt6dkViZnJ5TVJaUFhobHJoTitBNVNFZkM5UnRkMmhYTGJOdklxQmFx?=
 =?utf-8?B?V2FBZVBVTEpzUE5pNFZieU5wU1dneEZZOUlQT2xiaCtGQTFpSE9TMFZHMDY5?=
 =?utf-8?B?blA3OTQ5eWU1MFBGNzRsWFNINFhTYnJFT0I2azl5SUhtWjRZQkZMNVhUTFNF?=
 =?utf-8?B?TXFNN21wY28rWEwwc25SazNGajFTRUVwVWM5STVIdEZ1NmI1bWpqYTZRVXZv?=
 =?utf-8?B?VWhKSjZycmRMelBHVk15a3FEa3UvYmJYekhWWlNQSzEvRFg5T3ZNMzN4R0RJ?=
 =?utf-8?B?dDNyK1RsRHBLelRPVmR4eHpYRG9kR1h6b1J5Y0ZibWNOdEY5cXU5V3pRUmlU?=
 =?utf-8?B?OTFuN0Y1dXA2YnZlQnVXYWZYS3RFTnNBVDlXQUJDNURNL0FpKzZTS2ExVmp4?=
 =?utf-8?B?RDdVV2w1Nm9HYmN5TlJ6bkYvMThaY28xZTJraFpyd29RVVFwSjdrdS8vN1Ro?=
 =?utf-8?B?OE1EcFJiWis3NGdBT3B4R3JBcVYyTzZmTVBQdGZhUzdQMzZzYnU5NngyTDFI?=
 =?utf-8?B?STdNV1JGUTNJSTVnY0lWYlY5UzFRbHI3L0U2Rms2YVBvOFVsdDgvY2x5QmdY?=
 =?utf-8?B?VEhOaUdsMGR4OXNsbnlJR1Z1a3FsdUl1Q29qclN0ZFVMZjJiOGwyenVIY2Nu?=
 =?utf-8?B?c2FwMzd2RkZuSytSMmhYbXJsQkYrdU9yRFc5bkx0ZjBXcU9ubkw1Vk5LWEE0?=
 =?utf-8?B?QlhPd0VrUE5LOGtpWU40RTV6a2l1SUFIM05HZzA4S0pvT01QdVYxNlJSZWc1?=
 =?utf-8?B?SzVnU2hPa0dibGJ5OTdKT2dWQkZXbDdpRGlUQTFMbW1MVWxJS2x2MWl1VCtL?=
 =?utf-8?B?VW1aNjBZZ0JFMW50cWpJSVdDVlFkRWhuN1NRUG5oTWdEb1RieFJYOWVMcmI5?=
 =?utf-8?B?U1hlU3B1TXJrY290TVdlMFVub0tMY24vNm5KbXlOU0ZmWnNWUTh1S0ZHUWFF?=
 =?utf-8?B?ZlozNDVCY0tLT3B2S29xKzhJeEVqTXgyNVkvNkpLbFB6MGNZdnJXTDhmSFBO?=
 =?utf-8?B?WmVramhZcjgzNXdLQmY5V2pVeEljZG9DczVzUVUveCsxTVhEVFdDN1IvY1Ew?=
 =?utf-8?B?UkdKMUN1VDVGSFpjQ3NQdWtVVnpyRFFNUzUweHdNYmoydFdvUUIwWDhhZWkz?=
 =?utf-8?B?NEYwT3FMR25nUk81Yi9CNkdFRzVNR0szdVJvL2kzd2lLMjUwNEYwOHpoNUxN?=
 =?utf-8?B?RzhXNVRVVHFsRGREcllMTXE5OVJncDZuOWdyWUdROTZxU2p5NzAwSTJpSlo5?=
 =?utf-8?B?M0puMWlYeHYvbFJEdmVIdzBJTmNCakQzSDU2dVhwZ1BTN3lPcnQzS3kxR0t1?=
 =?utf-8?Q?QQ5fWuBSPGoPGD9yk+LeSBJgP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8wK18cePZkxnD60SVMhCK4OMGZNG9TmtzV90q7TPnVEAJJtprcb9zDJAUcSXqraLTRxtgKmTs3HvChdhYl9dRwLPVS4dhFO2lEs89kWEcG2EEpVWyRc8WlNU35OBiWh9B7ptmDJx5SWctnFpp7BztE4qL3yWWfmW1MzF7xkgBddYiJm2FMt59fBXCpsyv4cWga1XciiWnHM2CuZWn4VBpfwkB2bqfANNYyllb/lsZIxa4N6cckF/xb0iljic4D2Os+Lt+5br7iBC867T7sJv9cegv+8gT4RgMYYF/cXneYJJtoWL7ocOK3G9tfsPhc1aGqifF73xxUZzwbGaqttiQ834XEr8v88Op08IVyHymLawDJSoO2VDzIeCxqcDkIMkG0Vyx7fSh+Wy/6MPlZugBMx00NQSy7RHLGpOKzsNNM46kfd2V5pA0I8bHx9JncN9dRpUzahmSCDO+UtSKwLcrFpfKzQNHCa7L+kAx9vkur0DRki4rn+9MLvc3tHSdYKTgvye8m/ozFH4/W1b4/Mb9OnYTS2MFQ8qjTWB1V280mJ53sf+32/2Ya4TBBOswJPF0PKF+XEA8JE66mUqde8ag3IShqvH7LAturwRT+i6p/se154y+CZguwso4HvELwMYzkqEPoj1buxVzkl61FwwRx7KlzHmHbzklQXa+2TRAvGEGNaodUlGU+h4VeQK3bpWVaQi3zNDTHkpZDuTwvdnLaWaSG9H4H/KLJ5SSmv0i9vB9rlSYKKEaG1AsLIOH3+CxYkrlAJ3qyaaGlWn76+1LiBN2vgs23s+Ie+oqmBJPhInlNLFwt488aNPjZLxCBmNCXIok7vdiOfLM11NXWfQuA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba19280-761d-4eaa-95eb-08dbd3cc6385
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 13:31:40.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mh5f1wcckZRMfQKHFHEaVeoA8VBk+rElJRzo1KvBq9RnJbMYSlSB5XBIG+mXKvvvlvaaG9hGUYer0yYc6oCiSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6248

Sporadically we have seen the following during AP bringup on AMD platforms
only:

microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
CPU60: No irq handler for vector 27 (IRQ -2147483648)
microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17

This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
observed i8259 (active) vectors getting delivered to CPUs different than 0.

On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
descriptors to contain all possible CPUs, so that APs will reserve the vector
at startup if any legacy IRQ is still delivered through the i8259.  Note that
if the IO-APIC takes over those interrupt descriptors the CPU mask will be
reset.

Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
when all i8259 pins are masked, and hence would need to be handled on all CPUs.

Do not reserve the PIC spurious vectors on all CPUs, but do check for such
spurious interrupts on all CPUs if the vendor is AMD or Hygon.  Note that once
the vectors get used by devices detecting PIC spurious interrupts will no
longer be possible, however the device should be able to cope with spurious
interrupt.  Such PIC spurious interrupts occurring when the vector is in use by
a local APIC routed source will lead to an extra EOI, which might
unintentionally clear a different vector from ISR.  Note this is already the
current behavior, so assume it's infrequent enough to not cause real issues.

Finally, adjust the printed message to display the CPU where the spurious
interrupt has been received, so it looks like:

microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
cpu1: spurious 8259A interrupt: IRQ7
microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17

Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do not reserved spurious PIC vectors on APs, but still check for spurious
   PIC interrupts.
 - Reword commit message.
---
Not sure if the Fixes tag is the most appropriate here, since AFAICT this is a
hardware glitch, but it makes it easier to see to which versions the fix should
be backported, because Xen previous behavior was to reserve all legacy vectors
on all CPUs.
---
 xen/arch/x86/i8259.c | 29 +++++++++++++++++++++++++++--
 xen/arch/x86/irq.c   |  1 -
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index ed9f55abe51e..0935cdf07b65 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
 
 bool bogus_8259A_irq(unsigned int irq)
 {
+    if ( smp_processor_id() &&
+         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        /*
+         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
+         * has been observed that during unknown circumstances spurious PIC
+         * interrupts have been delivered to CPUs different than the BSP.
+         */
+        return false;
+
     return !_mask_and_ack_8259A_irq(irq);
 }
 
@@ -222,7 +231,8 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq)
         is_real_irq = false;
         /* Report spurious IRQ, once per IRQ line. */
         if (!(spurious_irq_mask & irqmask)) {
-            printk("spurious 8259A interrupt: IRQ%d.\n", irq);
+            printk("cpu%u: spurious 8259A interrupt: IRQ%u\n",
+                   smp_processor_id(), irq);
             spurious_irq_mask |= irqmask;
         }
         /*
@@ -349,7 +359,22 @@ void __init init_IRQ(void)
             continue;
         desc->handler = &i8259A_irq_type;
         per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
-        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+
+        /*
+         * The interrupt affinity logic never targets interrupts to offline
+         * CPUs, hence it's safe to use cpumask_all here.
+         *
+         * Legacy PIC interrupts are only targeted to CPU0, but depending on
+         * the platform they can be distributed to any online CPU in hardware.
+         * Note this behavior has only been observed on AMD hardware. In order
+         * to cope install all active legacy vectors on all CPUs.
+         *
+         * IO-APIC will change the destination mask if/when taking ownership of
+         * the interrupt.
+         */
+        cpumask_copy(desc->arch.cpu_mask, boot_cpu_data.x86_vendor &
+                                          (X86_VENDOR_AMD | X86_VENDOR_HYGON) ?
+                                          &cpumask_all : cpumask_of(cpu));
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f42ad539dcd5..a2f9374f5deb 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1920,7 +1920,6 @@ void do_IRQ(struct cpu_user_regs *regs)
                 kind = "";
             if ( !(vector >= FIRST_LEGACY_VECTOR &&
                    vector <= LAST_LEGACY_VECTOR &&
-                   !smp_processor_id() &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
-- 
2.42.0


