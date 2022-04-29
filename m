Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA84514581
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317072.536238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3n-0005xY-SO; Fri, 29 Apr 2022 09:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317072.536238; Fri, 29 Apr 2022 09:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkN3n-0005uM-OQ; Fri, 29 Apr 2022 09:37:11 +0000
Received: by outflank-mailman (input) for mailman id 317072;
 Fri, 29 Apr 2022 09:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkN3m-0005tt-Hb
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:37:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eab22048-c79f-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:37:00 +0200 (CEST)
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 05:37:06 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4825.namprd03.prod.outlook.com (2603:10b6:5:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 09:37:04 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 09:37:04 +0000
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
X-Inumbo-ID: eab22048-c79f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651225028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ORJMMvNnQVmZ7HWFk8JpgJ9yxSYZYozVFklh81N88pA=;
  b=FiZuov9L7peqGibSfeKs170ntzCxuzsTazDBS9kt9K6HNn4PtdgAokvD
   j91CqvUw/Yq5cXFEQ8qjN8DCEno/UPyOSdIk0KR8/TRZ+GY1Agvx5LZ4s
   +AJwbUQD95kVHBxjqWa64GVSyuMkJvGMtlbECW7y5QPe88iay2coqA1+f
   U=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 70098537
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BhmC/6qIEAPOLQaXdd4PrFhAXjBeBmIyZBIvgKrLsJaIsI4StFCzt
 garIBnSO62Iamv9Ko0jYYS08UgP75DXydRrHQM4pCs8ESIRoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvR4
 4Kq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBfbDFmu4/dDlkOjAlIpAe4qHZHD+imJnGp6HGWyOEL/RGKmgTZdddwcAuRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFg3Fs2KiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3N/ftnvjOMpOB3+LWzb9TTZYKkfNpMmmOJq
 0v5/ULzDR5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU3313rKVpjO7PW4SN30PYQcNVw5D6N7myLzflTrKR9dnVbWz19TzEDSom
 TSS9nBi2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:p1zsXqlBl2S2ft28g7Q41UoI/mbpDfOlimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81nKdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInly6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXsIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6U9bc16UGT0vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNId3AL3Z
 WBDk1SrsA+ciYnV9MCOA4/e7rGNoW0e2OrDIuzGyWQKEhVAQOFl3bIiI9Flt2CSdgv8KYYvq
 jnfRdxiVMSEniefPFmmqc7vyzwfA==
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="70098537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiQiqoyzttdTj8MO3eamdXC9fyp13+9fsfF4/55v9Fp01qJf0fj/d9dcBfQ395HruJhSeNSkHy+TET31hSAZjAT0b/kelYg+rshyFiMyLkCRtiLLYnk/nCvpn1AyRRcJoJjkkBcn11DOgD4Mc+lID7NNWH3mDIWnGdU/du3GMSJNffU7B5NS3ytemNbw0KnCPzaUGOMJ5tbDWQKUjTIGngAhSQsxv/zsQsDjegEJYpdRgDF5O4jhZKVEUEGJXv0YyDs9J4t/FZL2XyOak4/d0m4EqgG+OlDGMTJtdR4U6pbPyuFnwFEdaql67QLGWFtj7vSXeDm1AMt8qhVQEk7TXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma9YKJQlDCAv1sCb57FfMX4fSZLJmr+FZCfb9h8i2+U=;
 b=XZJkJi+1GT4SQJg3p86IGNdze5lbEKfSnRy2RZY9GHOb8tdOBD/zgSd+7DA5oX2FNkX6brXjY2yVvwRL0ah3w8O1h89C4NY7NkpgN7e2QmYfOtAnViuQTb8SJdBpQ6bV7xyasTXYyFRPRh2I/5I3Sn8kDH41vNOW3+C1ATPejiud8ryS45XDLAS2+e9lAGpnhnCvWK1yyFxw5KMgYHgaIY9uZcauFHFyKc2SasbuMI0tRqS4deh2sMjNJujuv6SUJBiiBpqhTG3kmq2hevkXLC2wTbIHFEX0G3rwvNDBhzT1lp61sbbNNAlCikG3pVQyyKkHsx0obAff412TC8K6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ma9YKJQlDCAv1sCb57FfMX4fSZLJmr+FZCfb9h8i2+U=;
 b=GtilG0b8ateTKW+H9qvOIlPM9mBcrZFUf1MzzNzTkxJHKVfoxpRkb+ER4epzn/wSmB/gcbJhRwsJdFoR37pWINjHuWbT+KYiWyBoZz8/2q92wLr+6TSBsX5ILm60POOXm8iYrWLWVZe/cS2WRyskazAIDpGolyLJM1txZMs98jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH 1/2] kconfig: detect LD implementation
