Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935797B5619
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611609.951125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaU-0000kC-08; Mon, 02 Oct 2023 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611609.951125; Mon, 02 Oct 2023 15:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaT-0000iQ-T5; Mon, 02 Oct 2023 15:11:57 +0000
Received: by outflank-mailman (input) for mailman id 611609;
 Mon, 02 Oct 2023 15:11:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKaS-0000iK-Az
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:11:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03fe02c6-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:11:54 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:11:49 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:11:44 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:11:44 +0000
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
X-Inumbo-ID: 03fe02c6-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259514;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jJsAOx8kE/kN1hdqURUPL3sawGxjRQ4dpNqXCPPjqIs=;
  b=ggF6cg5OSyWG+0+i9MOs0G2flvPxjeVYMW7TUXPkv95xepHAEoRIIbkG
   6l3ejlYux6P61W2R5naz9BxT5FWJ295oO0p5PzMMZ6XChBw6ghtKSpMBG
   1sqtWCTmXP4DICKmGE+Xxv4tSRfnj3IXkf/07z6vEWHaAxHh6kO3Qasy5
   M=;
X-CSE-ConnectionGUID: xtF7i30RRDmcBqkzfiVY9A==
X-CSE-MsgGUID: 6OtbiRVETGSCFHNbz+1CmA==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 123653168
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:x9Fk/K77FzFmvnN1pVF5MwxRtMnGchMFZxGqfqrLsTDasY5as4F+v
 mAWXWiAMv6LZDP9Kt5zPozipEIOvMCBzodrHlA4r3ozHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgT5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 eA2dzFWNiq5q+e96qu4WOdtuPVyBZy+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0oojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3ilBdlLSu3QGvhC3nqPzG0pNjAqemCQj9mfgFz9AvlaA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNwrstUnAyMj0
 FChlsnsQzdotdW9VXuY/6y8sTC2NC4aPGIGIyQDSGMt4dPuvYUyhRLnVct4Hei+ididMS706
 yCHqm45nbp7pcwW06S2+3jXjjTqoYLGJiYu/RneVG+h6gJ/Zaamapau5Fyd6uxPRLt1VXGEt
 XkA3sSbsuYHCMjUkDTXGbtcWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4ctC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:1Dhjfq0Zgjixb5PWw6h1YQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:tcA+jWH9MQksNGFSqmJ36GBLG5t9SEfxyXz6OkyqB2dXeey8HAo=
X-Talos-MUID: 9a23:9y/v5wguHJvoB3KJYLDbbsMpauB06aWUNm0xvq4tlemiPz4zYhyYpWHi
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123653168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdNyFeUVKN/HR8aQmSHzIZ/Xul83aWti7Gh66saFmT0OfksOZAAg/fdNcI+aKQgtUXuIKyg/m235MRAA7MAN7RbiybOFn8pnNn98NPh89UYMAgB2QNwvluCUmkI83jvSdNAdid62EoUEEZ7+rOZAb1CYJ5xs/oUXLR4AIt+3e92L2c025/VA8b1luwPB0611qyBxdC+zGVITgBPLkOEjNT72pp8zR28fRbpDakOwCCMIMt91gI07jwJCcV3F/0mbIw0K+F0Cw5IKwTLBf/JmrC2Z5BLsHaFcuaBx9ZjtZTQLEmO2nBtwfwqGMlZRrp/tAlyyoL6tcL8o1K8y3nmMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPu3fqfcmif+jqYw8nntfTTKnqMjKbEV4zKLUA72rgA=;
 b=aev8UkgXjQ4RyyN91YzNF12RAJXwIFzfczVyHy5Qw8+ShFGu/D0+rtG4kzY84JzE5zW/+6z8QNArCpMGSONWXXT9NrkjUkz69ig8Go2QKJkvU+6haMf8XIyAKbLSCcHO+B7BjXqBi7e+wa7dqH6hKoWAhNm43QgymW93FJ0fW6IwD22JoPLG4F4yd/o1RtjZmp39nD1VFrR/+5NDXcrCluNeHbNSZvHGYij7baNsgaFBl5g/056fUAnawpCdhBFAxpqhGgSfFMTiFQyymJH52oFA9IhIdAbOicydJSjedV5xvpgpb0aL869rCZfMg/jPoiKP5odRWtiSMZtb+qBdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPu3fqfcmif+jqYw8nntfTTKnqMjKbEV4zKLUA72rgA=;
 b=Q39JEcWuvCFyfmu0JDV1IW5F47FeillrUID9fvvwhFCV2yB/riE7PZVVxQ6CVUobIjcGxm7oyAGCbgoiAAQERshfvzOGwuDKMGFz51zg3rwIuUO1d/Br1vlNXLtxnddGsOGhm5ioSiwOQh7SHVIlQ+5a2wW2ZGqPCCV5LkYhc9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 00/10] runstate/time area registration by (guest) physical address
