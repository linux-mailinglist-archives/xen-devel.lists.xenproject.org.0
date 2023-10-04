Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094F7B82C8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612627.952627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3GG-0001pe-Dy; Wed, 04 Oct 2023 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612627.952627; Wed, 04 Oct 2023 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3GG-0001nw-9P; Wed, 04 Oct 2023 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 612627;
 Wed, 04 Oct 2023 14:54:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo3GE-0001l0-TB
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:54:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7ac0811-62c5-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:53:57 +0200 (CEST)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 10:53:54 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5159.namprd03.prod.outlook.com (2603:10b6:610:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 14:53:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 14:53:48 +0000
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
X-Inumbo-ID: d7ac0811-62c5-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696431237;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dzKU+XcMKHZ7cnznC+pb6F8X/rjO4TC2THQjA0Iw100=;
  b=XcqKMJyWTzezG1NJ/mJiiiZcUAoYotQn+ATyntdZ7Y+KsrA7HdgPRN3u
   O9L9+iJQxKSlCbJJ2yDK199o4amY3Y5j9qg2zL5tl+48rmXOU9mhSI1wN
   Mam5n5aezW3C+VMS0q5nuZ++ipe++mUCEf3mJtPc2VxFOO5/t23SI9eGP
   U=;
X-CSE-ConnectionGUID: 7IDWOdghQgagFab1BLjetg==
X-CSE-MsgGUID: pvEtzUtRSDq/mI3wuTwtXw==
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 125040289
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:GeXFd6kAbE6BJiKEhNXuyUzo5gwWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCGrVO6mDYDP1fIt1bIy080lT68PcnNY3QQtq/i9nHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AOGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aM5BA8qYh+Dvu2/z5yyQLBGosYuMMa+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOeF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx36jBNpIROzQGvhCmEO+2n4uFCcteUL8pNjilVOCRM5vN
 BlBksYphe1onKCxdfH/Qhm5rXisrhMaHd1KHIUS5QGAz+nE7gCxAzUcCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX/FCvs2
 TmMoG47jq8KkM8Q/6yh+BbMhDfEjqbOSgk59wDGRFWP5wlyZJOmT4Gw4F2d5vFFRK6eSlSCp
 3ECl9Kp8PEVDZqNmSqOR80ABLisof2CNVXhbUVHGpAg83Gn/SeldIUIujVmfh81bYADZCPjZ
 1LVtUVJ/phPMXC2bKhxJYWsF8AtyqumHtPgPhzJUudzjlFKXFfv1ElTiYS4hggBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:v7otF6HuZ+SozL+9pLqFSJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdtZJkh8erwXZVoMkmsqaKdhrNhY4tKPTOW51dASbsI0WKM+UyYJ8SVzJ8F6U
 4NSdkcNDS0NykBsS7ViDPIVurI6uP3t5xBb4/lvjVQpHhRGvtdBl5Ce12m+y5NNX977UtSLu
 vb2iMknUvZRZ1NVLX5OpBtZYGqmzSIruOcXfdhPW9+1OCgt0Lt1FeQKWn94v5qaUIo/V5Uyx
 mjr+WW3NTAjxh58G6A60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEcuoiUmR4Xue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgEHkvdfySFsBeoF8bMNiA1HkAngbzZ1BOZ
 Fwri2kXl1sfF39dRHGlpX1vtdR5wuJSDQZ4K4uZjdkIPcjgfdq3PMiFQVuYd499evBgu1HcN
 WGNvuskcp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wg64VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9FkN2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLEbQIwFllutEU5HHNcrW2He4OS4TeuOb0oQiPvE=
X-Talos-CUID: 9a23:gWKg0GOtZnTom+5DBwhLy2kYFcAcfXTS4n7aemWcC2t1R+jA
X-Talos-MUID: 9a23:h/c8CQS44gGmoWqQRXT0mhx+Jvp02Z+CEQcIsM4ZpvWbKRxvbmI=
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="125040289"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzzTAmg4c2uMx0YIsr2ZxPWj5PHy2lnwKtlH9IHPz8nnkWTN2V5jXIP0nGU30YPiutXZHVLjTnAyqxIm5e87aC4LopvL1MUWkZ/IfiGdjBNc55LkIAbxsAczKEdg0jbdUFzU4LjO6JEjfJuOUh3FYDVq9YA1cccQur0YBgv5vaP6/JvV1ikzcy8TTpPFIAOkJEKjYSVW9qMRFZ2yyh/ajar9F6G+QRIL18H7p9ucjdQShTU+7aZiaiWBK62uRktm64ZQt0JYBjV7bde+AUZlajzJaO6W57ogZ3q4XjzUYM3BlpgETsysGDB7ktTCJgaL0kDLme7DDwX8ydc3qnuAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XgPyMUkEdoCfrYOWeNm2AJHAD3zZBbVdLvjbrpc1BY=;
 b=KGp3+SfvJv0YmH9JOc5hptQRzP3kTMeUNx+qDnvCVvQRgZV+10pMRbr2oyZ/+75jJQxDgwZPc0YLbexd6Wi0k+5BpfdaWpkONvszQ8LdMf1eQq5fszlyfyUkwib0xHxFcclz8B2SdCKoqVIvlcOyG/qG8hs31IOZ99kAptbanvZ1KMUfff9PGu0DOksJWbTcsjT2jDSEVdq5hCqz+8inqCTcnLtO3Z0dRv921aaPgEhdI/wKEMAq2Q7rzojYyO7xJmWJFaLWdiX0+Oe5m+Hj5uYLZQZe28mQhzN8BoPgWH0cANXYq+hk76dAXnxDCRPHQ/yOBPIZB0tUylKKHn+41g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XgPyMUkEdoCfrYOWeNm2AJHAD3zZBbVdLvjbrpc1BY=;
 b=UsJC2tDOEEfB0U8YyIZYGlLry/d0xTNXp7bU8y5BjG3O7P6GJuHB2eFrrGJfeNgeyN/BMvkDvoWaBZtQgPGMyuw1R7kD5R2eF9pxLkzuhWkMNiIop6Hu4GxRsZE+kuDOSVoEjfcLGxytet9ijGIp00lgh548xcrQvjbae3w0wGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 16:53:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR18dlMAbCwEOeH4@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
 <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger>
 <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org>
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 67be0166-3be0-4f66-31ef-08dbc4e9b73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XpOvCAGpo0awFjeSAqMBZUASNBkrZue9TbG6yHeZg9CJi8Gb/5LZPz3pgE+whtH2X23ZVAfbulAY77zm1DhYvrZTyDlkM4zwP0ze3BQvIVYReMlQRmYiQ5tSO1zSOIFlZlsUsTxqMhsZSPIQ0uQuqSjYDZnm/1aiRHrdOVa39eglkdmbr005nAc4jv8NS7868PlHxIaKxDBwUUvuiAIv7NzO6vF71j9miB/EeTZDNm3HD8yeWRSnBM1v8XjgRMwNsLGVqvWxeN7EeBUQWDNLD/m+OjNKaOS/hrMDymwlynXU5dDBu71RpjMaW6OrRXsf4GYI1YVlDLqZUuuOKG4zxCKXkLOfzrG361cskuazEbxZWeYTjXgT3gSiE9HCHZYJin5j99SbPw6UEWFfuY+MFZDD+Qtosgzm5R9bmWqgkKm+0nVLAYyBdDJ/MI8SaSAVMbQEU+g5JlGp8Ux1SBf/0/+qDmMf/Gt31GLRDaVNGGxNrdhmKs+MUZZsmnCVUCV2Dn7Y6gduXEkgysuQN9lTN40NwhAo6gRIVZ1uFGGKbqSPqGNW8KMKacih2MY1DXbI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6486002)(478600001)(6666004)(6506007)(53546011)(66556008)(6512007)(66476007)(33716001)(9686003)(26005)(85182001)(2906002)(83380400001)(30864003)(54906003)(86362001)(66946007)(8676002)(5660300002)(41300700001)(38100700002)(82960400001)(316002)(4326008)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFBzMUxYS2VEUlhrZHJ4UnRkVWN0U1l0dkJPM1hZUFU3REY2MTh3eFZGK1d2?=
 =?utf-8?B?QTRQK3M3cG5rMmRaM3M0blFhMXo2aGFBVGFGanB2UjFkZGJCZUJCMXg2REo1?=
 =?utf-8?B?akYzWVVicGs1MnA3MGNYNlE5b0NqbDRiOFB4Yk1Cd29OR3ZWbElZd04xeGV6?=
 =?utf-8?B?MnZHRkdVQWpWc1lTcG9aTFlJRnJ1dWtYbHU5L1pwTlB1Q1hjVEg3aVFKL1Zw?=
 =?utf-8?B?RHRiSitqcnRFMFBoc2VYNHdGUExhMXF6RjdFR2l5ZU5lUzRwYStaUGtESjZI?=
 =?utf-8?B?Z3djeGlIRmRaRkVvUkg1eDlab1FxMWlhcjdCNWY3UnRjUVVNaW5sb3l0a1A0?=
 =?utf-8?B?RUppaUtZNWhFMmxCQ1ZBZkhjSTZBNGpQbVJheEMydmJPVFhxWkFWd0YvbWtJ?=
 =?utf-8?B?VHVDZ0Z0NldUdzZyZ1IwVDZBc20zdkVPM0xTUkdOaHg3eGZlaVZuYTMwSEhy?=
 =?utf-8?B?TDJCdVJ6czlGNVBDWlZuc2xvaG1mekROSmxORDFtc3I4QUw1NXV3YzVaQy9P?=
 =?utf-8?B?TzJCcFlUUDdHemRrSlVOUkNxdmR5Yi85LytQL3dJZXJHTlpsVzVMS0k4ZTdL?=
 =?utf-8?B?R0VWQmtpVzF2dlJPWmN0cXJLQVNLUS9BWWpYSVQzUkR0TEs2WXhwZldBdnda?=
 =?utf-8?B?RVg2ZHU1bXdXRU9XYlRseXV1ckFPaDJPeERpK3dZTU9Ba21IQllqWXY5Ym56?=
 =?utf-8?B?dzc2Q0pxMkRjMWxkRlBKRitRT0c1UGYwMHVWZXJBb1JXNnZLMjJKaUR5MXJ4?=
 =?utf-8?B?N1R0NDNxSFVOV25KcFF1cDZLZnREaWE1VURpaDRpb2p1N3NlYkgyUGVnQjdJ?=
 =?utf-8?B?bG0zd0R0bW0rUEhKd0lOdllwVmFESFZrcFhZbDd3NTVpL2FhMDJ3VmV5ZkM0?=
 =?utf-8?B?eE12Z1hIdGRZRW9Uak5rMWIrTzVTZUxTdU5SYmFzL3R0dGNGOWRlRm80QmZy?=
 =?utf-8?B?OUhxK1pjLzlvcis1NTZrVmE2SUZZQ3FnQnNSQ3NZdUJMdkpHZHY4YU5Gbmth?=
 =?utf-8?B?bGF5czFyUnBqSExJWktYZmJQU0dHdkE5L3lGVW5pdnFiWTRSTzROcUdIYTVn?=
 =?utf-8?B?Z0Fiek5BaElNOWYyVU1FMmtGSDVLRElYSy9RczRGRGozckpFQUx5QTR4WGZL?=
 =?utf-8?B?dDdPWVJnTVRxR3dOM3JiZ3lBalgyek5ZdGNndERydndGSjE4eThhb0VaNWc1?=
 =?utf-8?B?MFVjN2t2SGdlQmZ2WmdVS1FySWxuR0Nxc2IwRkxMYkVZWGsraTBlWFNQbHlU?=
 =?utf-8?B?SU9SZXlGMFE4ZUEydUlWU3Q2eTJHQ3o2azYrT3FCdVJwMWVqY0NkR0lsRVZK?=
 =?utf-8?B?UzkrRHVMUjBLRTE1NGtscDRKdCt6ZnlrNXVPc2lBRWJVVmtFMVoxWVBUREF2?=
 =?utf-8?B?UGg2aElSSHVIWXc4N2xIUVF5a2tJSWl5RkZGMEF3NmlqaDR6enNKZGRYNmVF?=
 =?utf-8?B?VTVTNzNrckZPRzY1Q2E5OFdqa3pZMThKZm81a3JydmNLTDhqUzFlSWZoazdv?=
 =?utf-8?B?c1hYa3NZd3c4TjNybWtNUGFKeG9MWUpFVitzVytGYTVTQVBOK0dTbjBoTlk0?=
 =?utf-8?B?S0RIaDlCZUN3c0NTT0xOMHBJaEJ1VVNOZWZRMzB0c0JYUWs3ZksyanlqTlhp?=
 =?utf-8?B?c3dKSjhEYmNzb0lxajFRbnhydlFMOERhV242U3dzb1pMVWE4cHdPZHovKzNz?=
 =?utf-8?B?VWROeHdFUnZ2Ui84TmEvOUJkUVJpTUFCNjJlYklLNG93WVl6UmFud0w4OTlX?=
 =?utf-8?B?UHdVRVU0R2p6T3lOMXJ0Wm1KTFFyaVlrY2RDTEJHVXgzZzJTdmU3cXJsV0lK?=
 =?utf-8?B?ZlNhelVXN3VwOVQzd3ZBSmhRYzltSlJzS2YwTGtnaVAyZm1NMVR1aXV2a1hw?=
 =?utf-8?B?c1puM3dFSFFwNTA3NmZFWFMybUxGT1g0OHp6dnRZUHJ6MFZ2REd3UWlWM2tF?=
 =?utf-8?B?anB5cmgwS05yemQ3QWh5V1pPWjBYY3JlNDkyUGVJQkRyREZkd2JNSnlNZEhE?=
 =?utf-8?B?OXZXdXVIS0wzRk5hd1d1WmdNeGhic21xTEJtQW1QOGVHMk1JTjNlMG9OdUh1?=
 =?utf-8?B?c2F5OExGNkpWSVRqdll0SFQ1Q29nekt4VmFMcnRGNUlGQnpWT0hBMUUrUG10?=
 =?utf-8?Q?vXYidBr3sapgg8Q9evlm+Sn+8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a6sqbIw3i1ONhRr2bZ9+ZcVLgt9I3FEgqT4kheuVBYPLCifYNtq20iWyXzBRKgMbj+gW0out0jW+cE3tstA8lSP7TbJHOPz+HELwFiURALKqGmK7Ta8umCtBPvx6UXx+4P/AIuCa96h+db8eBAG8v9abLM5VlAS4MyioJ0aqMHVBGlD8Bq9YyEqcmRy70+jkjAt6Qto+PcUVZK6JbjemqfznktkvNNisw64H+8WkswLD9BTbgQsq4tlKgFOsAjAkjlUjCwLCqDjTl61OXaEGDBSeTB+MskqHtSIICurETpDNG4rjbvxzor12LZMOXUAzqkipBvTUwy9JHviTqgXy8d4qAGzCXlid8efXWT2nYZ8gZvXonfeEwFGZQV5p522emJWItsmwzqqoqEW6rKM+WbiIdh1qrfN4YWV8pBOgeT+DJGLuLUotzc/vrydTokbaFgnd3mzlopUqproNpYJqbLAx6stDQBhAJVCcNWebFV0B0O/QKCyematb732AAjvWTZfTQObKSMwlvAZvaSpnNJMqxhVxvrZrCwxf5fcznXVzITviCTD5Zh+19Si4AO+uimCbkKKy/Ys1LJ9wc8lwlnj3c8OzB+jqZ6JALSlTHhsRcN7VLnOYzSahsTuCIoEC3fiQlQ/+uaprFDKjhc4kixlDBYlHgcMREKtXteCi+3/fec4pA8/im/6V5cSGEiRdgUReoLwVq4QpMo4E8nh2I7Vk6frc1nhhX+AJqjsaz+CgaRT4QCrhuy1XTw1T+JUj5wC4JWOAX8jw/DlkvSMQgCmzxMdN450IY2ZpQh0PVlNpX7mfZhY/dAGCPdON5GBJzoO40CnMfqpuQ2YIh8CRqh4YdXV+1i+Q2xl0AL0s7yxXXbX4lGe7Z3RLeygcpFkQbT0iq7fheBHs7foEfBSIkQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67be0166-3be0-4f66-31ef-08dbc4e9b73b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:53:48.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfJnxQCcdiJ8Ioj1GqaGJxbHo92q7My8xCdwIs5laFh7GahI5SG4z3C4XAPcq11My/3ZbLmqxYpsRvaKnncLIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5159

