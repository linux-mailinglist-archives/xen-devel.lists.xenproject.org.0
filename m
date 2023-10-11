Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658667C583D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 17:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615545.956854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqbIA-0006gL-TV; Wed, 11 Oct 2023 15:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615545.956854; Wed, 11 Oct 2023 15:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqbIA-0006dz-QO; Wed, 11 Oct 2023 15:38:34 +0000
Received: by outflank-mailman (input) for mailman id 615545;
 Wed, 11 Oct 2023 15:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8XG=FZ=citrix.com=prvs=641e20fe7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qqbI8-0006dJ-2w
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 15:38:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38db537e-684c-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 17:38:29 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2023 11:38:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7154.namprd03.prod.outlook.com (2603:10b6:806:321::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 15:38:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 15:38:17 +0000
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
X-Inumbo-ID: 38db537e-684c-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697038709;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lm5EJ6NXYBCGBfvb722IOahrbRwZgsadv5VEHZ5o3nI=;
  b=NHfKm40/slsF8iThmAON7pZKl63i0iGL+swKr7Nwi0apylnXph+1DyfL
   BwOHkWP/gnsZPylV5yP//1LLIMLnt9FL3P60lnzQr71sc0yUegB2R2ZMd
   g9Sffhy8Sq1m3CuQPt9Rl4gYM4uwydsz7kes5R4cI7+51PqDItY+ZTE2F
   I=;
X-CSE-ConnectionGUID: XAd9UZwuRN61C6iEBH41Bg==
X-CSE-MsgGUID: UQUCoAiISTCAZTxJInVgjQ==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 128041958
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:wd9K46A/gZT05RVW/zTiw5YqxClBgxIJ4kV8jS/XYbTApG8qgTYCn
 DEeWGjQP/eDN2L8KNl2Pt+w/EwA7MfRzdFkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtB5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwys97UFx86
 uEiDm5URU6CqsiWnOuRRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCL02raewHOTtIQ6KYSF3flDgXyo+kc6OiEGd3q9n/a7sxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkgJSCRQLuMvssAeTCYvk
 FSOmrvU6SdHtbSUTTeX8OeSpDbrYywNdzZcNWkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:wIvjmKzylhwzRTy0cnjYKrPxy+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBHpTnyAtj4fZq8z+8D3WB1B9uftWbdyQ+Vxe1ZjLcKoAeQbREWlNQtsp
 uIGpIWYLKfMbEQt7eY3ODMKadE/DDxytHLuQ6x9RdQZDAvT5slwxZyCw6dHEEzbhJBH4AFGJ
 2V4dcCjya8eFwMB/7LTkUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8DlyxwgoeaTVS2r0vmF
 K12DARp5/T+c1T+CWsm1M73K4m1+cJDeEzSvBkv/JlZwkETDzYJbiJFYfy/Azd69vfkGrC2O
 O82CvIef4Dok85N1vF2yfFyk3u1i0j5GTlzkLdiXz/odbhTDZ/EMZZg5lFGyGpmXbIkesMoJ
 6j5VjpxKZ/HFfFhmDw9tLIXxZlmg69pmcji/caizhaXZEFYLFcoIQD9AcNea1waB7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0Aesoie0iRQnnp+00wErfZv60so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMbTc6+GgX2MGPx2aKpUCra/Y08Sg3wQsTMkcgIDcmRCeA18Kc=
X-Talos-CUID: =?us-ascii?q?9a23=3A47hr02g37UQ4//d6D51Z0haqIzJuQlTRnUriPFK?=
 =?us-ascii?q?CLzgwY+OUZHWwpPpOnJ87?=
X-Talos-MUID: 9a23:GB+27QXMtVJjo3Dq/ALVuRplHcZJ2JiFIXIxgbcnvfeLNxUlbg==
X-IronPort-AV: E=Sophos;i="6.03,216,1694750400"; 
   d="scan'208";a="128041958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DghZVyFOjUVXh6VDfxvLhbdclsWp9fybz6Dpp0mpWm4xSsgJwa+OF0pYTaSFqnBTU+CywRON7qe5N7hxWWKv0w3QMt1Il6TYvhIYAsP1VbbQEMzsbi6wGapfQXNaTv7mnvLu+C3DiFlxO3uNSUuNo83saM9QDR+tRiE1sFIk0UeW/1jEbwRku1V6Ipqxh18QmsxvcrqJqTxG0uG1BjeKbK3Csc1jZ15nYMA0+Qg3yjUW3QYRvl7LpvUos3WCcGDVslG6TltQZkqQ1By7+9F7kf0KEyvDbQoyWIrZEjwmMZSBrBZE3t53PtbGCcfTrYs9Ow8NC0Qvje856L8KdigW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odgBZvwG9yZybfJ5d3Ff3qPuk0HdQDlP9RvefchBs7c=;
 b=OVUmbAlb3uFQZCj0/qJ7AGSxvbrPhv5tHqH2rK4lRtobQkBzANxcsxY0zYNkCofclVhN4IItVr9V7PdEKOf8u4hwD+KbE+WYLAiOw3TXwC+fy9l7Gl4nmqBAEb5tGRCcBerNPFcKWJjEBqvNErob9M3A7O/QrtVI93TpsDmKoWg2ukt12DtDou62FackYIluDdtMkWkRpZD/Wx7xMXl66UtMBFHlU3xEZ5Xem8zzN1zsdIiCNpGTVew8S5XH+JrDeZCsSJ9uWGDuAm5YLrki5vtEbkLQ1JfWXpK81TGNp2NCn/WoKQE2t0qoD2dZUQ61zElL7OI0xQNoJ4JdMN51Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odgBZvwG9yZybfJ5d3Ff3qPuk0HdQDlP9RvefchBs7c=;
 b=asZ6QahDfiUVlj+20xjixfrCtMvBFhzsIIKgHMbe9mceSMW2q/qfVg1w/Gw4f0NYufpGzPWtwIv4q7996iY5OVXdHLLn3GNToV9COQPs25idABxtn+kzQ+Tc6nXX04mF7InfK0yxORQcn59vvQIz0fymoUrb7eHTiGb739ypouk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] x86/pvh: fix identity mapping of low 1MB