Date: Mon,  2 Oct 2023 17:11:17 +0200
Message-ID: <20231002151127.71020-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f547de5-da4a-49d0-2ac5-08dbc359e323
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwS6EM21O1VtzEhcW8vlO4hUPLyZ90u58EPkjhE2e4heqdNalwtdF03cojZuGjzD5UlYoLrDDvw/KOmf6LJv5WhIKZLMp+ZlztPur9sfb98uq4CdCY/AWRoXmSS1394a71Suj1RkOcUNGrwHdFgeUWm9okE0V1uBOYcOalSZNxNxWiguUh2pg+3T6tpjuj0b8KmcavH6nrD/05dVGAuXTA7BOS9NA8YbkM6pyMVvb8DFa7aulXcREGRlSxNlyfRxilUictLF4sbZgGBUtr3asEWC3DU/gzZo+Unzi3izuXbsoc0OSZfSHN/wqBfndub836YMQQSMTjVge0CHdiuNfGo5rXkAGj7j9VIzxdYg8H4UMIs+/3rBZppoVt8Moj4+U/gIvYsqNrlacbNH5ZNuZ5DF4VQBGs3l12czYe1lfkSVrC7xiZGExMtnnV6QrfYnmGNoBNGP8vxS7DU+ssC6E8noUdHa/n5bz43DY23X52R2su9DquKnwDMdOUn6nJDE76rv0QdcKoUH3SvyvdX8hcFPxCLX0h0ZTEVgiP6Ao62ZdBgArzDxSU+yeK7Llisq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4326008)(8676002)(5660300002)(8936002)(6512007)(7416002)(478600001)(6666004)(6486002)(2906002)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ty8rNDdpU2dQUFkxWFEyMnA4WS9QMVhadzB5KzFBSnpTNzNRUDdYKzFnZVpD?=
 =?utf-8?B?N0kyZEhjNHB0RFpHOFlKR2RQOXAvTEVnZ2dFVXlkWXBnWlN4dW01SGRaNmxU?=
 =?utf-8?B?R2F4NjhENHBaNGl3WFVXYTE5SXBNeWt3REl1VXQ3THhaSlloa2kwQVN3OWY1?=
 =?utf-8?B?clJ5ZFRjdE54bWhlOGZOT253WG15VkE4T2V0eCtBeTE4MENpQTRDcGIvNWxY?=
 =?utf-8?B?UGNaWEdxaHBKaDhQQnFZL0tmekluSUVhRms4TW41Q2xMU2V0QU1zZGY2RUUw?=
 =?utf-8?B?djdrZU1uVGRPR1FRQlpYR1JCcklHd1lZRk9IVVgzdGNsd3V4dU1WUUEzUzZ4?=
 =?utf-8?B?NHJxRDhkbnRUWExEZGtvK3F1RVRWRGFHTThoa2hPeU04OVF2blVKZ0hvTWlQ?=
 =?utf-8?B?Z2JXYzAwc2dPQ2NZUk1IU3VtMTBvekwrcEdVNzh3Z29IOEhYMUE1cnBqYndS?=
 =?utf-8?B?SCtQTnZYcGtadUMrT2hodTQ0SEFJYTNVaWkxVSt1RlVzUHYvNCtSdUJkL1Ba?=
 =?utf-8?B?ci9zUkJqYlhOcG5LN3hmOXQzMU9vNFh3OExibVBPc3pKWXQzN21ydG42Mm5v?=
 =?utf-8?B?MnpIcllZWUhoUzM0dzV4RGZ2ZEFSazIrUGVCZjlpRUNpdC96VFhzNzdHS1B2?=
 =?utf-8?B?Q21EQXZ1ckNUMWtnSHVKcHpzcFBCd1h1dDB3emE1alRpRzRhd1hlYVovdXJI?=
 =?utf-8?B?NW1YU1FEb1p3V3ZTUmUyWVJpelVJcm83UHozRzBqQ1djN096Qk1LN1AxenpS?=
 =?utf-8?B?QWdSeU9IUHkxbWIwU0NPVzJBS1BMYTI4RW16eUhOSFVXU3VqNkJNK296Vml4?=
 =?utf-8?B?NnhyVTdZV0U4TzA4NCtwdHphZkRoUUNlaEVSTjBMQWx3TU1NaDBwczJvaTk0?=
 =?utf-8?B?Y2w4ZC9LOGNXNCs1VjQ5bWNNR0c0c2FrNzdKbkR5MExFUWdCYjd3Sno0NEpP?=
 =?utf-8?B?UnloTmtBY213OEZGRlM4bHNTL1JBeDlubklRQVVPMStFVnZ0SS9VNnM3eUFk?=
 =?utf-8?B?WDcvd3RWTVpTNjE4NGJ5NnFERnAyUE0xN2liRFdBY3FsaWtHcHJ6RGxvT3Y0?=
 =?utf-8?B?dys3MlllRXhXcjdzeXplcGFIbDlTYkhFUmV5M0ZOL2pmMm03MEZPKzhpTENo?=
 =?utf-8?B?cHdMdDZTdWtMcnpYQmNYcWNyVHYzQXRMNDNHbjI4amhnRFBjWG5jcGtYVVlI?=
 =?utf-8?B?anlYb29ubFl0U3laOExHdURCdS9xMVc5Z1lHUWZ5WHdUZG9tOHBIREQ0akZx?=
 =?utf-8?B?Z3JpaS9yYjF6NGt5T0pqSllyT1dsMEMveEFWamYvRHFTQitKeXFGRlJUeWRV?=
 =?utf-8?B?RGFSVTk1VFBVeTV3ZUY2SUhWeG1Da2JtSnNYaHlqRkl2eUxJTi9LNnFwcjNH?=
 =?utf-8?B?WnFFOUdjSDJFWlpMRDZsK05MaFVzNUFyY2lOVnI2Z2lhMlFMUGZvWFl1dExN?=
 =?utf-8?B?WUxldmxLMDhwM3FGd0FGVVdSNUtkR0x1cXc5Z1h0anBhSHpZR1ZLTW5CVmRm?=
 =?utf-8?B?ZjNkZUkxQzlSTDBuRHRSVm5NNDZ3TzMvazJEaDZTT283TFVFdzMva1Izdkg1?=
 =?utf-8?B?QXk4UkpmOVFiR1VTOUZza0RVNkh1Z0YydjA3QTBoOUw4T1JVc0hTYW00V3No?=
 =?utf-8?B?RHNRVGdRbzMrSnhiQjlUYlIxVHYwNmt3KytIbjY0dGlUL3Q2TE9rS0NTc3R3?=
 =?utf-8?B?TFM5ZzczNjJEZ2JGc2VKMHg4WFFTbmdlQ1dlVjYxWHd5dHg4NE9KUmpnek9t?=
 =?utf-8?B?L1NRcGI4THpnN01CeWtOTmt6cGtpK2w2SHBxaS9pVjA0TXVjMXRpRXF6ZElL?=
 =?utf-8?B?UjhIYnpPYzJ2dzFJTkYyWUlWSnp0U1ZZY2JuNzY1V0RjQ1RHMDQ3M1c1cmR4?=
 =?utf-8?B?QkRha01IMjFBbkUydXdnRFhKNG5pREo0MzVXNFZSSFBWOUlhVnRLa0NCZW94?=
 =?utf-8?B?UDB6dzQ5elU1dlpja2FhWmdDWUIwN2tXOGMvR1N5dDlDbmx1enNmSDM5VjFs?=
 =?utf-8?B?VEQ1OFdCV1BvaVdMNGtJYWJPOFRzVTl1NEFCNmVpUmwwaGt5SzJ4TUx0MDBH?=
 =?utf-8?B?RE5lclNRNjJPbnJQVVJqMUQ3b1M1UDJySnFTZHVsMThRS1dFL0lEQ2xWQTZL?=
 =?utf-8?Q?in/JDTHpcXRi+LslBmOhyl3Cn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eMBf/t5q/+NL21GoyiJhR5VcnGLyUjvUc1DMkKMBQURpBGd+nXRPAdeVgMO0lGQ/Fp5tuITTHqtuSd2TPdP8z2vlRMgiCa0KCBSHMuIM+bLo0DDm4PMHCHdPl1zwlyqjXrECm8w0dzQ93O5XO+xdMDKw9NBgN7efU3AkKLyQ9mwDtJTRalkUOT87WQxw/+BmE2bdvB3i9dNH9Zbv3df560qVfFjlhPB0SX6sipmIuuTti6AaJKplDKZsZYd3jMHrlLzvAvQSC7TF6ezLCVOkHUXhGu9RdJOyzt1JqpBq0cPRMl6PosvpEec2FuJxF8mK3EatrB6BPltBCO5e3zh7R2sz9850tNUnXeTsU5/rZCgknPc9UrZ6lEOlvtJ5M/1DiZofNRZ85XvGirhDr0L+nh+8isP1bp6KgpUOp7c9zL7fMbBnH4nBVFK1UR0EnmCJo956oKb/aVFX2diWuvQARjS4qO7fARk1S0spyBvLx+BFfiN5k95PUuc9ZnrUUEdiBAGHl2pwoMqGZbjnF+MmMpBfytc1nuHV4dy77VHg6V5okpMivXFM0Bw6sYdJuXTN91Y7UAJpkKhwE9RJNUzXogpyxzgN6PDlMUMAv8X+W6DUhTbL/ZqIl+/JAqJAKB0ivka7tdJQWQGrTuYgf6ADvIf/rcXb1RguW6SxgNUnSzL6EUJhkF3gac8wQx0Wr3mvB3A8PWmePavcVCX7pJtUG35HPtdCRnoqr2ZaWJFileY+2FwV/898t9HjE6GCZHjRbIe2G+ytxstkUk03RhMgAZ30jEw2BsEuwbk1jCcOdb5XjsxPTeSQt7e5Ahd/y0MZ8ziIUAIBPNODO6ktTXE3rZSTOQqyOKicYtAbK6r77orEuCOOW6XsZaCTkeid+3mwNHI/GsAfDAZo+P19xDD2niyIzu72EWVans+U+yE2fIg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f547de5-da4a-49d0-2ac5-08dbc359e323
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:11:44.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qln5HNpVCToAl5VW9wNNj7pCXvgS+tTvrRynVy78ekC5chvoE2P5qqU8nEIDmttQLVMTlOavZGWtZvI4TfeZ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

