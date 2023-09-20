Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA47A7567
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605242.942837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisHA-0003bn-LD; Wed, 20 Sep 2023 08:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605242.942837; Wed, 20 Sep 2023 08:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisHA-0003ZQ-IR; Wed, 20 Sep 2023 08:09:36 +0000
Received: by outflank-mailman (input) for mailman id 605242;
 Wed, 20 Sep 2023 08:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qisH8-0003ZK-WB
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:09:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0649e53a-578d-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 10:09:31 +0200 (CEST)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 04:09:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB5992.namprd03.prod.outlook.com (2603:10b6:208:30a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 08:09:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:09:20 +0000
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
X-Inumbo-ID: 0649e53a-578d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695197371;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F3lAlQnmKK1XtpR9quzAb8HH0LpX7ROzptC6db0g7r8=;
  b=NtShoKWYTKaVw8eX1hW1TZIWCmUFRUi+VDY3c4QQAa15+6KWdbNrOgRw
   ngyj/d4sSVVh5Cw8e2D+SqqpvUZxnd3DVFKqfSc2PorZ0Di/ryHB0eSbT
   2YNtF6TTKt5lllq5BJrZsVboPY4ZaINDTPpC6bIVq9396uadiU1NYdXlk
   E=;
X-CSE-ConnectionGUID: yqicCY+aTYyM3bdNvAEqDg==
X-CSE-MsgGUID: gWRWWll3Ttu/D604saKvmA==
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 123607672
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:96Dv1aIP8VUaG+8PFE+RbJQlxSXFcZb7ZxGr2PjKsXjdYENSgTUFz
 zYcD22BbvjfMDfyKt4nPIWzo00BvJKBztI1TVNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5mGGBF3
 s1bIQw8fzXYje6Q3puWU8Vj05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSMpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj32LeQw3yhMG4UPLKHzMFVhFnI+nAOTzFIDQegqNqnj2frDrqzL
 GRRoELCt5Ma71CmUdDnQ1u4oXqIsxQGUtxcO+Q/5EeGza+8yzieAm8IXztQcusMvcU9RSEp/
 lKRltavDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzrDLRAMo4gTcXkq+8xh0IoWiYuSA9lzz/ftGaoGDQTGpv
 mUC3c6X7+kMDJSEvC2LXOgJWrqu4p6tMzDCgFgpA5go8Rys/WKuecZb5zQWDF9gL8IsaTLvJ
 kjJtmtsCIR7OXKraep7Zty3AsFykaz4T4y5CbbTc8ZEZYV3eEmf5iZyaEWM3mfr1k8xjaU4P
 pTdesGpZZoHNZlaIPONb791+dcWKuoWnws/mbiTI8yb7Iej
IronPort-HdrOrdr: A9a23:v6Qbc6o3Fpt42Sv4YW6wq58aV5oJeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MBThHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaerIGuP3iJxAWN2uqUuFkTsaEJ2IMT0JdzpyfSVNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3Aj1wzNWr9ZoMWGRELEJtVkr7mUdE8c3b2/TTZH36?=
 =?us-ascii?q?pLD1jRJuLYHKJ1Kwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Apn/aPg6Hzkq82nb7Loa3rg9Cxoxn3J6RN0QJyqk?=
 =?us-ascii?q?apo6oa3QsID6+kjGeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="123607672"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUp8yR+J9AwdhHT1n+AS6ycKVhjZhuO/h93qE1RDPYZz+G1DZO/flPhvHOHgJgztxC3d3ecaXQWBljm1psw/kk/KoU/ttoFt22qoFfemVyN7KpuPSgdMfO2PDmvh20kqk/Me5tVkhtdIbFnvcoTikrS9TGPF5J/a0My0c1/YB3hDmm1Y6jp7AZtM0atS8K+RW721JqBej9l+NXo9WHoEPVrMcBklhLaaCIbAzB+o+sLe77xJpOcZ9QxFInHrN86cywpiviyJUk6w4DRR0oRG/guTFSw7UoXQqJgK5X6X+B2Ag6g2eYEl5hgBbXy3pfYYKXxsFF74hE2Bl2XGoIN+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiCVSrzuV0cihNYsA+nq97bZjh6d/A8HmUwpLWcWz28=;
 b=a2x624R0NynmQdR8bSBUIMEELRbcJ+sc9wk6aLDmDD0ycDmPlOpQRGABIt5OjEMJ8LszthEMpOotiCrB4mIUNVTzZUdB55ZThauZpr0BEMxWgOuX2g8bjIC5QrUBwYmDe9PU5MAu6lBTI1mA5Kc8GvEVDMkvAqUlk06jSilxsqZowhCequwAYq2O2i+v6MIERToVcTCeBRQGx5KmxbDi6lecqK/tuEyNmlmYjfK3vz00U/tqPYdWsc48IbRN4BXro3eKTMahmWaQOGOJNF087rqLpxeHfD5xTvXTVM9Kpp4BSsxSHBgM4PR3kFkTv2eTltpl5m3x02jzqTgtvdkcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiCVSrzuV0cihNYsA+nq97bZjh6d/A8HmUwpLWcWz28=;
 b=T4PY948BTrXvN9LNVVW3g2CJL3EQ+L6vZNwpjyKupROZIofmPEZtybzDFfFlj9aFdfR8yVdmL5oRQRReVKnylmDr/pa2vrukEPq8xcNx3kcp9bhULcHRX6Ozh9tjC/nxbpsQjaB9ocAwOgRqkPcETdJ9T/8A/UHohp+fmnzGPxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 10:09:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZQqoqrmDr2jY_bMu@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com>
X-ClientProxiedBy: LO2P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: b85c42e2-dc7a-40d7-40e3-08dbb9b0e4a6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9vNAWLU+CVnGdD2q7hOoCwioKTBCtrpRM358jYHyib5NB6H1RN9MRqRg+tk7ogLmN8vQgleK1zVZFM/tiQWrXdLH1ueAoKEffLA1sAMDmaE+FcFXbOlp2Wwwnc17yqT0mOhN1a6TQoPAiAxmXyyM7W009ifXzyiQHPU9K5PAWTcKRhqOJuFkzXPKmuu5akWn9ZgMuAaIHRAONwbE/IjSC1f+OB+9IvdPlFLmcBvhpzbhbzBGkd8PGUrZ22rEn0+9bBy90GyqCeJgX33RJwVDZmC1voY89VnU7Lb0qZNTNAtjf9LwsUDqj8SVlqSo8cBhmD/StxEdS8LSfztC5RgUtyDBy2in2SyW9J1rvjc65qEQsRPPL4gDb0QcsQvRAvK1tMN9m7MUhzy3/sKyWKHxHqdlU3gdfpyKpRG+G6H08DPmbbgPbIGanZfojsKyQmjaX7RQ8aFiAE67ZllNv415yUVp/+kwJUPaU0snibcLc4odLRPTyCuj8UrqmeokUm1gzQzNDXh38bQ2XqKllbWJyWUa2ejQWnG8cc1jc4/kT6T7a6YJrqrjNB3nsJiOw3t9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199024)(1800799009)(186009)(6486002)(6666004)(53546011)(6506007)(478600001)(85182001)(86362001)(38100700002)(82960400001)(2906002)(26005)(9686003)(6512007)(83380400001)(8676002)(5660300002)(4326008)(8936002)(7416002)(41300700001)(6916009)(33716001)(316002)(54906003)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDE4ckFqamg1TlZBWERvZGM2dVRoeVFJNGxrOGViRFhxMG81ZXBzMU1MTmVu?=
 =?utf-8?B?dDJYQmNiR0J5RFo3V0lKYzhuK0tpdmMvTXpOMTFqeFp5dmNqaDZOcWYzS3pI?=
 =?utf-8?B?VnViQjMvMlVTTExOT0w4dmhtMkFkMFNHZDRvbmlIelprbm9MUEFoNzZWWmIw?=
 =?utf-8?B?MGQvK3ZvTy9Td2RhaGFnS3dLLzJySzBOK1V6V1pvTzBmRU9kdU5XTStIWm52?=
 =?utf-8?B?S3ZZOS80bjVScU8yeGFmMVJTeVB2OThKc3lmYmJubTlIc3RlTFpFWW1hWE9r?=
 =?utf-8?B?cjlJbmp1Tk5odldJMlI1Q0E1S3VFMlByd3JiQ3dpMm1xRDlZWHFmaEJCcHlS?=
 =?utf-8?B?WUxFRTF4VzcyY0RlY0hydE9peHFweXBlS1piY3Y2bldGaEhUTzYycXo2RTBU?=
 =?utf-8?B?Kyt6Sk1Yay9KZ3k2ODQ2OGlIN3k0UXVNWUJ3cnNWbHRwRWJBNXY5RVhkNHlZ?=
 =?utf-8?B?THNsdXdDcTFzUUJWbloxeTQ1dkJZTzIwbW83UlpXd2RhbXZJMzJka1FUOXhq?=
 =?utf-8?B?YXljeUdZblozcC9icjVHL1IxUEJnRldEaXNPdjd0UkU4dUN5NExWcnMxMWpZ?=
 =?utf-8?B?S1NaV08yWEhFektlVDBXYktKVXBNNjZYbSsxT2NEWjB1b1p1R1loeTcxZ2hq?=
 =?utf-8?B?ZXJhTGVBUGlUM3lMNlRSL0g2VW1kWmkzdTBKZkdyWEgraXh6R1BmRmx6WjZL?=
 =?utf-8?B?enhndTBFZ1BBRS9nVkZrY1pxQUdPQ3g5aXl1Sk92bGtsVmxIY0xENUlEa2ZF?=
 =?utf-8?B?Zll5b2sxY0YxTzBpNXE4djNlVnZKNWlMU25PYnFkQjc4eEVHdDJSVWgrRlN0?=
 =?utf-8?B?YTlYQmRQRzg5MDZVMEQ0c2J6cm56N1drR3MxZERPOTBBVU5UeldwUXFLb0Rn?=
 =?utf-8?B?ODZyMzJEb1ZWRm9ZbktmM25ES1g1UXdSRGVGMkkvRVhBSThNQXErUm1PcGoy?=
 =?utf-8?B?N3dTQ2lhczVMc0hXb3lTcCsyem1vRkQzS2RtZXFrenYvYVg0cUM5czJrUEww?=
 =?utf-8?B?SmdRVVNBLzFZUDBFdFRUTk1kQ2tzb1ZwcXY1UUhzOUF4MW5NS0Ixc0cxWUhP?=
 =?utf-8?B?ZVFZRVpQVVJEbkx0cjRIa1VEK2ZVZWhoa3BxOFN3Um5hOHU4bEtpYmRaS2JH?=
 =?utf-8?B?Y2RkdmZCWnhKaUttdzVyMGhjb0wrWVo1Tk12aElkTkpuZE9XcFBwSHFMWG00?=
 =?utf-8?B?Ynp3OUthRWVYNVA2NGRxbWwvWTRBM0MveldpbkkwVnZSMEdVNFkxSGZwYzV3?=
 =?utf-8?B?VUtTZ3A3MGladUxzbUtYaFpFeVZQM3htRjhtS094UXZiMStLMjByNUdETkwy?=
 =?utf-8?B?MlMrLzJEY0JPeEFicHFUZHhmTm1JY3J4TGYyTnQ2d0UweWRvQjdOUDdjZ2dm?=
 =?utf-8?B?Vi9WNFNsTXJaMnRBdVlDcHNPQkxCR1pHV2VHbnY5cHYxdDFsVWxDbE9MV2RY?=
 =?utf-8?B?NHFUUGhrUlpxMkh5a3dxWElYMXhuS3U2NEc3MnptZmc2aWZNaWJPSU1KUDJS?=
 =?utf-8?B?NWVRc2hKL1RSSFcvRzVQZmhjUm5TZmd3SjAxOTNOcG9qQ1hlSnRUYlkyNW5x?=
 =?utf-8?B?b0NkaW5hdlFWTUF4SU4vS0xteFRmS1VEeVB4T04zNDVMeldxS1BCa2JNV1BE?=
 =?utf-8?B?dWttRWpBb20yenJ0dHVsMWtObkRtTm1iQVRrNTc4ZWI4cFM2ZUtMczY2Kyt3?=
 =?utf-8?B?cEtnVWx3WUlObTZ0SlYwSmtLKzZLQi8rU3Fka0FydDBaeVYraXkrZ0dhZkZk?=
 =?utf-8?B?TzN0NTRxNDJ2U3pzdlBTRXB1Q0FlRDkxN1hrRGtjblhuNWNwelNpYUtOQVhS?=
 =?utf-8?B?cVVjQlhxT1NpR2I2VXpNRHBVeTlnVDZkYnIrd2d0aEFyWmpJclpjZWdSa0xI?=
 =?utf-8?B?UnNRZFFZM1EzbUhzV0VHR2tLdmExcFV2YVFJUkdjMWxXMEV2b21TL1plS2dH?=
 =?utf-8?B?cUJCdC9UVlAvbjEwZ0wwVmpwRDZiVFc1Zk9DaDNqdXZtRHphN1ZmRDRSVHRu?=
 =?utf-8?B?eWVhWmpOTkhnbDM4L0lhU1pjclVTT3dNYnNvNW1xRVRyRFdKMm1qZUN0TlpX?=
 =?utf-8?B?OVlKMGlKUTVDQU8yelNLb25kTTVEYkM4ekJyd3NBVThDbjhjSzFzai9TcjlB?=
 =?utf-8?Q?oxAKcqeo9N3k7prbZuoKzncvA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M4VJwbY10sdchlB4a4H3uRz3ZaAw1a5lvAn8K5jt9pRscMllyLXbAkkSXZiWZD+stjLi+gOxDh09k2Vz6vEKuira3Ax5vypvL7L4kCGJTCsuX+EuSxDSiln/gWzlTOAOruM9yxJ+6ei4/XCebJ/0mYnjKl6VetkrPXwPfeo+c5hH0HTrFHyiB7vHPlC2fShX3hlHCCSwq1wAaIUmp6UrHqcDXU+itPDuoGBkUIDfFIpkhD238Azs7j9bcsFHY/znchShLZPglvZ0iiKWi+8PDWUel0fzDkpdWbi4PPQzFGz97uC3N8KSo97RrSoeY4UcsFFwLZDF9dNUeKhWVTdaNydT1uEgM/QpFJgwmd/a5JCc2ddfFk1k+fiLOsf/FXxp51JkQBlTN6nI0OuX9RQTuLwR62pU2KrE2gq9YBGhwsQIQLW0aRbrrzuRPMrQ94j6phaMGZ3d4QQ7tbmKsk9g87c2Xh2GsFnrCj8dqxGD0XmjwL9Q+KJYg97CP9tGzA2eN3NDniV9F4LmFyV01LNAzfNC67nRMLYKEUY2YmCumLHfJqvi7rkpvQZPctC9RU/ZUtDlqJp2BlV1yO+WdG+IxGTdwu6ooM3txl6PQjve4yJI8wKKYajWB/3gnXNDBXawe6q7NjSocwnJ500J+Z/ekY+Zxzv1GEOFHPfxwvGPbQ71sDRA4diRLBcAlgWoxGZPzx2kLdJDpkcmlgDqWDwu3PbioSQB24sEOmLnECN3PAV3eh1g+pX+WAOCYjzmSGCeF3opt8mbw1I9WT4JW8pvIT96Bmb2LtCEOC+dDLM9wmxLCkZmD4vk2niG9uVA6ZizeFLpK6iWLDrF1+De6DAvNvMFHoXFGgw+HPxoHY8vsanI3dW9/zwckTs8bqBcucjYoMqjV6yYhU8QQ3W4N0R2Ag==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85c42e2-dc7a-40d7-40e3-08dbb9b0e4a6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:09:20.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g1H0Vulu7K/aZ5orJH/gw8LWqt7wBUK20a1qexhmfsnVOwLqeXIa9MeEh1FrytLWsubpF7B+tmNqKfxFlJmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5992

