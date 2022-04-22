Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AF50BA89
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311021.527992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuZ7-0008CA-FN; Fri, 22 Apr 2022 14:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311021.527992; Fri, 22 Apr 2022 14:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuZ7-00089a-CJ; Fri, 22 Apr 2022 14:47:21 +0000
Received: by outflank-mailman (input) for mailman id 311021;
 Fri, 22 Apr 2022 14:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhuZ6-00089S-5V
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:47:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1c0e3e-c24b-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 16:47:18 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 10:47:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM5PR03MB2826.namprd03.prod.outlook.com (2603:10b6:3:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 14:47:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 14:47:14 +0000
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
X-Inumbo-ID: 1b1c0e3e-c24b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650638839;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CjqDlz04ZHJ1O1uKdizqU1iQf7raZFrx37RV2ckVO50=;
  b=d7jgg4kazFyAzQ8jw6IqAmqRi3+bVyfJDyKJNTD7MWIzhmpyk2PocLBp
   iOuXn2q3hO0HkYtIIJJKrdNzdxRUHE2IY7DJXbGQfQVxWMIAUTHs8tI1M
   dCN1g09oZ7lMjbst479Oa+/Y616b6Cv2WQy4t58vWQKKbH0vYLgv1+DZj
   0=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 69109873
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:T3rmfaPjT7/7Nc/vrR3UlsFynXyQoLVcMsEvi/4bfWQNrUom3jBSz
 jcZXDyDP/aDNDP9KdlzPYW29R8H65fWn9cyGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 84TkoaIZAwTB7DMleAsUThcUH4gIvgTkFPHCSDXXc276WTjKiOp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaG/uiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ8QrE9fVsi4TV5B147pf1CN/NRsKHfOx83U3Ep
 TKFxXusV3n2M/Tak1Jp6EmEhODVmjjgcJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0ZjZLO+gz6QXIz7WO5Q+cXzAAVmQYMIJgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:V2hNXKtR8blN67OlWOb+cFNU7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69109873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPhwDNqCbNOQCe3PmOX5Bq8JMPTow15i4XNX9B8geTuhznKhIOos3t3ClKZ8DSY3P2WTVnE0EZ07OqDtZCR3CCdJflw/M0yhMxEDVf+c5J7cV1OgtvqZQlH3w23UmAMn7LAwrYVeXWBwO0HjOk4l/hL1mBAP/F5rKDlFC3rM3gnW84vxN52eWz+AfHQxqFKrg94YEV9a3YGQNWRNBKO0805rXY+zqIYtlFgk5THgvyqwxbPMj5gmE4fECoe4yTHPB3KQIaPUJzRYb+voELleG/QZVJa+MEXdO6ECPbgauz3GIjSn8JAQb2lk3LRnpPyYTRip1sXM5APIt3LszGLynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjqDlz04ZHJ1O1uKdizqU1iQf7raZFrx37RV2ckVO50=;
 b=mrZDR+9yWow/GPDLoRJs4P7gTHxsVLMSraPmJTJ8GApSTCVg/o8ixc/zkgb15kDqJgrxlG24t6PQTFUsUn0h7rQhA3JIYc7NKuyEkEgyR3vP5CY7rRZwDlkOVI8QaDLrSrXe+lFZ0ZXvv86S+YioGN5L4KleMMp/vjyChUVxNAFBvYtZHXMVEbA/AYWcjjwlFUB0Pdw6L/xSftQ9enZoQjGJpZE8BXYq3YfkW8BiKIYnPIoziE+yYt9rZka/FnPDWu8KeF+oR2X25GwdVQ3+n6DvkE0cMxc3eRxMucxgWic3m3sPsQJQgqBDfV/HchCbcKw4EMInYhypYEJsR3eZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjqDlz04ZHJ1O1uKdizqU1iQf7raZFrx37RV2ckVO50=;
 b=SY5YEfe5Ciu242PFPLxh6dT1nnx665snVuvHopvLLJ0bGWPqTjZvs+Hd+77IJF6CuFbN/20x8b21UQBvISsFSIgDwlGM+ZvHTxHAhtTFW3vD9exEuEp/aFVgtlreG1dPDbpkVfiiaTHo9h8GL2xP88+2Fs7i4SPzgd+KV8pDi3A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/4] tools/libs/ctrl: don't set errno to a negative value