Since it was indicated that introducing specific new vCPU ops may be
beneficial independent of the introduction of a fully physical-
address-based ABI flavor, here we go. There continue to be a few open
questions throughout the series, resolving of which was one of the main
goals of the earlier postings.

v5 adds one vm-fork specific pre-patch that does simply the introduced
code later on.  It does also fix a vm-fork bug.

Patches 1 and 6 are missing and Ack from the mem-sharing maintainer.

Whole series will need a Release-Ack.

Thanks, Roger.

Jan Beulich (9):
  x86/shim: zap runstate and time area handles during shutdown
  domain: GADDR based shared guest area registration alternative -
    teardown
  domain: update GADDR based runstate guest area
  x86: update GADDR based secondary time area
  x86/mem-sharing: copy GADDR based shared guest areas
  domain: map/unmap GADDR based shared guest areas
  domain: introduce GADDR based runstate area registration alternative
  x86: introduce GADDR based secondary time area registration
    alternative
  common: convert vCPU info area registration

Roger Pau Monne (1):
  mem_sharing/fork: do not attempt to populate vcpu_info page

 xen/arch/x86/domain.c             |  33 +++
 xen/arch/x86/include/asm/domain.h |   3 +
 xen/arch/x86/include/asm/shared.h |  19 +-
 xen/arch/x86/mm/mem_sharing.c     |  73 +++----
 xen/arch/x86/pv/shim.c            |  10 +-
 xen/arch/x86/time.c               |  34 +++-
 xen/arch/x86/x86_64/asm-offsets.c |   2 +-
 xen/arch/x86/x86_64/domain.c      |  36 ++++
 xen/arch/x86/x86_64/traps.c       |   2 +-
 xen/common/compat/domain.c        |   2 +-
 xen/common/domain.c               | 324 ++++++++++++++++++++++--------
 xen/include/public/vcpu.h         |  19 ++
 xen/include/xen/domain.h          |  12 +-
 xen/include/xen/sched.h           |   8 +-
 xen/include/xen/shared.h          |   3 +-
 15 files changed, 440 insertions(+), 140 deletions(-)

-- 
2.42.0