On Tue, Sep 19, 2023 at 12:20:39PM -0400, Stewart Hildebrand wrote:
> On 9/19/23 11:39, Roger Pau Monné wrote:
> > On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> >> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> >> index 8f2b59e61a..a0733bb2cb 100644
> >> --- a/xen/drivers/vpci/msi.c
> >> +++ b/xen/drivers/vpci/msi.c
> >> @@ -318,15 +321,28 @@ void vpci_dump_msi(void)
> >>                       * holding the lock.
> >>                       */
> >>                      printk("unable to print all MSI-X entries: %d\n", rc);
> >> -                    process_pending_softirqs();
> >> -                    continue;
> >> +                    goto pdev_done;
> >>                  }
> >>              }
> >>
> >>              spin_unlock(&pdev->vpci->lock);
> >> + pdev_done:
> >> +            /*
> >> +             * Unlock lock to process pending softirqs. This is
> >> +             * potentially unsafe, as d->pdev_list can be changed in
> >> +             * meantime.
> >> +             */
> >> +            read_unlock(&d->pci_lock);
> >>              process_pending_softirqs();
> >> +            if ( !read_trylock(&d->pci_lock) )
> >> +            {
> >> +                printk("unable to access other devices for the domain\n");
> >> +                goto domain_done;
> > 
> > Shouldn't the domain_done label be after the read_unlock(), so that we
> > can proceed to try to dump the devices for the next domain?  With the
> > proposed code a failure to acquire one of the domains pci_lock
> > terminates the dump.
> > 
> >> +            }
> >>          }
> >> +        read_unlock(&d->pci_lock);
> >>      }
> >> + domain_done:
> >>      rcu_read_unlock(&domlist_read_lock);
> >>  }
> >>
> 
> With the label moved, a no-op expression after the label is needed to make the compiler happy:
> 
>             }
>         }
>         read_unlock(&d->pci_lock);
>  domain_done:
>         (void)0;
>     }
>     rcu_read_unlock(&domlist_read_lock);
> }
> 
> 
> If the no-op is omitted, the compiler may complain (gcc 9.4.0):
> 
> drivers/vpci/msi.c: In function ‘vpci_dump_msi’:
> drivers/vpci/msi.c:351:2: error: label at end of compound statement
>   351 |  domain_done:
>       |  ^~~~~~~~~~~


Might be better to place the label at the start of the loop, and
likely rename to next_domain.

Thanks, Roger.