On Wed, Oct 04, 2023 at 03:06:14PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 04/10/2023 14:39, Roger Pau Monné wrote:
> > On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> > > Hi Roger,
> > > 
> > > On 04/10/2023 13:53, Roger Pau Monné wrote:
> > > > On Wed, Oct 04, 2023 at 11:55:05AM +0100, Julien Grall wrote:
> > > > > Hi Roger,
> > > > > 
> > > > > On 04/10/2023 09:13, Roger Pau Monné wrote:
> > > > > > On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
> > > > > > > On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> > > > > > > > On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> > > > > > > > > I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> > > > > > > > > the changes with the handling of the shared information page appear to
> > > > > > > > > have broken things for me.
> > > > > > > > > 
> > > > > > > > > With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> > > > > > > > > of the 4.17 release, mapping the shared information page doesn't work.
> > > > > > > > 
> > > > > > > > This is due to 71320946d5edf AFAICT.
> > > > > > > 
> > > > > > > Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
> > > > > > > This seems a fairly reasonable change, so I had no intention of asking
> > > > > > > for a revert (which likely would have been rejected).  There is also a
> > > > > > > real possibility the -EBUSY comes from elsewhere.  Could also be
> > > > > > > 71320946d5edf caused a bug elsewhere to be exposed.
> > > > > > 
> > > > > > A good way to know would be to attempt to revert 71320946d5edf and see
> > > > > > if that fixes your issue.
> > > > > > 
> > > > > > Alternatively you can try (or similar):
> > > > > > 
> > > > > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > > > > index 6ccffeaea57d..105ef3faecfd 100644
> > > > > > --- a/xen/arch/arm/mm.c
> > > > > > +++ b/xen/arch/arm/mm.c
> > > > > > @@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
> > > > > >                     page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> > > > > >             }
> > > > > >             else
> > > > > > +        {
> > > > > > +            printk("%u already mapped\n", space);
> > > > > >                 /*
> > > > > >                  * Mandate the caller to first unmap the page before mapping it
> > > > > >                  * again. This is to prevent Xen creating an unwanted hole in
> > > > > > @@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
> > > > > >                  * to unmap it afterwards.
> > > > > >                  */
> > > > > >                 rc = -EBUSY;
> > > > > > +        }
> > > > > >             p2m_write_unlock(p2m);
> > > > > >         }
> > > > > > 
> > > > > > > > > I'm using Tianocore as the first stage loader.  This continues to work
> > > > > > > > > fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> > > > > > > > > While Tianocore does map the shared information page, my reading of their
> > > > > > > > > source is that it properly unmaps the page and therefore shouldn't cause
> > > > > > > > > trouble.
> > > > > > > > > 
> > > > > > > > > Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> > > > > > > > > the recommended address range, but my understanding is this is supposed
> > > > > > > > > to be okay.
> > > > > > > > > 
> > > > > > > > > The return code is -16, which is EBUSY.
> > > > > > > > > 
> > > > > > > > > Ideas?
> > > > > > > > 
> > > > > > > > I think the issue is that you are mapping the shared info page over a
> > > > > > > > guest RAM page, and in order to do that you would fist need to create
> > > > > > > > a hole and then map the shared info page.  IOW: the issue is not with
> > > > > > > > edk2 not having unmapped the page, but with FreeBSD trying to map the
> > > > > > > > shared_info over a RAM page instead of a hole in the p2m.  x86
> > > > > > > > behavior is different here, and does allow mapping the shared_info
> > > > > > > > page over a RAM gfn (by first removing the backing RAM page on the
> > > > > > > > gfn).
> > > > > > > 
> > > > > > > An interesting thought.  I thought I'd tried this, but since I didn't see
> > > > > > > such in my experiments list.  What I had tried was removing all the pages
> > > > > > > in the suggested mapping range.  Yet this failed.
> > > > > > 
> > > > > > Yeah, I went too fast and didn't read the code correctly, it is not
> > > > > > checking that the provided gfn is already populated, but whether the
> > > > > > mfn intended to be mapped is already mapped at a different location.
> > > > > > 
> > > > > > > Since this seemed reasonable, I've now tried and found it fails.  The
> > > > > > > XENMEM_remove_from_physmap call returns 0.
> > > > > > 
> > > > > > XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
> > > > > > like edk2 hasn't unmapped the shared_info page.  The OS has no idea
> > > > > > at which position the shared_info page is currently mapped, and hence
> > > > > > can't do anything to attempt to unmap it in order to cover up for
> > > > > > buggy firmware.
> > > > > > 
> > > > > > edk2 should be the entity to issue the XENMEM_remove_from_physmap
> > > > > > against the gfn where it has the shared_info page mapped.  Likely
> > > > > > needs to be done as part of ExitBootServices() method.
> > > > > > 
> > > > > > FWIW, 71320946d5edf is an ABI change, and as desirable as such
> > > > > > behavior might be, a new hypercall should have introduced that had the
> > > > > > behavior that the change intended to retrofit into
> > > > > > XENMEM_add_to_physmap.
> > > > > I can see how you think this is an ABI change but the previous behavior was
> > > > > incorrect. Before this patch, on Arm, we would allow the shared page to be
> > > > > mapped twice. As we don't know where the firmware had mapped it this could
> > > > > result to random corruption.
> > > > > 
> > > > > Now, we could surely decide to remove the page as x86 did. But this could
> > > > > leave a hole in the RAM. As the OS would not know where the hole is, this
> > > > > could lead to page fault randomly during runtime.
> > > > 
> > > > I would say it's the job of the firmware to notify the OS where the
> > > > hole is, by modifying the memory map handled to the OS.  Or else
> > > > mapping the shared_info page in an unpopulated p2m hole.
> > > 
> > > I agree but I am not convinced that they are all doing it. At least U-boot
> > > didn't do it before we fixed it.
> > > 
> > > > 
> > > > When using UEFI there's RAM that will always be in-use by the
> > > > firmware, as runtime services cannot be shut down, and hence the
> > > > firmware must already have a way to remove/reserve such region(s) on
> > > > the memory map.
> > > 
> > > Can either you or Elliott confirm if EDK2 reserve the region?
> > 
> > I will defer to Elliott to check for arm.  I would be quite surprised
> > if it doesn't on x86, or else we would get a myriad of bug reports
> > about guests randomly crashing when using edk2.
> > 
> > > > 
> > > > > Neither of the two behaviors help the users. In fact, I think they only make
> > > > > the experience worse because you don't know when the issue will happen.
> > > > > 
> > > > > AFAICT, there is no way for an HVM guestto know which GFN was inuse. So in
> > > > > all the cases, I can't think of a way for the OS to workaround properly
> > > > > buggy firmware. Therefore, returning -EBUSY is the safest we can do for our
> > > > > users and I don't view it as a ABI change (someone rely on the previous
> > > > > behavior is bound to failure).
> > > > 
> > > > I fully agree the current behavior might not be the best one, but I do
> > > > consider this part of the ABI, specially as booting guests using edk2
> > > > has now stopped working after this change.
> > > 
> > > Right. If we remove the check, you may be able to boot a guest. But are we
> > > sure that such guest would run safely?
> > 
> > If the guest wants the hypervisor to enforce such behavior, let it
> > use the new hypercall to explicitly request the shared_info page to
> > not be mapped anywhere else.
> 
> TBH, I am not convinced the new hypercall is going to help. Let say we
> decide to modify FreeBSD/Linux to use it, The old EDK2 firmware would still
> be buggy and this would prevent boot. So we are back the same problem...
> 
> We could also say we don't support older firmware. But that's not very
> different from leaving the hypercall as-is and fix EDK2