Date: Fri, 29 Apr 2022 11:36:43 +0200
Message-Id: <20220429093644.99574-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429093644.99574-1-roger.pau@citrix.com>
References: <20220429093644.99574-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6bf585-9f29-4a12-4a35-08da29c3d1f3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4825:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB48257348179265D07105DE7C8FFC9@DM6PR03MB4825.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qg1HGnCNZiC/Sc8rBJDhgnxyyvYTyPpdE0DW7JlzYDLbr5xaihEAFF7pezE2KfBiU9UnOkFoIxPDY7cj9h30UPCnfcNZvLJNZ38sHrTt6ueI7hKZwjBw2/qX7EW3cDC2BEVZmkti9vIeF8IC0ui5pJfhK0fXcUfDnTQ6qmYPT6eAWIv+E4rl3x8BunfR/XKnhZk4uDU4oOfLAo6KHdm/P//DVXKEbDAI3TEvuyPdSVeNrltwhniorQcYbeu2w1fTgQLzHAiJs8BAJJrX0SbYdceONjWeJw26G6qlgNFX5hGof2DSjDUJ5rm3oWqaC83PkVp+N9RoFtSupW6+CSGoH9SDVCfH7Dpsnq+SVm0pl6cLFDH1KD24NU5LVzdXAThJB2cuMm+1qzaNivDxyZsIR6GjCmWg9/jKCoqbg96LJGJ5xRN09RgOXASuo4vHSgKmpgmwD/3rmVX9m80JsXdp87I8lea8vd2OAURgo4pAcZiBuP9cdCA/Jog1SSBKvKy03XUIKe/F4dEXPSWvhbgOMYmNNUD9PbcnS5E5M8pnIOKhhhosPaVqMBvRCcLUuDI9OFdRsJ9wI0axe5X1h9LkNSU/dVX1CpVTEUzk1LalXxwFI1BwezdB0SCHFr+qzYNahrbwdepTU0Qbd238OcrKWk7LZ0nWbM3TMT44XLa11CFeUHMKDiNbr/rSxcE9r4tggPXmOQl07ANvf/BjtWnVpjzIM3JIFcXsC7icMy4BLGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6916009)(508600001)(8936002)(36756003)(66476007)(4326008)(8676002)(66946007)(316002)(82960400001)(54906003)(66556008)(26005)(2616005)(6512007)(6666004)(2906002)(1076003)(6506007)(966005)(6486002)(186003)(83380400001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STZINDRlbThuVEExakFQSjRyZGZDWGExMEY0SXZVMTlneFJxMFoyOWUvaHdU?=
 =?utf-8?B?R2llcDJvclZFcjJwNnZHelZyVGpjYjgwcVduWVByWTVydzBMb2p4K01BNExN?=
 =?utf-8?B?Smt5WTl3STU2K01EdzVMNnQ2T3VKMUxaNGN2V0REbGt6cTBDVTQwa3o4dGdj?=
 =?utf-8?B?QzZ6akZNNWk4bnI3ODNZeTZ3cjNmQiszWDhYUXdPUzRvOE12V1dVMTYwNUk3?=
 =?utf-8?B?ZXhVK1o3NjFYYllwcklGZFQ1QXBJcVNXZTZLNXFpZEYxSGxyYnYzeW0vcnha?=
 =?utf-8?B?cWQrWVowLytSOWFybDdnNnZrcTVXeFZOdXhOTXZnakVSWEVVY0hVOXM5QnFS?=
 =?utf-8?B?NUZlZ1hrVkp1L054ZlVsR2hPeDlNUXFYTnAxaHF5QU5vbmNsQTJlbk4xRWh1?=
 =?utf-8?B?V1lDMWQ2ZHN2RXF5U1R6OTJ6OUNQZTVVdTBPSXZqN21rNklhM3V6REVJZmMv?=
 =?utf-8?B?R3dodkhqaHZtenpPSzBGQnRpNks2L0laSU5mSGJjWFo0VkgrOFptS2ZWbkRa?=
 =?utf-8?B?Mi9BQ1N4ekpUY2RZU3N6QWJ5eDdMWXRDRUEyR0Vsc09ZRjhZKzBTTTJWUzh0?=
 =?utf-8?B?WDIwOEw0NFlRbjVyUXFIb3VZME5XQ2pMRy9MRG1pK3ZjZUdrTXdzMldTU3lZ?=
 =?utf-8?B?Z0Q1WTNUT2dCRGxBY2xtY3dvc3JaYWtxSkdyWmlIVkZwblRCaXFTYkRRTWFw?=
 =?utf-8?B?Rmdxd2VGRlhTTCt1T0toTnMrOERselRrVVNCNjRRVmRHRU1DaTYzT1B5ZzFq?=
 =?utf-8?B?YmRsdEJEdDVqbUkyZit3bDdiUFdmSmRYQXdtc1pVY2FrNzFXSGFOUWx4TCsr?=
 =?utf-8?B?OG85MnE0RVZhb2NkWjhybVdsVnoybVFsdVZndjdJRmRuVWIzTW5OdW1udTRC?=
 =?utf-8?B?ZW9DYXNXTG1BejFUVzFYZDZFN0g5WXJaeThuSm1sSG9Jd3hSa2wwWUlVSWVv?=
 =?utf-8?B?Ty9wYnZvUWlHVExWYTE2d3JxeUxESUhIYWV5eVR5MUM2YndlNDBVTjM3QUha?=
 =?utf-8?B?UGhBZTZNSitoQ0l4bGJCd0piQjd0bFpnZzFOZVVxRW56S0R5L2hmeThmdGNo?=
 =?utf-8?B?ODFNL2gxa21PaGF4MWF2bTRtcGxrWGdnRDBpMTNBMXZCNWJ0bHFYU3JZa0xx?=
 =?utf-8?B?RzNBek12L0x4d1BpNWV6UGVrUExPcGFjUElZUEhlOUNPWDZXcVoyK2tYV1hZ?=
 =?utf-8?B?K1NMS0poVWlqTTBrallRa3RvMjRERlc0aTIrR2MwRGJDZ0tqWjcveEJLcUpT?=
 =?utf-8?B?Y092U1BRSVAzRytiTytLMDJUMG5SdHNlS01LY2Qva1VuZnhSWmErcHJpaStS?=
 =?utf-8?B?SXBWNXVKQlJYQStWdHpPMHV5ZERHWStiZGhpL2ZCNjQ5Q0NRdU4ydHpuSW01?=
 =?utf-8?B?MTNzV1BMOVZGUUwwTWJEY3lXSGNMazRwYmlsbTdOSmQwN2VjanpiS3F1NU1N?=
 =?utf-8?B?ald1QzZMM1VDZDZqc3MwY2szcXp1eUU5eHc5VWw3L2pFMWRKaXZNZ2ZXZzFu?=
 =?utf-8?B?N0lENkttbDlXdjhVZmgvYVN2Z2xuZEZPbHc0UjJVd21VNkhRczR5ZzV0MXdS?=
 =?utf-8?B?NXFDTHBpVVJHTng0L0Nkcm9SL3hLeDYxazhJTm03d1BLc3RFTktHMmhwVEVy?=
 =?utf-8?B?VDlOZ1huaUxOTXhlb2UwMWs0SElENGdFNDg2OUcxVGhqbkdLZUt4cjdHRmZs?=
 =?utf-8?B?TzdvWDY3Qm0wYUJCd3pDNFN0YzRYUXJYN1FRQkhlUURpSm1JbXJQZWNLYU9j?=
 =?utf-8?B?Q1BYVjdhVDhaQzZlQ0RIcGcveW44ZjRJV1NRZG5hVVpZVnNsdlowcEhKSXkz?=
 =?utf-8?B?aGl3TGU5VTlMSGhpNjhhb2FUZ1F0Z3NiRURIc1JNR1hoSU5TNlYxa3lXekdQ?=
 =?utf-8?B?eXlRZGNqckw1WlpVU2c3emphb0NNcHdUbXV3L054Vnd4bGx5RFZzYThKbDBR?=
 =?utf-8?B?REFFb2d3Y1VYb0FsUXBUOVRCRlFPMDB0N3lIOU1TaFhGaUZzYVFOR1VhTDdP?=
 =?utf-8?B?bWZ4UEo0VE1SZ3RPSE9WV0xaclpoNlF1WnMraEF5S04yb3UzU2hIQi9zMXJ4?=
 =?utf-8?B?d3lobDE1dWxRLzJUVHB2S1g1TnJjUnR0Qmk2NkZYZmVyamRuY1FWLytqZDg2?=
 =?utf-8?B?KzhrR1BMbS9PT09EVjBCNms4a0lvSjBGVHFqd0RQQTdkNGFEakVSS0E2Rysz?=
 =?utf-8?B?R0cwKzJrUUNTRFRXRSt3TjdBQjhvQnBZNzIvblp3bzhENzhNRXhScnVrcUNh?=
 =?utf-8?B?aWRqV2RmTlFjQ0c4RTVwQWJWNG9wZkw2aDlxVjZoVlE3bno3VUhxdWV3WmNs?=
 =?utf-8?B?ZjV6N1pKSDNGeDgyd0JDSjRMMWE2SDZyNW1La1Q1NUJVLzcycDFJVmU5eUZX?=
 =?utf-8?Q?V2J0GWn6zNRlhYkY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6bf585-9f29-4a12-4a35-08da29c3d1f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 09:37:04.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tcl7RJOl9Rqr8mSSfRNjYxrjn7Bk1/82jqlQ4xkzAgjOfMXJVyqIiUQdHMg6hHmlxIDo6PwyZWbZFkP7aEyxEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4825

Detect GNU and LLVM ld implementations. This is required for further
patches that will introduce diverging behaviour depending on the
linker implementation in use.

Note that LLVM ld returns "compatible with GNU linkers" as part of the
version string, so be on the safe side and use '^' to only match at
the start of the line in case LLVM ever decides to change the text to
use "compatible with GNU ld" instead.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
This was discussed with Jan in:

https://lore.kernel.org/xen-devel/fbe0e0f0-85dd-434b-aca5-fa513b720c0b@suse.com/

While he would be fine to use the option if it was present, he isn't
convinced tools capabilities should be recorded in Kconfig, and hence
doesn't want to introduce the option himself (I hope I got this worded
right).
---
 xen/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index ec2bd9fbcf..134e6e68ad 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -23,6 +23,12 @@ config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
+config LD_IS_GNU
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^GNU ld")
+
+config LD_IS_LLVM
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
+
 # -fvisibility=hidden reduces -fpic cost, if it's available
 config CC_HAS_VISIBILITY_ATTRIBUTE
 	def_bool $(cc-option,-fvisibility=hidden)
-- 
2.35.1


