Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F287B561A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611610.951135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaX-00011m-9N; Mon, 02 Oct 2023 15:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611610.951135; Mon, 02 Oct 2023 15:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKaX-0000z2-56; Mon, 02 Oct 2023 15:12:01 +0000
Received: by outflank-mailman (input) for mailman id 611610;
 Mon, 02 Oct 2023 15:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKaV-0000iK-Oo
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:11:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08208163-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:11:59 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:11:57 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:11:55 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:11:55 +0000
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
X-Inumbo-ID: 08208163-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/cORn2PaiHqMpwBU7PffBoZFBHMZRIJY7zh8CAxkC2o=;
  b=Po2UMz+bFpp6MJv/09Lu/+B6waBsNspEeVTHnZCDz+OGCvoP9TSE9WEK
   Hh42oP5ThC6ECSgDv58PAUeAtCEOckpjhUkGo1+eSMPTHFVGD+GvHP6bw
   xaQWncqQ5vaPtuSgqtMNkPdZBhZ8bfpUncMThd8lXReYDb7yrvdoVdUp3
   w=;
X-CSE-ConnectionGUID: Y7rpxt7YSRS3iVDgHE1zQg==
X-CSE-MsgGUID: V+5MSSPsSUKH6HupM4hYyg==
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 123653196
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8TnVnaiAEbhhYJevwu59SV1rX161UhEKZh0ujC45NGQN5FlHY01je
 htvX26BOa2JYDTyf49xa4vko0kFuMfVztVgTAtr/Cs3QyMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sS5AeEzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQpdyoVfgzcttmM++m6dMVjpul6PvDkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyabI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhA9xPT+TpqJaGhnWthTE2MyYuTmCGgtnnqlOmfo5fG
 l0br39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtMIwXy1sy
 VaPkPvgHzkpu7qQIVqf/LqJqTK5OQAOMHQPIyQDSGMt/N3LsIw1yBXVQb5e/LWdi9T0HXT8x
 m6MpS1n3rEL15dUjuO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:lnW5YqlK8d23J/uohQM/nNdh27fpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-Talos-CUID: =?us-ascii?q?9a23=3Ar400OmlTKfEhrQy+dfoOH7jmSYjXOUyC1m/APxC?=
 =?us-ascii?q?JMlxSE7yrZVCw1fp2qsU7zg=3D=3D?=
X-Talos-MUID: 9a23:wUkaqAowi39wHDPz3A4ezw8haeJT2Jy1M30uscsmptGhaSxBKjjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123653196"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX0LlBbrKw93fSZJ3C3CRrVKFzifI13yNHHqojUJlW8Zx3AfkzEKJE4R4/zMlx2h9UTIgx26n34S5DYyRajc5ubIEU8dMf9z6sOcChweydj8MBtq7Sy0NwmDreaATBiYdbOWwzm5BKuBw4lS6I3sBFA5elY/OIyn2b1Khxqs7QR0IG1tPAV/EkpkjHvVNuhZ+t9Rjw0BloQrjj/+oKbpvaaMdalrKcaM7O1qJSr1TYKhlhNTLEUMsj85P3d0Im8ek/zBD7ZY1XoR/j+k6dXLShySg1hVA/cd8yGB1To6RUUlhGICJVI+WbTLTgDZ4WUPUfGazHIm+gLse1qHVil/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01vEMBP+AIsrC5NQCk+WSSYp1tHvGShg3O7HS4rvvmM=;
 b=ZdBgjig6tiAgD3a86CEFS52LshXs2fivotR/NV+NNC8UbW0FcaLtqwvDwQjzYWvu85PeoHyqvcfIl0xokJLGckGQPD5YgbfG/t9lghxndm3U9Aj2lodGJcGvrcQxNBkY/Zs/c3914+qxG5lUXyHhYSJTnjLi3dS8w5E5pJs3PhrDYR8FFWR10FLt2/2vghEmt/J1AscWiuF3ZjqKVXk7f9g0tlguidAtkyVcEAiJiWVFHZh6JEMp1Vd5ofvBr7yG9CM2u5ZjcnxkLbK9dyxdrZlHBk6u/1EwgjZusQmFsPTYpqiR3U23GK6oZfg7lMrw3Sl6n/d/lBp8p2/Atg48MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01vEMBP+AIsrC5NQCk+WSSYp1tHvGShg3O7HS4rvvmM=;
 b=SjkaX7Lj8UR5uoGKn1Qm4nAkZZT2zPMpsHUkqkOh20jfNXOtIrj8uvi7zqYL/10WQlx8lbfwQQA5lvz/Q0B9fTm1f+alHuiz9EDTdxpvCUDe2PeKVjZT9zvZ20JywfsRhjKWo1wBIxq+krOAkxL1MGWmHYwCuwXDwUutUq0ahTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 02/10] x86/shim: zap runstate and time area handles during shutdown