Date: Wed, 11 Oct 2023 17:37:56 +0200
Message-ID: <20231011153756.16714-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfca0ed-ecd7-41b1-20f6-08dbca701717
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S2lQreSwuqFVBm1b9t2gM4WFDPZMuruVDfqO3XmvLLkL+1D6cGV9lfpRKGENhZxz2BZ0hvvu00+f56vUhm5NU7LNrnqclWgklTWNTySITDQscajb5tE8Ovx/XWPzv43TW30V2Ylwu0uCnBcfN6ocZYVM77eq0dHpEDm1ICtHJ+riHhXZFV/uDozh58aVI+cQ3PMKtay4+uZfZ3DBySCpFsZydnkmIWcXXvH5w+VtmGPHfi8AOXfC8cQIQQEniwB+15EkAh5qwgsznzYTI4FPjNrbqgwvg8tKqXpvtoZusJdn/8DzTSTSMiUFiPsCMyXP9is2FmyezfDtt7SdSpSnrwj/AN5TdrTLQYKh63Hpd49HpaSBIvsB04kKcll+j9xAuzdgN2FfV/DL/NC2wO1QaLH/yIx0YPp90QITv1ufnoN7JgvSt5c0jqYa2ZzMclmZdLrb82pT+1RmknfHpVuwJgC22HBUWoPIZ61IuSNEYnOKtxCFS4MMykqkgLuQW0DTkZpeq7PrYYoiVM+p8ZArrsjK57+Bq0y2pRBu2Z8sM7zwFccyZLRXA+IZBa62KRsV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6506007)(107886003)(2616005)(6512007)(1076003)(86362001)(36756003)(38100700002)(26005)(66556008)(83380400001)(6666004)(478600001)(6486002)(82960400001)(8936002)(8676002)(316002)(4326008)(6916009)(66476007)(41300700001)(2906002)(66946007)(5660300002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2s2anhwVmgrOXdJQzV6ZzE4Y1FMeHd1TVl4VXQrNWJSTUFvL29zSUhKeGc4?=
 =?utf-8?B?dlE2K1JrdTFYZ3lsYXZJeDNSMVFKN2ExREYxb3Y2eXFkOEJGRzRRSTJxNTdH?=
 =?utf-8?B?cVh6Z2UrMjBPRkQ0cURSM1ZoYXppMFJORyttKzVXMmdpbEZwamJQajl2V3lG?=
 =?utf-8?B?RVA0NzR5eFprK2NLMU5DaExGVGhOUHJlMWZDNy81WkNTc3VGbGZzN1hFT25U?=
 =?utf-8?B?M3NjZzZUSC8wSXY0UzBmYU84VUo3ejc2T1ZxNWk5ZlBVdm5SdjRoWlNOZ216?=
 =?utf-8?B?OUd6c2VWNkttclQyWkVzYWN4N05TSEc4Mi8wWklveTZabWw2UFNDTEt4Rjhh?=
 =?utf-8?B?NGcwRGo2eVV4QWRxZnl3UzNDYUNMdDQrOFl5RURPQ3Fxbld3bVliTjVvNUhs?=
 =?utf-8?B?UXVET1g5clhsUW5tWCtoR3F0YVV3NjdPMFZhMEhoSjJZVUMvd3lVSGdaRHR5?=
 =?utf-8?B?SnpCU0huZkNveXh4K1VLemFaQnJxUkNQVUQ0OUJQaGZuMVVyRkZwdkczbGFK?=
 =?utf-8?B?NC9nQ3M1ZEdYemRxVE10djlYTHYza1RvTFNpbTVyQkxUU3ZtMEdHanFubWlD?=
 =?utf-8?B?Qlh4dko4YlRjR2p1S3MxRExTOFdXZTU4UzFIdk4vWU8xd0pKU1lKYi84YWJz?=
 =?utf-8?B?TUdkNklNWVUzL1g1WFhTaDJoQmY0VW9OdzIvZzhxSG5PSkZxYkk2K0tvTVZX?=
 =?utf-8?B?T1Qya0t2STdvNDFra1VuR0lnRVlPTndCV3QyUnV6WEE2NGR5MXhWNmpUc00z?=
 =?utf-8?B?V010VVdra2RxT3kvZU1IQnhqcGdOYmdqNTFBbWdkcjhFQ2xiUENtV3NYbk5O?=
 =?utf-8?B?dytxWjZGMUJJK0dVbndJazBYeDVVT1h5bDlHYTY0MkVnSWN6eC90ZzF4YjZv?=
 =?utf-8?B?c0k4MnB0YTMrdmkwMnJLRUdxcm5SU0k1TVdzUkhYaUx5TjFhTmFhcHpRUzRD?=
 =?utf-8?B?V2psS2srVUx5VWUyQzNITUh4YjRrUzQxQjkyU3ROU1RGU0tzTVJSTGw4UktF?=
 =?utf-8?B?OVJIUC9vdDRkL3Y0Z01tc2RJaGFpZGVPRFdFNGJoTlc5aW51TEVTUnpFR1pv?=
 =?utf-8?B?eHBLQ1VwdVRtS21aQmozTFRYSDZzblhTNWRCYUlTbDlyZUQwWjMzTEJxb3Bo?=
 =?utf-8?B?UVEzcWo0Qkh4MFI4VkwyR1loemNVT3hNcEdBZlNmNG11alZBVDlTQkdsN1N0?=
 =?utf-8?B?N3AwYlBDVkZ1OG5LbmZpOXVTRktGTDFGSDlTWVRlajVna2psOEtheXlzOEpZ?=
 =?utf-8?B?R0N6b3A3NkVjWDNMUTBCNU9JZjlaSk9HZmUyaDlzOXNpTHlFVXVBaG9RWkZy?=
 =?utf-8?B?b1ZlWXZaYVZEKzBEdWIwZEtmQkpobXRya1A1OHpWSkhqbi9LU1Iza24rSVpm?=
 =?utf-8?B?RGN2LzJ1YTdJc21aTFNWYkp1Z21YRkQ2NG5ZSmZxd3NTSTlBTFVLTWluaWxz?=
 =?utf-8?B?R1B6VlVCSERVZlRCUnFaYUtMNGwrTldZNE9jbk0vaUdudVVaaFRxM3V6WmVI?=
 =?utf-8?B?MTJhSEVVWTIzbno4b0FZS3Z1Q2ZreExjYmFwcnRSU1hxaWFQbURmaGo5Mkha?=
 =?utf-8?B?TUJDZ1ZlK0pXdEMyczVXeGdiM3BiejBjYm0rQnNJR2lOV1g4eC84Z1drUDRG?=
 =?utf-8?B?M1Ric3prenBKTnlDYkFUZEdDQkUyUFNIOEIxby8xZjZMeW9LU3pCR014RkpL?=
 =?utf-8?B?L3JzNEVZTnRLTnZjVUdEQS85c1g1eGN2UllMR0xORG1CK0pRRW0wRkd2Szdo?=
 =?utf-8?B?cGU2eXA4RXBwSU5UKzZ2MFlqL2hoWDYwUHplSFBLOVgzcUhtVThVSzI1V2VU?=
 =?utf-8?B?cWxHQXFpNVF5TFVZWHdCRFkxQWZydHRIOS9YZ2RnbFJKQlZDWTBGR1B3aWxP?=
 =?utf-8?B?ckYydklXdjRyODFidVl0SXpiZDZVN1pwd3puUEJkN2dUL21kWkhxNktQcWZw?=
 =?utf-8?B?dXM2TW5heFlldXB6eE4rRGJtNHpmeUJRQStiTTF6aDRud3AzOFlLMlc0dDJz?=
 =?utf-8?B?cDJSdzU4MkJldnhBb3V1YlFNUzFQUzFFaFVvYWF6aTJvVktzcDFndjcwRmg1?=
 =?utf-8?B?UjFiOUZUVnRkTWcvcjVXNDV6c3ZZaUVTeUdUaW1GMVdnemNObitBeHlYZ09G?=
 =?utf-8?Q?pH1slyg7hfg9BMhn/ejhJyf90?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gs1mkDbTC9+dDka39sB9AubKvaE8aHJ8Wgjf8cYJqwReUh9+P7fCPQYwwwLsf0LUQu3byCvLgRiF1qS9H2TspAtxnFSfHwonp6uwomuwdIiy6Tu1wlO5UVCwvcFoEaWkJx9WERcjcRzSwGsTM6IyZ34exn9WiE/tf1yfG2POgOibwSomzADosO2gypFJN+Li6Wem2G9AekoLLSCG+bqq4JldJxpFCPMfE0D244eyTkw8KSHUOkiuOb1/d+CIMsbBbd8fSsd7Xf0Re1STs+1oF8R/KVstufo6MKxBGwSnFu2bjux5g43WhUNl92P9ogFEAUM44HlZUvTjPBqQbXo4zR8WoCdiVcoviu7NKptgfnwYn6MSIF3bjevDi5Hg7Sa87+8HpnS/bti7URhdleAbCM1exZUg/2Tv2T6JL0+/YpqJBlmwrQGIAwqEva6CKqcPQIaNQC1ejg/oWJdv6WQBIWSTXC9zdGaIVJMSaFwa7o8xCp1Dj1u67pjkJdF9hgKA3Jvy+YqH5rrl9UT82v5o+HUzri1ampkCXPbFhiOA+bNF/Y29fLMXZWrSwv7gs18oBZLlUWqhDfqy8+wFEsepYm/MYalcKjZifBlZqg3S764O1rhxfozQ+M7JPUzp3LxjZb37H8JFHbFC91ELUpwlhfWVN4pSnxIIgivz+q2X+oNqa5PH+sk0vS6MLnEGzuMv0LINj50TYJc5JCFQByhP7EKSD4xu+rAOhbQ3z6KzA4bNmmlPmSi1wBF50xvKY0vAIHVCnazWX0FlD4KaiX2W/cXhpOUL9l5uc/a30NkrGH0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfca0ed-ecd7-41b1-20f6-08dbca701717
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 15:38:17.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHCaioYfUcLkPwdbId5n61yQ4E2dAwUTGyeF+IhD072hje1pQjXhoNn/jk6DwIUNjb+bByDVQJVjFnX2gWjyDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7154

The mapping of memory regions below the 1MB mark was all done by the PVH dom0
builder code, thus completely avoiding that region in the arch-specific IOMMU
hardware domain initialization code.  That lead to the IOMMU being enabled
without reserved regions in the low 1MB identity mapped in the p2m for PVH
hardware domains.  Firmware with missing RMRR/IVMD ranges that would otherwise
be located in the low 1MB would transiently trigger IOMMU faults until the p2m
is populated by the PVH dom0 builder:

AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0

Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
arch init code to create any identity mappings for reserved regions in such
range (like it already does for all reserved regions).

Note there's a small difference in behavior, as holes in the low 1MB will no
longer be identity mapped to the p2m.

Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c       | 22 ----------------------
 xen/drivers/passthrough/x86/iommu.c |  8 +-------
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bc0e290db612..979db7d1ec4d 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -449,28 +449,6 @@ static int __init pvh_populate_p2m(struct domain *d)
         }
     }
 
-    /* Non-RAM regions of space below 1MB get identity mapped. */
-    for ( i = rc = 0; i < MB1_PAGES; ++i )
-    {
-        p2m_type_t p2mt;
-        mfn_t mfn = get_gfn_query(d, i, &p2mt);
-
-        if ( mfn_eq(mfn, INVALID_MFN) )
-            rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
-        else
-            /*
-             * If the p2m entry is already set it must belong to a RMRR and
-             * already be identity mapped, or be a RAM region.
-             */
-            ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
-        put_gfn(d, i);
-        if ( rc )
-        {
-            printk("Failed to identity map PFN %x: %d\n", i, rc);
-            return rc;
-        }
-    }
-
     if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
     {
         /*
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c85549ccad6e..857dccb6a465 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -400,13 +400,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
-    /*
-     * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
-     * setting up potentially conflicting mappings here.
-     */
-    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
-
-    for ( i = pfn_to_pdx(start), count = 0; i < top; )
+    for ( i = 0, start = 0, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-- 
2.42.0


