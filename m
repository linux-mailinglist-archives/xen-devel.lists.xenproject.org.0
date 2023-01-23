Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CA677A90
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482805.748520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJveF-0000Mn-IN; Mon, 23 Jan 2023 12:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482805.748520; Mon, 23 Jan 2023 12:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJveF-0000Gf-F1; Mon, 23 Jan 2023 12:10:03 +0000
Received: by outflank-mailman (input) for mailman id 482805;
 Mon, 23 Jan 2023 12:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJveE-00008T-LP
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:10:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da731c71-9b16-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 13:09:59 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 07:09:43 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5306.namprd03.prod.outlook.com (2603:10b6:5:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:09:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:09:41 +0000
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
X-Inumbo-ID: da731c71-9b16-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674475799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ou5sAyXk6SHDdw+3MAn2dDSblhTDS4EeWN8QGUyPqV8=;
  b=fSD6j+rCwGrUltvNFf9E9Qn34sUd6X0d4XTdLxm2pcC9pDUWxb95RdGw
   PGd1hG1Eu4PcuqH4Y0TqaUNcdqhdvmfXsBHhNDgCUcOGvIwoZX0ibXoI9
   rIx/dVQ0ncHjh50NgEnMP/CKtBwkg7iu5QvPtAXyzutSW6W+U2zVzDQVM
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 93765027
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/McqKKnzpr+SNr6XK+zO3/Lo5gwaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeD2DTM//eNmDxKtsgOdnkoU1U6JaHzdcwTlZr+SFhFiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5gSGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dxbIismRDOuu7uznO3nabBxjesZa8a+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDT+Lmq6Yw3zV/wEQiUBA3TnaSpMWSpXaiHIl/D
 Xc/whgh+P1aGEuDC4OVsweDiHmAsx0HWtsWEPAg7wqNya387AOQB2xCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdptL0EDf03
 juDhDI/mbIIjMgAka68+DjviTWmrInEVQ4x6wDeWEqq6wp4YMiuYInAwVHf7O1cJYeDCFebt
 X4PmtO28+wFS5qKkUSlS+ILGrar6/+bMSb0jltmHp1n/DOok0NPZqhV6TB6YU1vYsANfGawZ
 FeJ4F0BophOIHGtcKl7JZqrDNgnxrThEtKjUe3Iat1JYd56cwrvEDxSWHN8FlvFyCAE+ZzT8
 7/BL65A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:wQnc5qNKfN/IeMBcTuCjsMiBIKoaSvp037BL7TELdfUxSKalfq
 +V7ZAmPHPP+VMssRIb6LO90cu7MBXhHPdOiOF7XNeftSbdyQmVxepZnPLfKlPbalXDHy1muZ
 uIsZISNPTASXZ9i8j+7E2DH9EszMLC2Ly0hI7lvhBQpM1RBJ2IJj0WNjqm
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="93765027"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJs/jer36UfZuJUqyOS9tHW5/z0H6Ld0rdntlYNsMncOh+Xq6V4A8tPg25yuiRwRkmB+pBFoea2tgh96TpnT+ypmJmHMOO8akweAJlhjS+D+/T9+WKrz+IywSTcPrSYVzt3o+YqO83Jo3IY87yFwdQc8ky4K8BP7UN7WxWeM+V76b1wgRSP6WN2+njJ2QGtg/KG/Q1KFfzbCZ18u4myYu0vj09a8nL6/voL60cTynj+RahOl7O071pfEdX2myyZz7hV7C1NpD3mhWcW2VQreLvtrrjZL+Y/cXX0Vo0o1obQtLcDu4Sc554B+JFeo5iBgIGHidOxB/u1iqsLuz1kHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou5sAyXk6SHDdw+3MAn2dDSblhTDS4EeWN8QGUyPqV8=;
 b=iaLRMrxE3WRsXMUrC2RG0YFzmgC1nGrW0jd4B4anYJMTNuksJaEInSeNAIUS7sVOv34QmXWBiX7IlLy8XY0DCc9VkhQjnzU1PmQOSMTjmsX4qIA47zBSEFxX5TzI0t8LusHpxWvCwkINIFY8YX366hT0msXMaO9rDQ0bW5FQ6OJyMCibGU5A2bV49o6o5e1VRVapEeprDHe+/0pCACJQDzUKJ1okmMpUnWItgQUvu90KaXfqyq4VBCfn3SspjxuXhgKVV4BlPZflZ6LSxw3AuxnaWUTR8E4dak8fN8RbmbcqAmLBuy2lwksf7ZfM1rS8HVXDABA0fGxJo3wR3KoLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou5sAyXk6SHDdw+3MAn2dDSblhTDS4EeWN8QGUyPqV8=;
 b=DuZbBYerpsrVDG8qpK3Kz+1R08+UpGzMMo4qW7k80/CaTYBUe/6MzUzDzTfBchmpZSfQh+23rPqLRZIDaUcDHT0hOWiu4AFSK2jJC+MldyE08AIEw0vvw3oh0KA2xn9loYMgkYt6aJGxrvZYwJl65l0EQdm+FcJSjNb5tXBSGog=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 08/14] xen/riscv: introduce decode_cause() stuff
