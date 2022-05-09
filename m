Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AD520597
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 21:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324795.547018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9WS-0003kk-Ja; Mon, 09 May 2022 19:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324795.547018; Mon, 09 May 2022 19:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9WS-0003i3-G7; Mon, 09 May 2022 19:58:24 +0000
Received: by outflank-mailman (input) for mailman id 324795;
 Mon, 09 May 2022 19:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no9WQ-0003hv-N9
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 19:58:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f46e371-cfd2-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 21:58:20 +0200 (CEST)
Received: from mail-bn8nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 15:58:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO2PR03MB2181.namprd03.prod.outlook.com (2603:10b6:102:14::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 19:58:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 19:58:13 +0000
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
X-Inumbo-ID: 5f46e371-cfd2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652126300;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WbqcYYVgHJuYaBndmOeD3n0mMrXfn1pCY9u6GI4npg0=;
  b=GTQyOrJBc1VCl+ZFUtz4rz9LkAYiJBBCnqvRRU+gwbwn3qyDOQcELfua
   exjUe17n7O5pTdGN+Uu4KyltMT5XssDI5GyogISmypZ6bKCmzgm4ikJF7
   Sl0GPkZk0Sqf0rS8VUoOeT/4qvNI96e56OiDUMr03yf3G3V3EQe3j1jNQ
   Q=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 73405879
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W9+COq+7nBAa3LfnF+WqDrUDnn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jEWXjuFaK7bZmv9eIskadjjo0kBvcWBndQwTQNqrSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IDoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaWtEw03I6fhpOIcQStoFHt1Yf1W8bCSdBBTseTLp6HHW13F5q0ySWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHPmMuYYwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3O+fJqszeCpOB3+ISqd/XEUdm4f+l6wk2i/
 lDtxHrdDg5PYbRzzhLAqBpAnNTnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTo/ajjVWlc8lCM
 EFS8S0rxYA481aqVZ/6RAGip2CfvQ80XMBZGOk3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCITfWkLYHdUSRNfu4W65oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr+hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:93Z2TqBagU5X53/lHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.91,212,1647316800"; 
   d="scan'208";a="73405879"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgojBs7GvmcztUpj1kOrXQemuTFKzs7uXuPl1FfWFvwwmPB+GfC0YE6QbUPc5GJ/6KrIHxhwD6RjZIJHERH10uj83PuuLLLKD6JXCK90smxhuy/x5sT5CAhN5eBk70TEIR5rLdKcFq7zZum/MvvM73qZClcWqwFgc4Xx7u8NT65AR3X+sI/gvZ5CPL7Lv13M7Lf1MvDIrotWhDHO2YTuo10rV81blQThLsu2rmpOT3Ueow5bJmCvP4cKRz9IMSq2rJyY/t0LRQKtDezHefSxXuRMB194arx7/s5PpJoaIj4jTRmm4UJyRkYx4TgtLtdGw8A0B30E7NmNwCjZkCmNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbqcYYVgHJuYaBndmOeD3n0mMrXfn1pCY9u6GI4npg0=;
 b=WXTs6YbxKOjFXW8Yf8Y1850R8hjY5Slf8iJr6VqvLwCCBwB/A1jpFXwlFG/r3lVeMGfsW84qSgu9ZO8bevmFxqOE1jPXFCfFtalUBwx2lqfApDBFzTMnqZ+B++ofO5qu/ngzRpo5jnwczfyQ75m8VcV0l3EUpIVqEcwoMRdmanA5bXV34sK+GBPkPyQToI4ohSDymybil1SgtS1NyI/Ks8M3bU6O96s4/mab+q402GNVXT8gNFhnwqAOA2bPt04c90rawad9I0pBZzxy75wunofJugwP/mb+ri2tkFXBz452Gdah8/Q/bvFvNkM8VjnyWFDEdu8xTYBPukPoQmM1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbqcYYVgHJuYaBndmOeD3n0mMrXfn1pCY9u6GI4npg0=;
 b=nOd1idY29JtvjwVKzPpdMnYZprCeejHw9XDxE/1zyoSZN0akf957/8EfOumPBJB0JW0RHJ57Tl/ysQ2Tw9Oykqzzlc5CdO3Ksh+GNgr72d3qDrZRWaec1kipoIXSv5Io5yhiTPc4I4X2Jdz2U42AVQ73jw4y7ecNNvwujXEw3bU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Attributing linux related patches on xen-devel
Thread-Topic: Attributing linux related patches on xen-devel
Thread-Index: AQHYY72xbnLDDfw++ka99EP7Gb4Sqa0W5wEAgAAHugCAAAgEgA==
Date: Mon, 9 May 2022 19:58:13 +0000
Message-ID: <e5227769-3cc9-d9a0-050f-4abb047879ca@citrix.com>
References: <1c5619ff-0872-8c0a-9dbd-9f419b9c957f@suse.com>
 <alpine.DEB.2.22.394.2205091159480.43560@ubuntu-linux-20-04-desktop>
 <53eed7eb-e563-2ec0-262d-a96f092d683a@citrix.com>
In-Reply-To: <53eed7eb-e563-2ec0-262d-a96f092d683a@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0d3385f-8b00-48a8-d3c0-08da31f64016
x-ms-traffictypediagnostic: CO2PR03MB2181:EE_
x-microsoft-antispam-prvs:
 <CO2PR03MB21815C9B0C2B3BCB5C359187BAC69@CO2PR03MB2181.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 674gfXqEJrJM2xXidn1DU0pB1FRNPKNj5cbDEeGBA4e2NKKYV8Tra4wiqLOp6WIbuYp801lgIg7BUa8n5kaZJaQmv1/0nsYky/e2YsT3SyKcBgBa9R9pqCrTVsMY6V5wyi/Zu2Vu+7KLm+G1nvHsNdqprpsAgBqCeYrxnz1d13K7s/UtHxEPQU1sO7oWrB9u4aFhIy+L8WTiIaudiYBMpjMTZ2PhdFoI4DeYiWHSNi69XyxxHyXH1s3ac6XlQTZJVC5roPESDmh0dQKETkHHKQF99KXtJde1La8m15z2UvQmhtltcVcPPW3em2OVu/pyDECKvqyH7A1g9fKUyTudNA+btARwY+DJoa/mCKKfsTsmyZyvltd9X/NcxTN1fynaYricJDJ0uF/zFDQdtRHTXTYHiFlvCU6ZF+8z/BSkc31QcsytI2KycSeYK9nusC1feloU8omkKPEpmDwLO/b/XJTfkdeGHT2FlFcV7n+3pXkT9bQtSAz3HR7JtHVcXUjCkRJ1++atQeMzTbZ8+aQC/DIJZkzR95Ph9JK1E6LIzdyTMoJq83gc31AW+ecE9SiQZtRTyfOC19lxxnuuvitw/d+VhfuKAXkP7cTBWQTCYAKa/gauPbIwQj9Ira0Slv3eao+1zKlRTfSAHFxFMYrU+h581G0IHwgzrgXxWjd/pDbX2/qiqu4h6gwZ0wwb6VYsc5+MLfiBGz34evv9OoxbEWdRJ08NEcK5ZBXZwgR4DdUYcUHNNGJvcn3YmKYaBpendEJsCDAMmc9+VjHojzR2ug==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(31696002)(91956017)(71200400001)(26005)(53546011)(83380400001)(66476007)(8676002)(66446008)(76116006)(66556008)(66946007)(64756008)(8936002)(508600001)(186003)(38070700005)(6506007)(5660300002)(4744005)(2616005)(2906002)(6512007)(4326008)(54906003)(82960400001)(6486002)(122000001)(316002)(110136005)(36756003)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHMrcFJmYWdhMW80OFU1QlprRUt1VjVXWTdzM3l3V2kvYm45Zi9rcGcwVFIw?=
 =?utf-8?B?dUFjQWc5Z25UZWI2WFJLRmorcGdqN2dCMmFnbkFMSDlDTThQT3gyeWNuVEJm?=
 =?utf-8?B?bU1Qeld6bnR1eGZkbU9XM2NMOVhhVGdzMkVYMEJnQ1BPL2VDK0RZMEJNSUdB?=
 =?utf-8?B?NkZaS0lBTFVPQjRvemhjWSt6Zzh3c3kyVzVsV0RNak5HcVlkQW1jNW15SGlO?=
 =?utf-8?B?dUFtWXJTOVBNQUhDUm81OHFSbGF2Sm4xYnBSYnQwd2ROeEFsNUFWcjRXaFg2?=
 =?utf-8?B?QWR0bVE1YnRLYUExV3J4dnNOQjdmUjVhZXN5dkRmZHBCVGUyR1I0cmgzTTJ3?=
 =?utf-8?B?R0hTNExUdzJJR2JrVW9uZ3piNE9IMnkyUzlodGJSSkRrbDFzZ2FOck82U2N4?=
 =?utf-8?B?SWxZWlM5UWNLL1R1Vnl6aGtKM3VXaHV2NGYzUE9MSFlKaUtsMHg0UEVEQjNi?=
 =?utf-8?B?cTVqcTZvN3Frb2I0N2VQZEZKS3FJcC9IUTRLRG1nS1R0ZEdlWFkzQmZCOGpa?=
 =?utf-8?B?TW1oeTdGTkZKUWZ4OGFHSGpyQUVwWDVqRHRzZ1lkaGlyNXBNNGNyT2MvbWFx?=
 =?utf-8?B?djV6WjRDaG83V01iL2RXUmJEZCs2TXZQQk44VkV4c2FMZFRrR2JhTzg5c3lp?=
 =?utf-8?B?SUFxTVZwcUZmQ0RpTGlLc1VQcnRUMHhoWGxjcFZYRHU0ejBacFJWRE5YczZr?=
 =?utf-8?B?SlltaElUVzhTQ2JaTXFRY1ZEOXYydzFnLzQ4ekZrOFpKL3YvU09tM3dPczZN?=
 =?utf-8?B?TVVFenJHdjg4dTU4d2NyTC92TEh6ZlNKNXptTW5SMzhvZDhCaldMTU5qNnk4?=
 =?utf-8?B?QS9pQUsrNGRVV1g4NWdxNjBlZEFJOU1zdGt1WUtZSnNmMCs5YjIraXNiNzNr?=
 =?utf-8?B?ZGh3NGN6cWFRdVNhSU94dkhRZThST2oxamltVmM3TE1uUmhZZUhXdHBUUmVt?=
 =?utf-8?B?cXhzOVRPd2F6b2dGVHZRQ1dlOTVlUS9pUHk1TFBnbnJrSGJrd0NMZk8rd09T?=
 =?utf-8?B?aWVKbkNYNEdRS2dleC9ibXRYUnBkL3NjT0dZUEU4Z3ZjVjJpSUp3aW1BWjRG?=
 =?utf-8?B?UEFacWRhQ2JhVlQyYUNQTkIrSFdVU2Nqby8vZlFFakdaY0JFQ3l2RE1aK0N6?=
 =?utf-8?B?ai9MREoya2VrR0hTbUtTcE80N0o1cmpIOWREVFZxNzVIdkM3M0NHZ1ZjUWlE?=
 =?utf-8?B?YzJXWS9uM0FhUGlKWUR6eFRwcU9kY2hjMzhBT2wzZkw0U0ErZU8reTMxQ2tq?=
 =?utf-8?B?cmU1L2ZpN25IbHZnbzJHM2lhWDhzeWJRbnhtYWxTYWZRa3VwQW1LQTFVOUVy?=
 =?utf-8?B?R1p4UEx6RWljOTlxeE13TGFwcXJkV2V6V1NiekJQNlZFNm5sWE9TL3BrWm1V?=
 =?utf-8?B?WGFkMnVQRlMxSGkwWjg4RStqbENyeStTZmdNNUNtT3ROb001aGJ3UUtXK1dF?=
 =?utf-8?B?bmdwYjlZZFVoVEc4VTYyemZvcWpNQkFvL0JUdWdaeExvRXJqalpJUHVBWjM3?=
 =?utf-8?B?dXBXVUpWaUJiTlZER0grRXp4MWlZWXVib1p4R3Z0QTBISlIyQW8vYllNVkVD?=
 =?utf-8?B?dUt4Y3llVDhnRUJsdGlnUGsvc3QrTGhrcTRXNFJwTGg0ak1rUXJuUmtYbGVz?=
 =?utf-8?B?dVo3T3l4WkVXdDc0b2RJUkJmMXVxWDhXUHJyK2FQZnkxYUJEN1l1dzhnaFVY?=
 =?utf-8?B?Y0liNTZrYlRJN0R0Y1hjZCtOVXVHZUc5V1loWEM4M2ovMkYzQ1p5citIS0d6?=
 =?utf-8?B?b25WdEUzdXhBL1dYM0VIMTNYeWc0NE5kOUpnSEZxbzJ4WlRLVmJlRlpFOGlS?=
 =?utf-8?B?cjJpVUNZUXRuU3JHVWpHSEFVZ1I0RjhyeThBWUFKU29WZGlxazRlWnI2Y21G?=
 =?utf-8?B?QWpFQmZzbEp6QktSUkNOTWRiY0Zla055dks2TG5FcEVTdWRuaXJrOWkyU1lW?=
 =?utf-8?B?dmV5QUk1bVZnT2Zkd2duRUZqN1FUTEUyN3N0SktWSlBiK3VDMVFhOWswOHhl?=
 =?utf-8?B?bnVYZWxHT0htVGU1T2JLNGpTVmdvTnliaE9oa0p5NkRGOGRYWThIcStnT2hS?=
 =?utf-8?B?SmtDNEg4VzFxbXBlaFozN3pEbGZtdVl3ck9OTjRBWEY0eXNIQkc3L05tbXB6?=
 =?utf-8?B?MDYyL3hGNmNFRlQzOWlaTjY5NjhCaHY1N0x2VFhJdGNJSVVSUnJOL1duTU1j?=
 =?utf-8?B?T0o2RUZwanhINitpYXBsbkdmeTFvVTg1eW9tSWZoaUlFVVhjdHVWLzBQUXFk?=
 =?utf-8?B?WDMzeUVubmVBQ1VzZkhnUkVPcVB0b0MxK2s1ZDRrc3lITGs1UmtmQUFiM0F3?=
 =?utf-8?B?RGk2cmM1TlVnRXpvZWI4Y2JEajJ4ZkJWeXFRWkxrZDRjWFBvMGRBVGhFUThz?=
 =?utf-8?Q?VuUfOGXtAyUw48I0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE19187B55055499E0D2B9E002BD863@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d3385f-8b00-48a8-d3c0-08da31f64016
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 19:58:13.2831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3TNolkQxmt0qCySbOp4Dhr1P8aRdMaN6pF+YjeSpwKwKv8jcEkSSuMS42RoTB0cSiRT8Jv+FD6YpqwnJ4xIdD5r8uPWlaqj7RyIMMM5sPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2181

T24gMDkvMDUvMjAyMiAyMDoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDkvMDUvMjAy
MiAyMDowMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gTW9uLCA5IE1heSAyMDIy
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIElSQyB0aGUgcXVlc3Rpb24gY2FtZSB1cCB3
aGV0aGVyIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGhhdmUgYQ0KPj4+IHNwZWNpYWwgbWFya2Vy
IGZvciBMaW51eCBwYXRjaGVzIG9uIHRoZSB4ZW4tZGV2ZWwgTUwuDQo+Pj4NCj4+PiBJIHN1Z2dl
c3RlZCB0byB1c2UgeGVuLWRldmVsK2xpbnV4QGxpc3RzLnhlbnByb2pleHQub3JnIGZvciB0aG9z
ZQ0KPj4+IHBhdGNoZXMuIFdpdGggYSBwYXRjaCBmb3IgdGhlIGtlcm5lbCdzIE1BSU5UQUlORVJT
IGZpbGUgdGhpcyB3b3VsZA0KPj4+IGJlIHF1aXRlIGVhc3kgdG8gYWNoaWV2ZS4NCj4+Pg0KPj4+
IEFueSB0aG91Z2h0cz8NCj4+IEZpbmUgYnkgbWUsIGFzIGxvbmcgYXMgeGVuLWRldmVsK2xpbnV4
QGxpc3RzLnhlbnByb2pleHQub3JnIHdvcmtzIDotKQ0KPiBXZWxsLCB0aGF0IG9uZSBkb2Vzbid0
Li4uDQo+DQo+IExldHMgdHJ5ICh0YWtlIDIpLg0KDQpOb3BlLg0KDQpUaGUgZm9sbG93aW5nIG1l
c3NhZ2UgdG8gPHhlbi1kZXZlbCtsaW51eEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gd2FzDQp1bmRl
bGl2ZXJhYmxlLg0KVGhlIHJlYXNvbiBmb3IgdGhlIHByb2JsZW06DQo1LjEuMCAtIFVua25vd24g
YWRkcmVzcyBlcnJvciA1NTAtJzQuNy4xIFVucm91dGVhYmxlIGFkZHJlc3MnDQoNCldlJ2xsIG5l
ZWQgdG8gZG8gc29tZSByZWNvbmZpZ3VyYXRpb24gZmlyc3QuDQoNCn5BbmRyZXcNCg==

