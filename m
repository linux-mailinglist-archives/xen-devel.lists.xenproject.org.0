Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C1562B46
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 08:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358891.588298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79rc-0000eM-AI; Fri, 01 Jul 2022 06:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358891.588298; Fri, 01 Jul 2022 06:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79rc-0000by-6p; Fri, 01 Jul 2022 06:10:48 +0000
Received: by outflank-mailman (input) for mailman id 358891;
 Fri, 01 Jul 2022 06:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pwB7=XG=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o79ra-0000bs-Rn
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 06:10:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2d494e-f904-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 08:10:45 +0200 (CEST)
Received: from DB6PR07CA0175.eurprd07.prod.outlook.com (2603:10a6:6:43::29) by
 VI1PR0801MB1853.eurprd08.prod.outlook.com (2603:10a6:800:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 1 Jul
 2022 06:10:27 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::8f) by DB6PR07CA0175.outlook.office365.com
 (2603:10a6:6:43::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.8 via Frontend
 Transport; Fri, 1 Jul 2022 06:10:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 06:10:27 +0000
Received: ("Tessian outbound ef501234d194:v121");
 Fri, 01 Jul 2022 06:10:27 +0000
Received: from f132fe31f93a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 684EE8A4-EC2D-4B3E-83CA-979C14EEE28B.1; 
 Fri, 01 Jul 2022 06:10:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f132fe31f93a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 06:10:17 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3349.eurprd08.prod.outlook.com (2603:10a6:209:4a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 06:10:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%7]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 06:10:14 +0000
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
X-Inumbo-ID: 8b2d494e-f904-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TK7O2mobrj+ieHVxT/M7fb3k+6uAFzqqPDdK6sfsdmH4RClpZWC8qBRxt3ZDr14iGV5x1WVWU3JhMcHQf0QTqIz824hmzRAoCn+wWjvfswHtoy2RUvbH+dBKb/kmbU7Fl7lUjRpWq+oeOWsaJLqsov1civ0URJfXb72Z0Juz/MjkNbfET8N2uLfM7gIs5JH+Kqdv+VgQNqA0azCTeRVMl5F934hodIgqqvWNuiUyITBuahfptQjN84msip6LdhSCnx6wZ8Q2SjjgR4i76VbxvofXuKU4ZgDMX5zJz+c7Uh9eaY0iAj271rq5J16p1Roxr5fRxrbEUm7Shl4d+FvoLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5nRAd7+++XQ0MMPf4+/0cM+3o9eeyLo7pDIFjAhY6A=;
 b=HRmFOi3cCMMBYZltu2D3NsRUSFgKlTSLoLbYwHyF6X56GQ1VXMHd0zyBuJYYztkw7wCi+XIwI5yUEc4T5x39zKhSPijjFwvfdJVwiajrhXmjl4rhEE9jC/zVUliVXJQPltPlUl4jg6JiHM8V8CAB3LpgydnGJfE7EP3q/lanGsuzg50AFF0EVdYuUnMmWZRr5E/uFi5kTAv0Wi4gYroE7ANXLVj1e/O3glD4mtgoqJA/lPfIONv5cDM9Y+flVDITcBEvP/HWSBHkvgi61mqyQGgAaGxvly5+LUCBs4N1NPE7Wvrt/ctH/Orwa7QqbEIqWDAQKSmukbTQjzNBvWH0CA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nRAd7+++XQ0MMPf4+/0cM+3o9eeyLo7pDIFjAhY6A=;
 b=hh8jHLVx3RsQDNSxXvpY4GlDSZhbBc7ioL25kG0f2y2v3lPo/JGjYK1WSKZDjJoUeZu7y6qddL6gUN2SiYs+TgoP8g8UGPpImwbJ0Prg1qv+ksEotZtuRM9teL2r0Dy8On75BUs40qbF4PurWcxw1ESDviyg3eFtjBFJ6MSukHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwfj4c6s8VtM6FE4pHb70lLsSQhMcLz/olgbW+utqtMFbyZ1qLHXlwEZU2YIcEkbqbcPEuffdYqiRtluKmGqdExqW4WlKZhg+irb7XJBJOUp3wP3ok4nd7dzXgJb1lZexhC2kjH7QrFbBekz/C2bqeM9ZBR6Jw5OM0oqsIO0Pre/kqnFUTqYtQvfIm0YllTmVORoNiKHUIsKRpqLMbqRkmEnb60vRXEN6KmPKJsi1hS8URSI9biazgEc4xubWRxCrYzT8w74pGUYX7egrOaOJdnulWaKeKr7xt4r27eIGzjhy9ZE7Rq3uqkjoz0LIcWpWvAfvL1D0LNhV8bg0o5+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5nRAd7+++XQ0MMPf4+/0cM+3o9eeyLo7pDIFjAhY6A=;
 b=j4BKZ/vMQ55dlgx6/wa9dkhdx7g/Cv/jGyhumfuTfzyrHb0minwb8hX2Tvh64Ug7qGCJQ7l4swNgJSpAY8j8Gg02bo38eENMxew+Uq7nMqQ7rHTZPl9ujieV32Ekuj+Maq6hg/GfNTaiIOWkVmXevoF5vRcL3W2bNxf8xipwX1g/clL7udY9cd4PSRckSffOqD+UJ5SV3parCXUOBkZTlwY6EIadHez8Us3VVVG0HL//NjoZKCGfvAvl0/DzJ07+BBXVNMVZO97qj7gk+xIMPMdQoY9jFuTIOZ9Omh3+mcc86xwYG/1ARh1PBLM661DOGd/gmPs6iUdY5sIDWH9x5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5nRAd7+++XQ0MMPf4+/0cM+3o9eeyLo7pDIFjAhY6A=;
 b=hh8jHLVx3RsQDNSxXvpY4GlDSZhbBc7ioL25kG0f2y2v3lPo/JGjYK1WSKZDjJoUeZu7y6qddL6gUN2SiYs+TgoP8g8UGPpImwbJ0Prg1qv+ksEotZtuRM9teL2r0Dy8On75BUs40qbF4PurWcxw1ESDviyg3eFtjBFJ6MSukHk=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index:
 AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjCAABXrgIAAECwAgAAEoICAAARlgIAAAO0AgAmAA0CAABcRAIAA6+aAgAA2KgCAAALn8A==
Date: Fri, 1 Jul 2022 06:10:14 +0000
Message-ID:
 <PAXPR08MB74208E40EEE93B3EDA2DFF609EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
 <PAXPR08MB7420F8745E83D013AAF566689EBD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <13142c32-f67f-751d-4783-87e8afa1117a@suse.com>
In-Reply-To: <13142c32-f67f-751d-4783-87e8afa1117a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 50E2AD9797221E42934FECF8D7C9DD4C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9a92542d-bc68-4b67-8217-08da5b2864d6
x-ms-traffictypediagnostic:
	AM6PR08MB3349:EE_|DBAEUR03FT019:EE_|VI1PR0801MB1853:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w75vq520h7vN6lDBTlTO++kWHwMaFznb9sFLUql4IpE+e4V2RfGs/lx2LTViSAcBgnp9wP074H6vwQ/cWDaf/3/mwPno/aN7Os9/27WXKo0VvWoyAw6FA+khIAwBsJsB68G/wsQOuJs21fopm4chilYj76N1GqaCpqmkeJd3LLv2rFcrOGgnldcaJgGP3rnIBX1KyMgrCIdkdidF9I804+mMPu6xrK7YJ/UYjwpTuf5xulCiuVwoLrY0TjsJa6qgs3o93Hy+L+KNwOuorAPwC/9pRkwbI9NoxhaLtxfk5nD8jzC/9LOftCVdQzl1ntlRaifqn3cTrG7KUTpwRWV2tcBaXAbyTJ9+cqj6mYhhRD1Ufp67gyAZE2Pj5s+4pnGQ28X91PFCQvlMUXei3Q/ALqjZgPzQ4sQqlw3HfCxOi2MoQFOmtxrTX42/iVYDAxJUp1XSgzvuqXFAUumr08mT1erZk55fM5ZD0m03iNtX1fKZJcfzJ6g4Fc7mbghdJEOwto8t3cw5seOq/UdPs/Amq6dApbu2+bMskLACCfqTsUH607aAgKEXl6e90aBUeb+vft7m1nzWupgcAwlaWttQA2W62c681SmF85jodpZzUANPsgFKLM2HZAjLffG2FQ1VK0M/HzsoYP9l0mTzL3EErZoWgLheqs+LiE3edHZ6rrXga+9NyOYovCwr0Hk9xs2ZfxE862VJt3kM/eAm9TyfFVsmwl6ABmnS257WRToFdX6ppgzQ8I+VrWgCB+ZPctEUeEM4SbSZc5lLqkV9XR0sIUWs1H1pqcV8UfW1Aiv+xuc03MQwnqIOKeDCyeo28Pee
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(8676002)(71200400001)(4326008)(26005)(9686003)(66946007)(64756008)(66476007)(33656002)(53546011)(41300700001)(86362001)(6506007)(66556008)(66446008)(478600001)(122000001)(55016003)(38070700005)(7696005)(38100700002)(83380400001)(186003)(316002)(5660300002)(6916009)(54906003)(8936002)(52536014)(2906002)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7a39b0e-52d6-4f88-802c-08da5b285d2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GxbPVN1emK13EB4UgCgomyUP+Qm9bmAGhqBzOUFOSxqAPN1ATdqzJATr5bHNtdfNPz2tZZGOWwmbitn+v4T3l7fVS6898CmrbisHRZomfWgGha/eSgwxrcsjlZI14wsBUzNxrBMRZQhYtxLLmc11U/SJnzVqRmoJblh2jmppwtRCQpp0/7O6vD5lTSb8QRytpH/DFoxJp2abnRuiqyDaXS58+vcyMsCqPoMgyylTAmXjRf2p4J8vdEtQ7PvP7+JB/CvoNnBppBKKgDbOIKs6kO3TrxHmBS4gamwnQYNxuh+oVo7lIsYVifoYTJ56noqG4gT56OEqxBvmq++tLzXa5J/CKrTBKeT914o50d66Yq933s86VQWfYOYxGE0Vg0pODWHuICzKC3TDEPS0m6qdkOtFVUaREQHLeuc7qTzc1z8t9sY7meCJQ4BYwLTUe2U31+U2XtRX+Gv5naIZ9q8QrWc1U67rGJUUXz08BpzlrlYVJCAQOAA554jzL99GJ0G2Mb6cvOCFgOIQAW8OCJ/oDoKPFwip6u4i9Es6Z+nyf2HGjeFFCKX45kfleD28PeCZE6EjHpIJDZo3FpJ5/9jI5MXFRRxiM/efz+5ArDBMU/m/5ea+7nggLsxpRP31Q9BkI6C6zsQKrm97iuuuSaHE5P8jYLU1nPsZS5ChLy1RaYRSwAOOQzhi9IOIRzMy34JL+apXhY9oJpZb3bwaX0KrfPsSId1gIF+/eFsEPFnbT0SxSHhl+HLVdOPKplkDr9G773xjuJofz3M5fuHIOPfDRXPft6+ZY0bCL2pOuhrhd9ljHrgTUkvde9yqyaYxQdwm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(83380400001)(40460700003)(55016003)(186003)(5660300002)(81166007)(478600001)(40480700001)(86362001)(47076005)(2906002)(41300700001)(336012)(33656002)(6862004)(8936002)(356005)(70206006)(53546011)(82740400003)(52536014)(70586007)(54906003)(82310400005)(36860700001)(7696005)(9686003)(26005)(4326008)(6506007)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 06:10:27.4945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a92542d-bc68-4b67-8217-08da5b2864d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1853

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgx5pelIDEzOjU0DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4g
TWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4g
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEppYW1laSBYaWUNCj4gPEppYW1laS5YaWVAYXJtLmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSnVsaWVuIEdyYWxsDQo+IDxqdWxp
ZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzhdIHhlbjogcmV1c2UgeDg2
IEVGSSBzdHViIGZ1bmN0aW9ucyBmb3IgQXJtDQo+IA0KPiA+Pj4+PiB0aGlzIHdheS4NCj4gPj4+
DQo+ID4+PiBJIGhhdmUgdGFrZW4gYSBsb29rIGludG8gdGhpcyB3YXJuaW5nOg0KPiA+Pj4gVGhp
cyBpcyBiZWNhdXNlIHRoZSAiLWZzaG9ydC13Y2hhciIgZmxhZyBjYXVzZXMgR0NDIHRvIGdlbmVy
YXRlDQo+ID4+PiBjb2RlIHRoYXQgaXMgbm90IGJpbmFyeSBjb21wYXRpYmxlIHdpdGggY29kZSBn
ZW5lcmF0ZWQgd2l0aG91dA0KPiA+Pj4gdGhhdCBmbGFnLiBXaHkgdGhpcyB3YXJuaW5nIGhhc24n
dCBiZWVuIHRyaWdnZXJlZCBpbiBBcm02NCBpcw0KPiA+Pj4gYmVjYXVzZSB3ZSBkb24ndCB1c2Ug
YW55IHdjaGFyIGluIEFybTY0IGNvZGVzLg0KPiA+Pg0KPiA+PiBJIGRvbid0IHRoaW5rIHRoYXQn
cyBxdWl0ZSByaWdodCAtIHlvdSBhY3R1YWxseSBzYXkgYmVsb3cgdGhhdCB3ZQ0KPiA+PiBkbyB1
c2UgaXQgdGhlcmUgd2hlbiBpbnRlcmFjdGluZyB3aXRoIFVFRkkuIFRoZXJlJ3Mgbm8gd2Fybmlu
Zw0KPiA+PiB0aGVyZSBzb2xlbHkgYmVjYXVzZSB0aGUgaW5mb3JtYXRpb24gaXNuJ3QgZW1iZWRk
ZWQgaW4gdGhlIG9iamVjdA0KPiA+PiBmaWxlcyB0aGVyZSwgZnJvbSBhbGwgSSBjYW4gdGVsbC4N
Cj4gPj4NCj4gPg0KPiA+IE1heWJlIEkgc2hvdWxkIGRlc2NyaWJlIGl0IHRoaXMgd2F5OiBBcm02
NCBkb2VzIG5vdCB1c2Ugd2NoYXIgdHlwZQ0KPiA+IGRpcmVjdGx5IGluIGFueSBjb2RlIGZvciBw
YXJhbWV0ZXJzLCB2YXJpYWJsZXMgYW5kIHJldHVybiB2YWx1ZXMuDQo+ID4gU28gQXJtNjQgb2Jq
ZWN0IGZpbGVzIGFyZSBleGFjdGx5IHRoZSBzYW1lIHdpdGggIi1mc2hvcnQtd2NoYXIiIGFuZA0K
PiA+IHdpdGhvdXQgIi1mc2hvcnQtd2NoYXIiLg0KPiA+DQo+ID4gQWx0aG91Z2ggWGVuJ3MgRUZJ
IGNvZGUgaW50ZXJhY3RzIHdpdGggVUVGSSBmaXJtd2FyZSwgc2ltaWxhciB0byBSUEMNCj4gPiBm
dW5jdGlvbiBjYWxscywgdGhlc2UgY29kZSBhbHNvIGRvIG5vdCBleHBsaWNpdGx5IHVzZSB3Y2hh
ci4NCj4gDQo+IEhvdyBkb2VzIGl0IG5vdD8gVGhlcmUgYXJlIGFtcGxlIHN0cmluZyBsaXRlcmFs
cyBhcyB3ZWxsIGFzIGVub3VnaA0KPiB1c2VzIG9mIENIQVIxNiAodGhlIFVFRkkgImFic3RyYWN0
aW9uIiBvZiB3Y2hhcl90KS4NCj4gDQoNCkJ1dCBJIGRvbid0IHRoaW5rIENIQVIxNiB3aWxsIGJl
IGFmZmVjdGVkIGJ5IC1mc2hvcnQtd2NoYXIsIGJlY2F1c2Ugd2UNCmhhdmUgc3BlY2lmaWVkIENI
QVIxNiBhcyB1bnNpZ25lZCBzaG9ydCB0eXBlIGluIHR5cGVkZWYuDQoNCkknbGwgdHJ5IHRoZSAt
Zm5vLXNob3J0LXdjaGFyIG1ldGhvZCBmcm9tIHlvdXIgc3Vic2VxdWVudCBtYWlsLCBpZiBpdA0K
d29ya3MsIHRoYXQgd291bGQgYmUgdGhlIGxlYXN0IGltcGFjdGZ1bCB3YXkuDQoNCkNoZWVycywN
CldlaSBDaGVuDQoNCj4gSmFuDQo=