Thread-Topic: [PATCH v1 08/14] xen/riscv: introduce decode_cause() stuff
Thread-Index: AQHZLN///evNj7qtDEG2WE9mE7PhWK6r7WMA
Date: Mon, 23 Jan 2023 12:09:40 +0000
Message-ID: <00af9dc0-1a3c-ef37-3d4d-b0a307349bf3@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <c798832ec19cb94c0a27e8cff8f5bd6d1aa6ae7e.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <c798832ec19cb94c0a27e8cff8f5bd6d1aa6ae7e.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5306:EE_
x-ms-office365-filtering-correlation-id: 2192ac11-4cb3-4339-2e41-08dafd3ab4d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xJMkEJj0utaH3W4xDgk4EQAkYmtUw6MxvWTJ+VvLEtGelXn4h7S7rg4qpuo+H1b0be62dmnGEU+WFlQI/dzaCGBLOICcegnF/iVPYAlJEkrTi6wyQKaNuK7vQvvXXKFz1p6ZrPTu3c7viQeIGbsHWC+iqU5mzXA5vWC2SbScnyk3idhYEDRB0KKeXiiMfZoYqudT/bK+VBn3n5/tuLfSXumAOAZVfHq3V4rza4wCEynw6xcQrhpQUTjx37j7jqHe7ySqRkmPxS3+r4ZpqUiGsWDri5RWtk5DLx+/9YCX4n2aoxL466/xTTB9xQsvn4VtQ08hpXOUCPM/e3v5xw/FV+QOax6QP0DEkFG7ogvU0obu8HQkrjuflj+4oU0lE6IR+j0WZnIwggeNtHnK+G3PjfGGnz3j/Nv+e+s05Etn2Qvy/irbL7z7f/0tdrq5Dwj5HUOsENjyLZtbQmy9zeqUzD9i5S2XCP7HWB9hxaVfJ0CEFhPRQArLwJqJApuMShio4q6BkwK/xdV+5Mllrut9Jay9SzYW8sOtuwwY6gPrrgpA3B58U8d3BiY/XAUynFAPooioDLuZC24X3KaZSc9H3g0Dv6MMpnUnQPuZDVS/uKnOlLxC+L3Sll2ByMmYDiiDzqR4H4Emu6YOl5yNu0KUi/3pdYcsM/qSx/GC3rGKquVUtwJmR/d572NK/IPTrXVGpx30qYmMS6CBcLyM1BElq62FZ3mBpkHHS665d0malIxtR/IS699Ddx9mIFyMZHh6MA4W+NDRuxWLZsZ3z6uH9g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(71200400001)(31686004)(53546011)(4326008)(8676002)(66556008)(66476007)(76116006)(66946007)(66446008)(110136005)(64756008)(6486002)(2616005)(91956017)(83380400001)(6512007)(41300700001)(26005)(8936002)(5660300002)(186003)(6506007)(2906002)(38100700002)(82960400001)(122000001)(31696002)(38070700005)(478600001)(316002)(54906003)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGlldUlQdlFPQUFQc2pIR2NDQko5djBScWtWYUpDaWxJbHAraVBxNFhPNnhq?=
 =?utf-8?B?dXlOOUxqU1pHa0tNdVRZZUhhaE02ZUx1QjBLcktvdUFJaFhGaTYzKzN3YStu?=
 =?utf-8?B?Y1pmNFh0NFJjVVZicE82SStOVUh4bkh5QXZZWEpUS29WOHNXRHdxWmdTRVNU?=
 =?utf-8?B?TlpvcHY2T09GQ2doU1NFWFVkc1k4aERIblgxL1hjT2owRUh0d1A3RHRkeHIy?=
 =?utf-8?B?ajFvYi9GN0hIc3FXU09NZWpBbjVUWDBqcGk4cFZydHNHUDhkN1A3Ykw2M0dO?=
 =?utf-8?B?QTZWUVZPT3ZBRkJzVnlKT0RqV0xtMW9aaEhmaUFMWFU2WFE4UVNNQW9EUTNZ?=
 =?utf-8?B?S0FhamlYTHNjTVdPb3B0U2tMajhpVVZENy9NVktIQVhZZUJOYlBTc2N5VmJX?=
 =?utf-8?B?RWVlY0VWUmxqUlpsS3o0R3FoTXp2UUZQcUdJaFIzbGJweTZjZzVIVXFyQnRj?=
 =?utf-8?B?VHNIL3ZMU0RyVmp4L2toTDQ2T1lGcy9tLzJNL1l6RFNyZXdJRzNYQStkMWtF?=
 =?utf-8?B?bG1ZMFdBSWtNZ29MdUFPcVpkTWdlSTRqYXFMWkdWbTdlbGpQZVMvN0lhQ0lU?=
 =?utf-8?B?cmJKNlhTVUtzSDY4cW53ZFN3MU5jYkpDZGtjdFkzRldRZlQzNEdSekIrTEhJ?=
 =?utf-8?B?R20wMGlLdFkxRGxFZk03NEx1eHc1WDU0MmFjSjlhK3dNc2w2M3RFUkdNQTA0?=
 =?utf-8?B?RCs4eEZCSzBaVG5MVjFydWRRMGlXYk13alhlVTMyNUc3UjRiM3hNc0E1RlUz?=
 =?utf-8?B?T1FEMlJCZXV3SXRTdUg3ckh0b0VYODh0NEppU2xvT1hOV1cxZ1ZET1kyUDRM?=
 =?utf-8?B?Yk85YURXbFQybUN4eXR3Njgyb3JzVVJYTklENlBUUitqZVBNcWFuVExDS1JS?=
 =?utf-8?B?dE5nWGV3akpBS2RZZm5Ja3Z1RWpGUTB5S1RCbzYrNWt3Y1MrRTdVTVhySk5a?=
 =?utf-8?B?eW1TYkhxSEpGYmpWLzhsVFY0VVYwSFJMQnNHbU1RVW4vL0hJSWw3ZjRBVVhn?=
 =?utf-8?B?L3FpVEpoWXprSE1LblB3bzRmVnFhdjIxaXNRUUJacFRlNUVET1ozcHovWnhh?=
 =?utf-8?B?UGhCRjR3NmFaYWZ5c1RCY1V0TnVjNjVtNHhqOXBoeDJyT1J5RVl5Y3dmaFdU?=
 =?utf-8?B?WkoweFIrV3N4di9VSWFMTEY5bVNkT3MxdHRQSzNyV0ZDeHpxdG81OWNzU0ZF?=
 =?utf-8?B?WDJqZGhXOU1UZ0RBR3oyRVMxY0R0T2VjUXNJejNhRWYzUEt4MEE3clhSekxZ?=
 =?utf-8?B?bnE2UHJWZG9IU2ZJOTNEZU1STk1sbTRLNzZMajV3bERtQXVpb2RiVG1sOTZ4?=
 =?utf-8?B?eUZPTjZvR3FiaW5scFBGUEFiL3VtOXVrdjhraWhZbDNqcThEZjN6N1V4cFo5?=
 =?utf-8?B?RnBGSnlzc2ljR0NRYi8rZkJsdll6ZThtQy9LSGJWNFF3ZlhObkFvbk4zNk1U?=
 =?utf-8?B?RkFJWlRPcVp5alNyY0ljaTFKanFFa0M3WW91dFkzVGRUQlhPMnhYdDNRWFVa?=
 =?utf-8?B?dVJ2WnZyOHZVeG0wU3BZQzhrcHZyUkZKcWIxT1FWazMza1dnWjc0c3NuUDVL?=
 =?utf-8?B?ZEQ2RzI5TFVhTDVxUUtLbTByOUN5cjBaYTJnYTVCYVpXa09QS3ZWWnU3YjBt?=
 =?utf-8?B?MGVTRk43bHdscDUwUU9aUXBnVE95TkxJaVNVMks4YnRwV01TQ1FyOGhuN0pk?=
 =?utf-8?B?ZEMzWjY4Y3NaS0w2Y3hBZWF6VjJzWDlJMnZtdmdQRVNLV2c1bnQ2ZVcwcitl?=
 =?utf-8?B?VForMko3eW1hK1d2TDVPZzE5Ukt6S1F1VE1YWjZ4NzIyc2Y0bmlrMFY2WWVh?=
 =?utf-8?B?ZHRPQkh3ZGliSmpHaDU3b1ZtaDJPNWF6UW5EQ3Q3c2FMbzJ0TmoybmxXaHRK?=
 =?utf-8?B?MmttREl1MzlLQTl5M1RaMXVvc3lqbk1WT2xPUUVQam9YeFRZNG1YdkNOZFZ6?=
 =?utf-8?B?QUs4QkFyNTQyVld0YlpULzk0YXlMU2tUdHZIdUJIUThiODZONTBGemZpckpR?=
 =?utf-8?B?cEFPUkdzMGxJTHcrNmVabFkrNXhyVXJabmdyeUtjdVNzbUJKaGlhd3VDYlF1?=
 =?utf-8?B?a1ZJMHVrelkzSEFpZ2FOK1NJdk1zQWJXQ0t6UEM2OFdoK0FuYWM4L3BicGNR?=
 =?utf-8?Q?pQClQpRogatvGsHQ/9ILa/kYt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D7A5DDEFB017F44B7FB53E7E225468E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2AqXIGzuxZoTm7Gn+i1xJjff0KlbMltpqP2ifj5JEFOZphp4Ye6bybE5sytlyOzhDLW9DDGLZ4y1OsNOM72p+WrlC70eVdSiBEROuP4Vr5GtFD1GRiKrL6nI+2hzegIwLMqX3m4p4VExOGxA23v0o4Tbmcv2nmjgn4zmyH/oIPP2xKxKXTUTLPIT8lRDakbbvyH1qazW0UkGQ7vw60fa8dymUcejoe6oFFlZ8D53+NfKXDnovKgRFIOklNmwYCs4hFhoFFu14Oy7PY55fP/6mfgqtWVDXEHauLRiWFPBtpWjiKIn8F4lPJFy0mIXJYpByi+BNgJuTWWpXIRrYSGMUvAeKy7NMRjB3uYQ6FV6q9VZJONJWOoIIzr3KkexwQNmnCS0n5Bs7zL4QNDK9494al7gXN/Rf7jyuFMkpWGWJg8NgcZWL6CQA/bmychxSxdzfQVX3xMYG1scFCETiyBW4sR9xCpmCaDFQCPP9RCgoRwerOOEE401ABntc17v0bKYihVZEaYmRrecO4Ic454LDZtLGl+9csYPhMerrt3o8nQJz74PgkBvws+aRgqk1nJwydtOXtZfLq8gw/DR44szxrgSiW9XPZchqfl/1m+rl/6PWANiu2Et/DJMcullTvDfM/n9ffusXoIWYs4ALlQnmA0SxVnDMp83i76KpCd74onEDTHJfxqw7hE+X47sB9pLPDDgXESizwUdfCW6zHiWGedwfQEuh78P4jO1gZgylOp/hX/YnfmbOt/9aHmSHQMDhKLiqbj9e5xjHdpf/erMKhf7oouOuWSQ07YhYYEhM4O53cc0Xevz5JzQwgW/fxpaZkCgi7PM+ZjUe0FNH5xyEaj4wvvcPew0bPplWcYhQDQOm15bKaZv+ry2sib/v4kXruc6QG5mm1ZErzC3Z8USYQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2192ac11-4cb3-4339-2e41-08dafd3ab4d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 12:09:41.0096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peN8i70rrznHt6kifnGrYUCW/sTYWIzdoME267a3cKVb8OCyHQexixKIUEmupQ1DN3IlE79IiM7DrA71WyP5UtZeZidnt7n0zVt363Ti7A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5306

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvdHJhcHMuYyBiL3hlbi9hcmNoL3Jpc2N2L3RyYXBzLmMNCj4g
aW5kZXggMzIwMWI4NTFlZi4uZGQ2NGYwNTNhNSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvcmlz
Y3YvdHJhcHMuYw0KPiArKysgYi94ZW4vYXJjaC9yaXNjdi90cmFwcy5jDQo+IEBAIC00LDggKzQs
OTYgQEANCj4gICAqDQo+ICAgKiBSSVNDLVYgVHJhcCBoYW5kbGVycw0KPiAgICovDQo+ICsjaW5j
bHVkZSA8YXNtL2Nzci5oPg0KPiArI2luY2x1ZGUgPGFzbS9lYXJseV9wcmludGsuaD4NCj4gICNp
bmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+DQo+ICAjaW5jbHVkZSA8YXNtL3RyYXBzLmg+DQo+ICsj
aW5jbHVkZSA8eGVuL2Vycm5vLmg+DQo+ICsNCj4gK2NvbnN0IGNoYXIgKmRlY29kZV90cmFwX2Nh
dXNlKHVuc2lnbmVkIGxvbmcgY2F1c2UpDQoNClRoZXNlIHNob3VsZCBiZSBzdGF0aWMgYXMgeW91
J3ZlIG5vdCBwdXQgYSBkZWNsYXJhdGlvbiBpbiBhIGhlYWRlcg0KZmlsZS7CoCBCdXQgYXMgaXQg
c3RhbmRzLCB5b3UnbGwgdGhlbiBnZXQgYSBjb21waWxlciB3YXJuaW5nIG9uDQpkZWNvZGVfY2F1
c2UoKSBhcyBpdCdzIG5vdCB1c2VkLg0KDQpJIHdvdWxkIG1lcmdlIHRoaXMgcGF0Y2ggd2l0aCB0
aGUgZm9sbG93aW5nIHBhdGNoLCBhcyB0aGUgZm9sbG93aW5nDQpwYXRjaCBpcyB2ZXJ5IHJlbGF0
ZWQgdG8gdGhpcywgYW5kIHRoZW4geW91IGNhbiBnZXQgZXZlcnl0aGluZyBuaWNlbHkNCnN0YXRp
YyB3aXRob3V0IHVudXNlZCB3YXJuaW5ncy4NCg0KPiArew0KPiArICAgIHN3aXRjaCAoIGNhdXNl
ICkNCj4gKyAgICB7DQo+ICsgICAgY2FzZSBDQVVTRV9NSVNBTElHTkVEX0ZFVENIOg0KPiArICAg
ICAgICByZXR1cm4gIkluc3RydWN0aW9uIEFkZHJlc3MgTWlzYWxpZ25lZCI7DQo+ICsgICAgY2Fz
ZSBDQVVTRV9GRVRDSF9BQ0NFU1M6DQo+ICsgICAgICAgIHJldHVybiAiSW5zdHJ1Y3Rpb24gQWNj
ZXNzIEZhdWx0IjsNCj4gKyAgICBjYXNlIENBVVNFX0lMTEVHQUxfSU5TVFJVQ1RJT046DQo+ICsg
ICAgICAgIHJldHVybiAiSWxsZWdhbCBJbnN0cnVjdGlvbiI7DQo+ICsgICAgY2FzZSBDQVVTRV9C
UkVBS1BPSU5UOg0KPiArICAgICAgICByZXR1cm4gIkJyZWFrcG9pbnQiOw0KPiArICAgIGNhc2Ug
Q0FVU0VfTUlTQUxJR05FRF9MT0FEOg0KPiArICAgICAgICByZXR1cm4gIkxvYWQgQWRkcmVzcyBN
aXNhbGlnbmVkIjsNCj4gKyAgICBjYXNlIENBVVNFX0xPQURfQUNDRVNTOg0KPiArICAgICAgICBy
ZXR1cm4gIkxvYWQgQWNjZXNzIEZhdWx0IjsNCj4gKyAgICBjYXNlIENBVVNFX01JU0FMSUdORURf
U1RPUkU6DQo+ICsgICAgICAgIHJldHVybiAiU3RvcmUvQU1PIEFkZHJlc3MgTWlzYWxpZ25lZCI7
DQo+ICsgICAgY2FzZSBDQVVTRV9TVE9SRV9BQ0NFU1M6DQo+ICsgICAgICAgIHJldHVybiAiU3Rv
cmUvQU1PIEFjY2VzcyBGYXVsdCI7DQo+ICsgICAgY2FzZSBDQVVTRV9VU0VSX0VDQUxMOg0KPiAr
ICAgICAgICByZXR1cm4gIkVudmlyb25tZW50IENhbGwgZnJvbSBVLU1vZGUiOw0KPiArICAgIGNh
c2UgQ0FVU0VfU1VQRVJWSVNPUl9FQ0FMTDoNCj4gKyAgICAgICAgcmV0dXJuICJFbnZpcm9ubWVu
dCBDYWxsIGZyb20gUy1Nb2RlIjsNCj4gKyAgICBjYXNlIENBVVNFX01BQ0hJTkVfRUNBTEw6DQo+
ICsgICAgICAgIHJldHVybiAiRW52aXJvbm1lbnQgQ2FsbCBmcm9tIE0tTW9kZSI7DQo+ICsgICAg
Y2FzZSBDQVVTRV9GRVRDSF9QQUdFX0ZBVUxUOg0KPiArICAgICAgICByZXR1cm4gIkluc3RydWN0
aW9uIFBhZ2UgRmF1bHQiOw0KPiArICAgIGNhc2UgQ0FVU0VfTE9BRF9QQUdFX0ZBVUxUOg0KPiAr
ICAgICAgICByZXR1cm4gIkxvYWQgUGFnZSBGYXVsdCI7DQo+ICsgICAgY2FzZSBDQVVTRV9TVE9S
RV9QQUdFX0ZBVUxUOg0KPiArICAgICAgICByZXR1cm4gIlN0b3JlL0FNTyBQYWdlIEZhdWx0IjsN
Cj4gKyAgICBjYXNlIENBVVNFX0ZFVENIX0dVRVNUX1BBR0VfRkFVTFQ6DQo+ICsgICAgICAgIHJl
dHVybiAiSW5zdHJ1Y3Rpb24gR3Vlc3QgUGFnZSBGYXVsdCI7DQo+ICsgICAgY2FzZSBDQVVTRV9M
T0FEX0dVRVNUX1BBR0VfRkFVTFQ6DQo+ICsgICAgICAgIHJldHVybiAiTG9hZCBHdWVzdCBQYWdl
IEZhdWx0IjsNCj4gKyAgICBjYXNlIENBVVNFX1ZJUlRVQUxfSU5TVF9GQVVMVDoNCj4gKyAgICAg
ICAgcmV0dXJuICJWaXJ0dWFsaXplZCBJbnN0cnVjdGlvbiBGYXVsdCI7DQo+ICsgICAgY2FzZSBD
QVVTRV9TVE9SRV9HVUVTVF9QQUdFX0ZBVUxUOg0KPiArICAgICAgICByZXR1cm4gIkd1ZXN0IFN0
b3JlL0FNTyBQYWdlIEZhdWx0IjsNCj4gKyAgICBkZWZhdWx0Og0KPiArICAgICAgICByZXR1cm4g
IlVOS05PV04iOw0KDQpUaGlzIHN0eWxlIHRlbmRzIHRvIGxlYWQgdG8gcG9vciBjb2RlIGdlbmVy
YXRpb24uwqAgWW91IHByb2JhYmx5IHdhbnQ6DQoNCmNvbnN0IGNoYXIgKmRlY29kZV90cmFwX2Nh
dXNlKHVuc2lnbmVkIGxvbmcgY2F1c2UpDQp7DQrCoMKgwqAgc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IHRyYXBfY2F1c2VzW10gPSB7DQrCoMKgIMKgwqDCoMKgIFtDQVVTRV9NSVNBTElHTkVEX0ZF
VENIXSA9ICJJbnN0cnVjdGlvbiBBZGRyZXNzIE1pc2FsaWduZWQiLA0KwqDCoCDCoMKgwqDCoCAu
Li4NCsKgwqAgwqDCoMKgwqAgW0NBVVNFX1NUT1JFX0dVRVNUX1BBR0VfRkFVTFRdID0gIkd1ZXN0
IFN0b3JlL0FNTyBQYWdlIEZhdWx0IiwNCsKgwqDCoCB9Ow0KDQrCoMKgwqAgaWYgKCBjYXVzZSA8
IEFSUkFZX1NJWkUodHJhcF9jYXVzZXMpICYmIHRyYXBfY2F1c2VzW2NhdXNlXSApDQrCoMKgwqAg
wqDCoMKgIHJldHVybiB0cmFwX2NhdXNlc1tjYXVzZV07DQrCoMKgwqAgcmV0dXJuICJVTktOT1dO
IjsNCn0NCg0KKG5vdGUgdGhlIHRyYWlsaW5nIGNvbW1hIG9uIHRoZSBmaW5hbCBlbnRyeSwgd2hp
Y2ggaXMgdGhlcmUgdG8gc2ltcGx5DQpmdXR1cmUgZGlmZnMpDQoNCkhvd2V2ZXIsIGdpdmVuIHRo
ZSBob3BlIHRvIGdldCBzbnByaW50ZigpIHdpcmVkIHVwLCB5b3UgYWN0dWFsbHkgd2FudCB0bw0K
dG8gYWRqdXN0IHRoaXMgdG86DQoNCsKgwqDCoCBpZiAoIGNhdXNlIDwgQVJSQVlfU0laRSh0cmFw
X2NhdXNlcykgKQ0KwqDCoMKgIMKgwqDCoCByZXR1cm4gdHJhcF9jYXVzZXNbY2F1c2VdOw0KwqDC
oMKgIHJldHVybiBOVUxMOw0KDQpBbmQgcmVuZGVyIHRoZSByYXcgY2F1c2UgbnVtYmVyIGZvciB0
aGUgdW5rbm93biBjYXNlLCBiZWNhdXNlIHRoYXQgaXMNCmZhciBtb3JlIHVzZWZ1bCBmb3Igd2hv
bWV2ZXIgaXMgZGVidWdnaW5nLg0KDQp+QW5kcmV3DQo=