We could at least print a warning message that the firmware still had
the shared_info page mapped, and that the system might not work as
expected.

> > 
> > But if you don't trust the bootloader, how do you know it hasn't poked
> > holes elsewhere in the RAM regions?
> 
> We don't know. But how do you know the bootloader will not want to continue
> using the vCPU shared page?

I don't think it's feasible for two entities to concurrently use the
shared_info page.

> For instance, the public headers doesn't seem to mention that the page can
> only mapped once and it would unmap the previous area. In fact, for Arm,
> until that commit shared page could be mapped N times... So technically even
> if we remove the page, the commit already made an ABI change. Yes it is now
> more inline with x86 but this doesn't this is still an ABI change. I would
> be surprised if you say we should not have done that because (in particular
> if you have XSA-379 in mind).

So we agree at least that there's an ABI change :).

It's different from 379 because the shared_info page is never freed
for the lifetime of the domain, hence there's no risk of leak in this
specific case.  I can see how preventing multiple mappings can be a
safeguard for possible issues similar to 379.

Isn't it possible to map a grant at multiple gfns however?

> > 
> > Even if the shared_info page has been unmapped, can you be sure the
> > bootloader has put a RAM page back in that gfn?
> 
> We can't. But the same goes with the bootloader reserving the region...
> 
> > 
> > I understand this ABI change is done to avoid bugs, but at the cost of
> > diverging from x86, and breaking existing firmwares which might not be
> > buggy.
> As I pointed out above, the exact behavior of the hypercall is not fully
> documented and the behavior has changed with some XSAs. So this is no
> surprise if Arm and x86 behaved differently (even before that commit).
> 
> There are plenty of behavior I considered wrong in the way x86 update the
> P2M and I would be concerned if we don't give any leeway for the
> architectures to tighten the update. BTW some checks have evolved over the
> time during security event (XSA-378 for example).