Date: Mon,  2 Oct 2023 17:11:19 +0200
Message-ID: <20231002151127.71020-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7eafb3-d170-4dcb-f46b-08dbc359ea7b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xLtdMGHdWUeCyT+p3z0DXHKBwkadepLJhvWXg6GJNiI9yjxhqiVJuY4gB4fH/Kxxd4792vMAnISW7ZkAWZzTk5HuCPc3SnotQNouudVU1DZNSUkDxZhTJdubY6AYjR1IBCEUNTbUtq5T4g8Ggiwj3lxoYCbyrhlAeHKHkolDustJ0j1NYhl8Z7p3EYpWm+b8yaj2RSrvISY61Rfpd2dIAamX/vJYdwoDA4BNZZEeOTN4+BaqyEBZXxw2hAC9A8n/0iaxau7ONDJjUSjoYKy9YpkypsM/WFBW6W4rD9b0IxM84gt/86vv57OcZWqCpYnnwm+dKrpWQWIOeZLiRhBsw5O5pokWO5iQwbzqc9fXc8OPSELNIybrLFJTs+DbyJejMDbi2sFi2M4Df+PoGGA1UdOsB0KreWvRRdxZ03RsFmxg6fXrakLmcoDCgBD1gfqya/LEjaCx97FK8UdbVmnNoLRIxYoO2I4KXAvZF+jRzIEzOCPr/1basJWZoXx4dxM6c/xsx/4mcI5LrV61m0PJFXlYD33RlgQZ6Ku9X9onRwrTFqFS2jqnFrtRFs8/2EaB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4744005)(4326008)(8676002)(5660300002)(8936002)(6512007)(478600001)(6666004)(6486002)(2906002)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2hBTUhVNkFSeGhOcTExa1VmbHlVT0JkUnRKVHNROCtjUnhjbW5wTjlzdHdO?=
 =?utf-8?B?MkRPN1BVbDQwRG1QSmwzVWpwYWVmeVlHcStzblJhNlBkenUxdW0rV0pJNXEx?=
 =?utf-8?B?MnMzekF6dXpVVVJDd1NpMDBNNEJqRmRJbDkrbVdvaERKUGMyRU1RbG84VUhj?=
 =?utf-8?B?QlNxWVlFbC9LcGtVdEx1b2RrNVAxbFViNjlqWDhGb3dvNDZaQTVzZU50V2xp?=
 =?utf-8?B?dzRtR052RlpjUWVLRVJobzJlOUdDRUQ1b0I1MkNXN2VabjF5UUpPN3hHK3g0?=
 =?utf-8?B?cVNKaFZsWkU2ZHloOVowVlZhK1U2S3ROMjhYSWJiYUc0REpwczNNVlNkbnJL?=
 =?utf-8?B?cWNnMDRqL054bGJ0UFFIRE01eDRUb1NwUnpPbG40YzVYdUNHbGVXS3VMdzdG?=
 =?utf-8?B?djhJZ25HWEdhMFlGOUdHMTJIU0V4SnZzS2pVcmJDMC8wZkRlT0xKTFBUQ2xO?=
 =?utf-8?B?ck5vRXA1RTQwOG5pN3BzZEs2dDNrc1hXUWtqNnF2MlhwOUdPc1NpTEVHU3ov?=
 =?utf-8?B?K0JkcVMrK0NPQkt2aGFncjZjbThMT2Z4c3lzcWphWmJQYjdQMm9qRnNNbGV3?=
 =?utf-8?B?T2J6VWJsWU9HWm5lMmVEQ2VyU3pJZ2hTS2g1b3ZjK3MvRk5XVEh0Q29oN0h6?=
 =?utf-8?B?VWNFWE5ISkRFQW1hWUNLQnhRc0dOUG8wYzNqWUowUXpxVWQzc1RLenlmeXFC?=
 =?utf-8?B?THJjWEJjSGRJd0hUSlBnNTFkY2pCVVVvWTFyaG1KT3BDYmNBUHB0UllkT3RR?=
 =?utf-8?B?SmRGOURnS3U2YU8vUGN5YnJSRGlRbmVBN09QSzhoVEdaSXdtZUk2aWR0a1FS?=
 =?utf-8?B?dGJrd3pic1NFcWwxT1JranJCOGk5ajVmcmNHZFdhRGpJN3NLNGU2bWNYMCtN?=
 =?utf-8?B?eWlzVW90dUZ1dTZRQmhXT0h5ck1jckVCWkFZakF3RkRIWmtyd1lsdUNrTWsx?=
 =?utf-8?B?ZXBEVmhzUUw5UTBmK0p2VndtaiswRGlmZHZTWnZEbzF6N2FvSEZneWVuZElR?=
 =?utf-8?B?TDFJUlA0ZXRza05lL2E1VjdJRGNZeGJlclk1aCtUenJaSXdLZVV5cEFNTU5I?=
 =?utf-8?B?WWtmT2srZStkeVFWK0JCcjQwSVpML0RSdUZhWHFBVmRQWExDdXcrbXU4c0ht?=
 =?utf-8?B?Qm0vam1MQXFnUFUyUWZTNzgzMDNvRkhWL3lJVGR6WlQvUUp2VHF1L055dzNW?=
 =?utf-8?B?UXVMMndhZGM2cncxc0hiZUxXRXlXWGFXamcwdEJEaHVNYjdnQWNtS21ETFRp?=
 =?utf-8?B?bUhMWE52MUZmenVwSDBzQlRYZVArQVpoVDJ6bE1ObWh2VnRkYU82VTZsWUU4?=
 =?utf-8?B?M2kvOTFMTTliZFZiQytoWGh0UE9CZWRnWjdWN3ZvWnlTZGhBUGx0bWVjR1Y5?=
 =?utf-8?B?SFVMMkNJd3N3S3drdEhTcUp1SmJ4T1hCQ3NEdFZibG9oZ3UwNjJHcTNMcDE3?=
 =?utf-8?B?Q2FpeW1TenBlcDMxYy8zc1oxRjgyUXlsMmxPdWNubXY3SUxLQVZmUWVHanBI?=
 =?utf-8?B?TEhud01RYy9LelBxckV6cUt5QmRld2E3N2kzbncxL2JsVFZOZGs1eHptQmdj?=
 =?utf-8?B?MjJoUE1WWXloRTFaWllpZTlOZTd3TWZwM3BOQzE1d3JhUWIzMTBFcGkvYXdE?=
 =?utf-8?B?L0ZLUmNmQ1hqMVRjdU0vK0V6WVAyUUZvdk01cWx3N2dNRG82Skd3S1dtWnlz?=
 =?utf-8?B?WmJEUTBFYW5zZHovZVNkUjdmRUJSVEhWVUllTXpjdnNjK2JoanRIeGI4bmRC?=
 =?utf-8?B?R1k2OW8zb1FGdmVIdGxleFJGOHVwdUMrandSN3ljYmFlU3RheXlpWVRKZHRj?=
 =?utf-8?B?M3NFT0duZ2l5LzdicWlTK3pmc2cvalZsdXU3cXpqSUZNWU5lcmw0TEpCNFRt?=
 =?utf-8?B?bXF3Wk81TXU5cnpnNXNhQlZnVUxvQmVOalhwZUN1VHdKK0hZYVhFOVoxd1g4?=
 =?utf-8?B?N05xV2dQOWNJZW1CTnc0QVVtL0ZqcWdNQVhwbnJYU253YURoMFU2T0RoRkpZ?=
 =?utf-8?B?SmtXSGYzM2pkVjhEOFRVU2Z1a0lWY3lsaHliUDc0MG1VVktLNXlQeEpZOE05?=
 =?utf-8?B?SkRqSkNWdUtqVEx6TlVmWUlqSVNobmk3cHc5K0hmR2NVYjV2R2lhelF6K0ZD?=
 =?utf-8?B?K21UemRMM2JPcXZ6a0wwalRWaVF3RGtwajN3UzJ5QzdwTUtzWmJzM0dMUVo5?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gP3EMIjsKZEbd9fhkRVMQpxrEoM2SqXTPwU8ay866Mw5nUYsQriFQ+YuIkEuqreA7TutFfdwTKBTYBWJsK2vozfN0dMv8QlrQPVeWYQHCVVlU/oJJPcFLQGE1V3xA16ZnrincGiJhV6EiJgTZ3tGIAkvS00ZE+mCrpo9WfVKq/Kz2o7MAPvL8eaN3brAClDELV/DrNTeqv+xU5geEZbZiZiEJq3O1BYVQHsGDyQrMycsnAl+QJHOhc+2nPdZbhTFBVjfhAmeqq2kuGtPKGgTs6y6GzKBiTroeZ+8mypu+70hLa63dr/eLI1H9cYS90LKCaCuLdujCa+UWizXz/Sz/bJgnMRlsAcP+TobU2/b9SDKzUKifU+4iSyzn0uj5yhffAs++P2+3wKDceLnoo2Mao6pFrE5/nL28PBJCbayAaGq+9xqkXlaAuTUvCxhUm2nYZSxwCXXU8Ta91dXEyGzRSkRwvMNCge9r82Q1HVxhdBuVPMsOHD2vbWWe5GMm7d4Ej64NLx9bLdci222+VjSHGtF7eaJNN3BHJlh3hxFBaxH27OvD/AVuWHbTYsmOLMQqD6k4eXZevT2rt6zLMA564j6M3HeCJojZU0GJCy/6ry2k4Ochn9eU07FHe3D+psh54y1YjOfqpi5JVONvzfh8nQtbTnkNQv/9cFIS+tpxCYJLWqdRAQujBJHmUdgF8dz0d5dW4/GgEcLqTtmR9EsKefzJRH79v5IvpZ9jhctMEpJMWag4gFWItSqi5B7I/JIk2+D79hwMYpwq/87Fv3zFG43NrwQHBfdKWlVo24oGuT2yWjZ1uAoIA+YCRYdXmKSP9nrNnJwWbChVgXI9/TcFQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7eafb3-d170-4dcb-f46b-08dbc359ea7b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:11:55.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0/yRhcGJdUJILt00Z9c3U1sOrPuZKQeW1vGRb5DpHZUgM0DZRuIuJlf4Du0jwX8rdI4XaBgphb35/Xnjps9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

From: Jan Beulich <jbeulich@suse.com>

While likely the guest would just re-register the same areas after
a possible resume, let's not take this for granted and avoid the risk of
otherwise corrupting guest memory.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/shim.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index ca0e639db323..7e4bacf7ae40 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -385,6 +385,10 @@ int pv_shim_shutdown(uint8_t reason)
         /* Unmap guest vcpu_info pages. */
         unmap_vcpu_info(v);
 
+        /* Zap runstate and time area handles. */
+        set_xen_guest_handle(runstate_guest(v), NULL);
+        set_xen_guest_handle(v->arch.time_info_guest, NULL);
+
         /* Reset the periodic timer to the default value. */
         vcpu_set_periodic_timer(v, MILLISECS(10));
         /* Stop the singleshot timer. */
-- 
2.42.0