Thread-Topic: [PATCH 2/4] tools/libs/ctrl: don't set errno to a negative value
Thread-Index: AQHYVIiq0AHvGYuWHEC71M7mTuQ1Nqz8BqQA
Date: Fri, 22 Apr 2022 14:47:14 +0000
Message-ID: <9708f9e4-9b75-3572-b5e0-7c0eb2573cf8@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-3-jgross@suse.com>
In-Reply-To: <20220420073119.16974-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb4eb2b4-29e1-4dda-ade1-08da246efd91
x-ms-traffictypediagnostic: DM5PR03MB2826:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB28263D8F5B0BD5534D6A1737BAF79@DM5PR03MB2826.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CiKC9KGNjiVW4S3GrpB4MP6UcGKn9f8YhBLL6JWlJVeG1FcaoicBAvNYhMPBQ7CgLTqqXtUOcjKCh1BHIR7CwZglTA5doJ11SOCQ0JoEgrTKLKMRKJjksEtQy+seXa1uIIGQXV6sS3omglBEslXwMMaSaJSCTsYkqd+RSii2z0n9WedW+shKLZKYhOwUofjoH3FQpGiBMR9vyEzqvTuAI6IvD0hYCuK600rZGZQO6WlIRzeVPUtcS/2iyEXY6sdl2QGzthk09DUmF0Z89xZ2yXjFp6okRR6CaFhPewnDGH4niTHCVgpxRuWti5YKHLWuUqRLx/sAfjPAzUP7fv5vb0/m64WRNjrmZ5ZheKL1gQW+hkRYYpbQNWDsW5nlgTMCXz79op1gqaLIeYstfKoPnwHHBsRjbT2VQpKACNs+GJCD7jmpLZKflRWmbn7RZ7tTXmpHQnixuNzlhpf86VFBbfAtVDYN3U5n8Ss4EB6mnHxegzvupTCb0CjORIHNAdceW4UImsbK5dZmgnSCNdnT4J/weVi6RkogLC8cPt0u6yAA9JupTXlPHGZlkFAU2JXeKAoBszkcp53fW14LD2oon/5Fyl0GSFZ5nl1Mo0zs4Rt5Q2/n96qb7Faju1xvqPEqmedFyqNbi4HA7qWAfa2WR9KTkC4KkwYWRwu5EQA2L6SIkPB6nEA1EvnM25SbmZvdAqT4/FBt3pDur3r6AB2xQ+CSNJN8LHZANSc/ByLHZrh3wk3P3DwXJBVtyufxq/lJ2pjidE8jvgP0HHeK2MmCUQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6506007)(26005)(4326008)(8676002)(36756003)(71200400001)(53546011)(31686004)(31696002)(122000001)(82960400001)(508600001)(86362001)(64756008)(66476007)(38070700005)(38100700002)(6486002)(66446008)(76116006)(2616005)(5660300002)(66946007)(186003)(91956017)(2906002)(558084003)(107886003)(8936002)(110136005)(66556008)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXhYeUp3dEhSUERpTEp2M3J2VHo1REJ2Q1Jmdk1UQzhqV0dKZ2VyeDc0ZWtI?=
 =?utf-8?B?TXB0SDAyODRUTmdiMjdmaHZ5eFBSN0ZQck04aG92eHBTM2dOL1VlUXBuVWc1?=
 =?utf-8?B?cU1uWFY5aUFJaTkxMEFEcDZMUC9QVWFabHRPUDdGaHR6ZThIbWVKQmlLTG50?=
 =?utf-8?B?WDFMaG9qMUNOU3RKNlJYbjI2T1VLcXdMQ0dkWlhLUjNCR2s1eHRURG5UazBl?=
 =?utf-8?B?QlNPMjN3bU9Zaitzbjkzc09QNjFVaXdmWStUR3lyTmVvdlNmQnYwRXpQVUpC?=
 =?utf-8?B?L3dWVStLMnhHc2MvTzJNSzBwT0JPUFpreUZHQU9odWU3NXVnMTBkQVVBSUho?=
 =?utf-8?B?S2tRRjExWTV3UnNWNnVjYllsL0QyNUxqczdac0hNcUFrMkNVYzJEZ1lpM0kv?=
 =?utf-8?B?S3NoYVFHYzE3dWo0RGxEYWk1ZU1pU2NvbjhsWkJ3WmtkNjN4Sk1MRnNBRXNJ?=
 =?utf-8?B?dE9tZU1zTXc3MmU1endDeER5VFBRbHdlcWpsMXJwaUhIcjVncFQydFVEQUZV?=
 =?utf-8?B?UCsySFFOdnl3emc4NFdFcFZkZ2dKMlJndFhNMmRnS3g5K2NqL0lYMzQvWDRF?=
 =?utf-8?B?b0YwL0s2b2MyQUUvcUhmbUlMYzFGMmEyWlh4VnRJaURZUkM1ejZKTGpTeGR4?=
 =?utf-8?B?UFJaWTZ3cGVXaXVJTkxyNzBybWdMQzNMbEpXRng3bVdQZ0N0SFNHL1BobTZr?=
 =?utf-8?B?dzZtdUNqaURWTXFZRUUvdXVhVjQ4bzVrak4yQUs1VkI2a3YrTER5VEZSZlRa?=
 =?utf-8?B?eWJyNHMxVlorZExYa0ZNL2VCeVV6cUJ6eWlDTnpLT2w5aTk4WjIzU213YjVG?=
 =?utf-8?B?bVpEK0JpNHg0bUdBVEM2K3E0WlNEL05mSmZNcExiZDBPb1NqNTFuTGp4MDhk?=
 =?utf-8?B?WStXU01pRm5sZlNDYm9HNlRaQU9CeXV4K3VrZmhJTUJaUDY1akkzSDJlajl0?=
 =?utf-8?B?OGxUTnRORmJrdWRsdGdzNXZIUytvWTdZQ0JiQmRycU9hS3VYR05CVDh6SkVL?=
 =?utf-8?B?cXFYV0VDWFFMenhTMnVsbTdqVlZxVzVTWmgzVS9kM3FXTTEyc1dUKzY3U0p0?=
 =?utf-8?B?SDVxTUpib3RkWXBDNlpEOHlPT1dQcVplKzRjUVR6dVJXRGhUMXlvbWh6NUto?=
 =?utf-8?B?U1YxM0V3dmJKWlUzR01nRUtwOHNhTitSUTYyUTRsUVJnTSswbTNiL1V3V3R4?=
 =?utf-8?B?am1QUEVYbHYzMEdBRjVDLzZoeDZlWTJ4NUh1ck8xcEdQZS9ZOWVBSHdLYjBK?=
 =?utf-8?B?bk1sb0hYNHdMMklnUW53MU83ZTF3cUszYkx0bzVNeU94OGYxekdKdTEwSmhh?=
 =?utf-8?B?WUp1ZW84a0Q4ZHRnTWtQNmtGL3c0NGl0TzhyT2ltei9QTnNBNXpab2ZhY1hH?=
 =?utf-8?B?NUpEaitJTkEvOUFiZ0NSdnYveW51V0RKYUQzNlloSnIwanVFQUZaVDhkb0xm?=
 =?utf-8?B?VnRwbC83MjNaZHZJVkE0b1RpbFkyVmtobnA0RUhUVmZMTmt4Rktoak8vemNn?=
 =?utf-8?B?QlhJUWFVZCtTa1d3L0xqcndBWnlOY2daKzlVUkU0TXVMYXVmT0krdWVVekFz?=
 =?utf-8?B?eFFSZDZORHZxY3VxVDFoa2JteTVrbmNaVGdYcUxuS3pyQnh1dHVZYnJQbnpr?=
 =?utf-8?B?VXdRSndRUXBlZHQwMktJRUcremdRYU1qWUR4NVczUkZ3OFFCNUlMeXM0OE01?=
 =?utf-8?B?SWZYSmRkRi9BOVZjcEEwdUVOTzcyeDlOMmU2SzR5VWdWMVJBdTVPY2MwdDJ2?=
 =?utf-8?B?WjQrT2ZVUHBHQngyY0xWcjBOMFIzaUVNcW5SZ2dhSnZ5YUkyV1R1YjJadTY1?=
 =?utf-8?B?eXRPRFhwc1hmc1MrZ1ZqNkJubk9vN3pqZDhoVWtnRWkrcTBRNGdNdlRvVW96?=
 =?utf-8?B?YnEwVDdHeC82cGR1T0p0a2Y2LzF5Tk1ZRTU2VnNhY2xDNnA4T0xuR011ZHBS?=
 =?utf-8?B?WGxNcndmV1I1SUJyTGtLcFFueU92N2E0QjVmSXV6cGNtQkhrR3RKTU5aTHlQ?=
 =?utf-8?B?TURVallqcjZoTys3aEN2aVZkd1UyWVRHVVRsVm9ZMEY4ZzFPZm9oTVljK01V?=
 =?utf-8?B?bVFIWHBBY0NIenNzdUJuNU9GSXNFMDR5OFpvbGNFSDRwb2FSKzdsbjNDbDhp?=
 =?utf-8?B?bnhoaHdiOFNzOU00ODNtaW90RHJ0OXd2U0lLSm5HekE2YXU0VHQ3akxqbGVN?=
 =?utf-8?B?RnJaSkJMQWdwaDJhd3BveVpuYTBobFZPbCtCU29zUVE2S1hSOFVHTEY1eWdu?=
 =?utf-8?B?MGJBUE5BS2prUFd2UlppWldZam1Bb1N5THp2NnEwQ1UzSGJ1eTd0U1dZb2RP?=
 =?utf-8?B?NlB0TnNTcm9XaFBqUlArRDB2WERvUTFPTEhBQStyRjdUYWtPNGxPZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7E60276AFDFA447875D935C1DACA16D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4eb2b4-29e1-4dda-ade1-08da246efd91
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:47:14.5219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBxiZiMegqrqbgbpMVgRxRzgGMXLMO7UxllvPrE42jzRsmz2ZceTtfB53j6s2mk60hJmjORowhPvkZOGr4asHBq7hMrebVLGHqZ1H8hd3mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2826

T24gMjAvMDQvMjAyMiAwODozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gVGhlIGNsYWltZWQg
cmVhc29uIGZvciBzZXR0aW5nIGVycm5vIHRvIC0xIGlzIHdyb25nLiBPbiB4ODYNCj4geGNfZG9t
YWluX3BvZF90YXJnZXQoKSB3aWxsIHNldCBlcnJubyB0byBhIHNhbmUgdmFsdWUgaW4gdGhlIGVy
cm9yDQo+IGNhc2UuDQoNCkZpeGVzOiBmZjE3NDVkNTg4MmINCg0KPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