ABI changes due to security issues are unavoidable.

> This is not very different here. For Arm we decided to not follow a behavior
> that I consider incorrect and potentially more harmful than trying to
> support bootloader not removing the shared page.

I think this is not very friendly to users, specially if edk2 wasn't
checked.  I understand the situation is different on Arm vs x86, so if
edk2 is not supported on arm I guess it doesn't matter much whether
it's broken.  It would be a much worse issue on x86 where edk2 is
supported.

> If we want to handle such firmware, I think it would be better if we provide
> an hypercall that would return the GFN where it is currently mapped.

Sure, but such hypercall would be racy, as by the time the gfn is
returned the value could be stale.  Adding a replacing and non
replacing XENMEM_add_to_physmap variations would IMO be better.

Anyway, I don't maintain this, so it's up to you.

> > 
> > > Also, it is not really argument, but this is not the only broken part in
> > > EDK2 for Xen Arm guests. The other one I know is EDS makes assumption how
> > > some Device-Tree nodes and this will break on newer Xen.
> > > 
> > > So overall, it feels to me that EDK2 is not entirely ready to be used in
> > > production for Xen on Arm guests.
> > 
> > I really have no insight on this.  What are the supported way of booting
> > guests on Arm?  (SUPPORT.md doesn't seem to list any firmware for Arm
> > guests AFAICT).
> 
> Some bootloaders (e.g. U-boot/EDK2) have support to be used as a fimware for
> Xen on Arm guests. But they are not supported officially.
> 
> Most of the setup seems to specify the kernel directly in the XL
> configuration. We probably ought to add support for EDK2/U-boot.

I had no idea about that, I do think some kind of firmware is required
or else OSes different than Linux can't be supported unless they
implement the Linux entry point.

Is the entry point / CPU state for arm guests documented somewhere?

I wonder whether Elliot could use that for FreeBSD until the situation
with edk2 is stable.

Thanks, Roger.

