Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B372B455F4E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227476.393432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjEW-0002Lc-0U; Thu, 18 Nov 2021 15:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227476.393432; Thu, 18 Nov 2021 15:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjEV-0002J1-Sc; Thu, 18 Nov 2021 15:21:51 +0000
Received: by outflank-mailman (input) for mailman id 227476;
 Thu, 18 Nov 2021 15:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnjET-0002Ip-SW
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:21:50 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ee8c088-4883-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 16:21:48 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIETkwv015902;
 Thu, 18 Nov 2021 15:21:45 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdrn5r706-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 15:21:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6066.eurprd03.prod.outlook.com (2603:10a6:208:165::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 15:21:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 15:21:42 +0000
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
X-Inumbo-ID: 3ee8c088-4883-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiN+r28+EllmMop/LzwlD9srtF6NYvGNwgXSrden6Z9XwmH6jMMxr2tZyqYClybpdUoEovZ8LNFpkBIrd/nFgLpShPFqzpNQ9P5NFO78fHwpcV5nRqIlxIB8wlO0zzTIwx7Iz0ErkJXNOr0uTVqOaPe8tFyg+ZXsrGJl4LKjEIVkG46Y0T7tZiOFCVOi+XycrTdqp87tNX4fJYea8nygUDBlQoxhTtpJUS9NP+Sum0CYXl8qRqKjBbxGZt3TC7OOgcNdu3SiUn+tIIcHBv1LFd7yjDeJBZSeNx6vcG1opVSQlYP5FtuumJufV6lM9nOwYyZc4t/QTVdvP6TM9Le4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MwVL3sl2M5CNWWB2Vn2eU1bZ/T930eX33fqbGsYutI=;
 b=bz+8hpA6Ty5ZO+TLRCz7bPebIZ9WdoGsGxTvbYbPiMrix+cXx6zsgjjcv8GYqXmlfE8ZQubQAZKhbJ8UpCVa0tiy59XvOO8GE+wqAYkKgm6MgyImtfUku28nTmWmRKLqWIdBBS8YzjOq72SZBhKIF5HUG/4lUzKxIYcHfDLEKt8NeTQZejnfdbjg/HGz6yoxIeOd9gDgYDfmlP9etClHZEoVa3Y6zR0qU2QwE2MxRvI6RaaBF2YcAYq6qPM9d5CtUuwEOy89KK3osZTRfcBgyoontkznk+hKSg4qmow8p9aL6W7eFya/x7bWqCrtky6kTq9atj9JBB82wUR9GZwRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MwVL3sl2M5CNWWB2Vn2eU1bZ/T930eX33fqbGsYutI=;
 b=BAoAGx5+fWCAjTA31wN0ZsnXl9Szs8wfeZVBIoO3YNL01iMCBCsDtUgZ721q3FZ39nYTCa5HwiLHZDDhGTDUeDw9Ym9B7/pvr4BlU70f9H+yy8sBowzqfZR54Z6AoIhbHvkIM/+IplBXfq8371lJhKxVqnoC2Y3a5QTUGnT2dKB3rIl+wM3Gukbd/MNnUWWgQUE+9Atq9PdO0UM6yYnQlaUzQNi1o+qRRDt6ezB11I2AIi7FlBuyH8AWoSA+OT1AWyQSi1txxJSzXiiFTGof4cC1KRVAqyT8AXkbK1lkF2sKDG71TXksQV2XPoOuBEyCHgar0ALwJgRrc78vWX54BQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYA=
Date: Thu, 18 Nov 2021 15:21:42 +0000
Message-ID: <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
In-Reply-To: <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b5b221a-43ff-4ce3-98e8-08d9aaa71feb
x-ms-traffictypediagnostic: AM0PR03MB6066:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6066488BAD97EE1E5AE2E398E79B9@AM0PR03MB6066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 t5w2xcyT4e9/ikdpYWJBHX/WPLkYNAvIaZ6NRZPUQ4p0bjCKPW3PBTcrxFxMJAKpsrxp5UvTMU14E56USWYINAfgNsJr4RcjIt88/XoI/FUoFbzZ5t5GV5FZH+J8Ys2xMIGRpS8/Ox59iwn1jE1dnTvMbkvCifvekFy3tjgOELvCguM5RzvsuVY//oACpAhqVxs93haj0qbRu/tW3EW9FMJPyp/07vEUuQY7nHVivKuX+X4vTrBpQ1gxoIa6PdVYTylkRm/WsQKnTkG7a1l2/Muc1cQwIT0tiNQ1IsPIboKhguQLthVlbB7ZB4jFw70t6X9oRYmkry7i3XEi0eijaBzhvmefKAGp42Fsy2vyEJU8nKXQ2Yt5SQC6r8JdBBy9E8SWJoktIBquRsL1LQM6nHPuUqQ8PkD3Vlj7G6FYbdx/tBR0dIcNSr8NGhnfdnwpxHtWGugoPMxZaYZ8M9zTiTT4yPt8GqVcXOe8g40QdSImoPX+Em4l+Ag4+cPIR5Uus4tmvhXt0mCJOa6F+jQDmJhjwrgiz2WoZPgefWrqFGTyoIuKvmScV9w0c1Hbv0xAELeSTlKxl50BmxdOrqdknzo0BbCc7dCi5a4pNpSMCnPqoQt/DzN32A9vCiId0uPlRSQPskiR2aA/JMrdHNcWNqXFbsdW1/FbYs7AVeGMedoEU+gQQFI6jOa6RfWdPjnZN1bN17xxtaTAI4vJWVIu3TtjXAxHv1SAIUTNlgXrFAWpYA1Odq+JxlDCYA6BwVq9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(7416002)(508600001)(6506007)(76116006)(53546011)(31696002)(31686004)(36756003)(38070700005)(54906003)(6916009)(122000001)(8936002)(6486002)(316002)(26005)(4326008)(2906002)(6512007)(5660300002)(83380400001)(86362001)(38100700002)(71200400001)(186003)(107886003)(66476007)(66946007)(8676002)(66556008)(66446008)(91956017)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cUJOb2lsS2NNcytneWdsL2JxUnhJL0ROWnZoQ0s3bm0xNHgra0xuTE5nS3k2?=
 =?utf-8?B?bWhyMDB6WjhQOWtGRkdzUWxZdmxhUU1MdVZQU2RQeDlHMkVmbmgzWTR6ZlFD?=
 =?utf-8?B?L2lvc1hmSVMyekY5OGoxRi9US0xQTVhxSDN1UFJTTGNUZW5OSythcUdPeGpV?=
 =?utf-8?B?SW5vV1k4SFJtOFpFbE5yTVczNnlvbGQ0WkJrOHFKNDdwbWpqaXluWFRCOG14?=
 =?utf-8?B?Slc5clRpU0l2R1lFMCtpMXBxZnlJWlJuNXowSFF6UWF1UUI1VmxlcXBuWWtx?=
 =?utf-8?B?RWhaWU1qcWpqcXZBUlZpWU50UVprYnM5N1NRc0szdDdXbmRmTmdxVGFYNWF0?=
 =?utf-8?B?OStDOGFZUktQdFVhRWhRSDh0TWhESzNHczFoMUNRWDRZYjZJMm5IM3drM1Fn?=
 =?utf-8?B?Sk90T0JqYytuWVF0UlFtOWdnRmVEaDdoOWJRSmpmRmdGbmxhNmFlSE5PZFNu?=
 =?utf-8?B?bFU0SE5aSHh2UGNnS1BESnVLZHY1U1dkSVJ3V3pNNmhwV291M2NZR0FTSkd4?=
 =?utf-8?B?czNLZWRvWU1oOURUQzhSZDljZG83SE53dVZLVDN6QStFeG1WdmoxNHVjSy92?=
 =?utf-8?B?NTZxcHJKWTJRcjk4eTd1ell5MFhMT3RkK0MweEFrSEh0bE5KR0JiQnNmZnpD?=
 =?utf-8?B?Sldrc2JKY2FqdE5qRXhHblBxbWhyTkc5djhRUE9FY0RoNjE5cUs0R0VDMTNz?=
 =?utf-8?B?eVJkOXBiTTJ0bG1XRlNtYUd1L01jVGQ5RWJ5TWxZWnd3ZGlhN1pCOVdOWEhl?=
 =?utf-8?B?QVltSVpDRTdLdkk0NjNOK3VWbjRPVnQxK1l3N1BDT2pEcHMzempIdnpIbXVr?=
 =?utf-8?B?TDhaQmVTQjhsZW9KSVRjLzJINEkyaGVUNWgyYkQ1NVZ2dGppL2FRZGhscjhx?=
 =?utf-8?B?RXVCdFFwZnRvMmJKZllJakNmMi80VDgxZWQwRVhWMnFSdWUvNUhsbFVnZHRz?=
 =?utf-8?B?WlJQV2dqQSs3WXRmUE9KNHNTK2tsNFUxZGlEMXY5SnNEOFV3bzBvODZFdWF4?=
 =?utf-8?B?SVRhci9BSW9ObHcyMTJIUXZBS0NSOUxEcHdrWXpVOHo0TUZsem5xU0MvR25J?=
 =?utf-8?B?VDlPTXdGaEhDdVp5UDFkVUFYcmYrNzhrblpsaWpSZzRRZXI4RFZBNVJIbkJx?=
 =?utf-8?B?NitRNUFJSkdpZHBoTkFKY1BDZ1plbFNBeFJNOWdvNnF6OVU4d1JmR1BzZUNG?=
 =?utf-8?B?RXFlOGM0OUJRdnNhU2puTWtxRndxMW5RWHJSYTlnMlh0ZGFEcDlBNzJjdHZV?=
 =?utf-8?B?cnNYeE5Zb3BPdTFZK1FNTlVhUEpxNVRWQWhPQ1dhdnpJeGFTS21UVWkrQlUv?=
 =?utf-8?B?S0o3Q2x0eFhZVE9UNVlaL05BcHh6RlVSWnFvclpmUkloeFowdFFYV05nRyth?=
 =?utf-8?B?SjZOb3gxT3ZlaXB1UUFIOVhpN3I3SmpwQUVPUTcyTE5yRVFtWlFFWFpzVmJW?=
 =?utf-8?B?Y04zZjJvRFBBQmI4a2V5Nm1FV3BzTU5kVVhzNkZGRnRhLzFhRkd2SGxtMmFy?=
 =?utf-8?B?NWVUbWVIWHN4aTFKVVNVZFltNkZQTGtyU0JaNFhBM3cra1N0c0J2ZEVhck5n?=
 =?utf-8?B?bE16ZUhDNGF1M0VISmtwRVNxZEFSd1ZOWkVJU2pUTzhSUjg4bzIvU1dDSzdY?=
 =?utf-8?B?Q3J3Ylo5KzNTdlc0NGlGUHhGRnNYTFhtaTJhL1gvelRhWXBuVitocDBVK1pG?=
 =?utf-8?B?dkxYSzRoejNhQ1FLT0xFeXV5QkJpeHpGUzFMaC81VnNZenM5MU4vVEVhRE56?=
 =?utf-8?B?U2NXeFJRV0d2dWdaTUpObk5GNkl1L25BVDUrZjdlVVRFdVNLVWY4ZXY0Nytn?=
 =?utf-8?B?VlVrSnUvbEFtbTNwUDhXQVVGb1Fzd2JjWm5seUp3WmhUWC9waU5qa3MwWm5I?=
 =?utf-8?B?cHR1REZJTXU4bFpKaFc5Wi9jYzcxaUxoT2RtYUNnblBOTHo1SkJ6ZkpveVZB?=
 =?utf-8?B?cFkrK2dGNnRZU1ZtL0RyYWxuakpaOXM3OUloQWdpdm9FeXJFYTNBTitqMEdk?=
 =?utf-8?B?QktUSXBsbHdjcysxZ0VKL2hCd0h0bmx6Y1pnQnpEZTRHL2h2WWxtbkVlNmY0?=
 =?utf-8?B?aUJ0eDQ4bTNtWEFPS3Ftdi85QXUzNlVKT3RKeXdpS2FFcnBicTdJK0o5TjVJ?=
 =?utf-8?B?T2hCYTdhSTlJVVhob1pseFJvcVc2V29BTmVLbkUzK0dzN3ZlZXp1cHZ5OWl3?=
 =?utf-8?B?MFJjQ2Q5ajcvN0VEKzdxNFFWNjNWVE9ZQWtIbUh6TnZJT244Nm03OURHVUZl?=
 =?utf-8?B?a2krZGFrMHBwczEvY3JPeEFXYmtzUmd5MGhBSzBzNHNNNjZnVWpPOWhLdEtn?=
 =?utf-8?B?dTdoSHNuQWNIY1oxeGtrWDVxeEtCSGhYZHM0eUt1V2d2VGkrOUNudz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B86488ECD8DE384B82BB3155E0AC8D70@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5b221a-43ff-4ce3-98e8-08d9aaa71feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 15:21:42.0235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95kfBj5+YtlxhNFPMh1RXzV+GVd57Zlu+ox/J6jyTy/4TiJaBL2a8YEpD96NW2lDA1W0Qc/eTViRPM+qxFQsjPqCsmEtSvigCwbCz/ItEb4Tz+we4F+VVQNbc9AL7/u9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6066
X-Proofpoint-GUID: gjtHd5xjnqekUNy2vZtDipF90IwqdfIx
X-Proofpoint-ORIG-GUID: gjtHd5xjnqekUNy2vZtDipF90IwqdfIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180085

DQoNCk9uIDE4LjExLjIxIDE3OjE2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAxNjoxMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTguMTEu
MjEgMTY6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE4LjExLjIwMjEgMTU6MTQsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOC4xMS4yMSAxNjowNCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IEluZGVlZC4gSW4gdGhlIHBoeXNkZXZvcCBmYWls
dXJlIGNhc2UgdGhpcyBjb21lcyBmcm9tIGFuIGh5cGVyY2FsbA0KPj4+Pj4gY29udGV4dCwgc28g
bWF5YmUgeW91IGNvdWxkIGRvIHRoZSBtYXBwaW5nIGluIHBsYWNlIHVzaW5nIGh5cGVyY2FsbA0K
Pj4+Pj4gY29udGludWF0aW9ucyBpZiByZXF1aXJlZC4gTm90IHN1cmUgaG93IGNvbXBsZXggdGhh
dCB3b3VsZCBiZSwNCj4+Pj4+IGNvbXBhcmVkIHRvIGp1c3QgZGVmZXJyaW5nIHRvIGd1ZXN0IGVu
dHJ5IHBvaW50IGFuZCB0aGVuIGRlYWxpbmcgd2l0aA0KPj4+Pj4gdGhlIHBvc3NpYmxlIGNsZWFu
dXAgb24gZmFpbHVyZS4NCj4+Pj4gVGhpcyB3aWxsIHNvbHZlIG9uZSBwYXJ0IG9mIHRoZSBlcXVh
dGlvbjoNCj4+Pj4NCj4+Pj4gcGNpX3BoeXNkZXZfb3ANCj4+Pj4gICAgICAgICAgIHBjaV9hZGRf
ZGV2aWNlDQo+Pj4+ICAgICAgICAgICAgICAgaW5pdF9iYXJzIC0+IG1vZGlmeV9iYXJzIC0+IGRl
ZmVyX21hcCAtPiByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpDQo+Pj4+ICAgICAgICAg
ICBpb21tdV9hZGRfZGV2aWNlIDwtIEZBSUxTDQo+Pj4+ICAgICAgICAgICB2cGNpX3JlbW92ZV9k
ZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+Pj4NCj4+Pj4gQnV0IHdoYXQgYWJvdXQgdGhl
IG90aGVyIG9uZSwgZS5nLiB2cGNpX3Byb2Nlc3NfcGVuZGluZyBpcyB0cmlnZ2VyZWQgaW4NCj4+
Pj4gcGFyYWxsZWwgd2l0aCBQQ0kgZGV2aWNlIGRlLWFzc2lnbiBmb3IgZXhhbXBsZT8NCj4+PiBX
ZWxsLCB0aGF0J3MgYWdhaW4gaW4gaHlwZXJjYWxsIGNvbnRleHQsIHNvIHVzaW5nIGh5cGVyY2Fs
bCBjb250aW51YXRpb25zDQo+Pj4gbWF5IGFnYWluIGJlIGFuIG9wdGlvbi4gT2YgY291cnNlIGF0
IHRoZSBwb2ludCBhIGRlLWFzc2lnbiBpcyBpbml0aWF0ZWQsDQo+Pj4geW91ICJvbmx5IiBuZWVk
IHRvIGRyYWluIHJlcXVlc3RzIChmb3IgdGhhdCBkZXZpY2UsIGJ1dCB0aGF0J3MgdW5saWtlbHkN
Cj4+PiB0byBiZSB3b3J0aHdoaWxlIG9wdGltaXppbmcgZm9yKSwgd2hpbGUgZW5zdXJpbmcgbm8g
bmV3IHJlcXVlc3RzIGNhbiBiZQ0KPj4+IGlzc3VlZC4gQWdhaW4sIGZvciB0aGUgZGV2aWNlIGlu
IHF1ZXN0aW9uLCBidXQgaGVyZSB0aGlzIGlzIHJlbGV2YW50IC0NCj4+PiBhIGZsYWcgbWF5IHdh
bnQgc2V0dGluZyB0byByZWZ1c2UgYWxsIGZ1cnRoZXIgcmVxdWVzdHMuIE9yIG1heWJlIHRoZQ0K
Pj4+IHJlZ2lzdGVyIGhhbmRsaW5nIGhvb2tzIG1heSB3YW50IHRlYXJpbmcgZG93biBiZWZvcmUg
ZHJhaW5pbmcgcGVuZGluZw0KPj4+IEJBUiBtYXBwaW5nIHJlcXVlc3RzOyB3aXRob3V0IHRoZSBo
b29rcyBpbiBwbGFjZSBubyBuZXcgc3VjaCByZXF1ZXN0cw0KPj4+IGNhbiBwb3NzaWJseSBhcHBl
YXIuDQo+PiBUaGlzIGNhbiBiZSBwcm9iYWJseSBldmVuIGVhc2llciB0byBzb2x2ZSBhcyB3ZSB3
ZXJlIHRhbGtpbmcgYWJvdXQNCj4+IHBhdXNpbmcgYWxsIHZDUFVzOg0KPiBJIGhhdmUgdG8gYWRt
aXQgSSdtIG5vdCBzdXJlLiBJdCBtaWdodCBiZSBlYXNpZXIsIGJ1dCBpdCBtYXkgYWxzbyBiZQ0K
PiBsZXNzIGRlc2lyYWJsZS4NCj4NCj4+IHZvaWQgdnBjaV9jYW5jZWxfcGVuZGluZyhjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+IHsNCj4+ICAgwqDCoMKgIHN0cnVjdCBkb21haW4gKmQg
PSBwZGV2LT5kb21haW47DQo+PiAgIMKgwqDCoCBzdHJ1Y3QgdmNwdSAqdjsNCj4+ICAgwqDCoMKg
IGludCByYzsNCj4+DQo+PiAgIMKgwqDCoCB3aGlsZSAoIChyYyA9IGRvbWFpbl9wYXVzZV9leGNl
cHRfc2VsZihkKSkgPT0gLUVSRVNUQVJUICkNCj4+ICAgwqDCoMKgwqDCoMKgwqAgY3B1X3JlbGF4
KCk7DQo+Pg0KPj4gICDCoMKgwqAgaWYgKCByYyApDQo+PiAgIMKgwqDCoMKgwqDCoMKgIHByaW50
ayhYRU5MT0dfR19FUlINCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiRmFpbGVk
IHRvIHBhdXNlIHZDUFVzIHdoaWxlIGNhbmNlbGluZyB2UENJIG1hcC91bm1hcCBmb3IgJXBwICVw
ZDogJWRcbiIsDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnBkZXYtPnNiZGYs
IHBkZXYtPmRvbWFpbiwgcmMpOw0KPj4NCj4+ICAgwqDCoMKgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2
ICkNCj4+ICAgwqDCoMKgIHsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKCB2LT52cGNpLm1hcF9w
ZW5kaW5nICYmICh2LT52cGNpLnBkZXYgPT0gcGRldikgKQ0KPj4NCj4+IFRoaXMgd2lsbCBwcmV2
ZW50IGFsbCB2Q1BVcyB0byBydW4sIGJ1dCBjdXJyZW50LCB0aHVzIG1ha2luZyBpdCBpbXBvc3Np
YmxlDQo+PiB0byBydW4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgaW4gcGFyYWxsZWwgd2l0aCBhbnkg
aHlwZXJjYWxsLg0KPj4gU28sIGV2ZW4gd2l0aG91dCBsb2NraW5nIGluIHZwY2lfcHJvY2Vzc19w
ZW5kaW5nIHRoZSBhYm92ZSBzaG91bGQNCj4+IGJlIGVub3VnaC4NCj4+IFRoZSBvbmx5IGNvbmNl
cm4gaGVyZSBpcyB0aGF0IGRvbWFpbl9wYXVzZV9leGNlcHRfc2VsZiBtYXkgcmV0dXJuDQo+PiB0
aGUgZXJyb3IgY29kZSB3ZSBzb21laG93IG5lZWQgdG8gaGFuZGxlLi4uDQo+IE5vdCBqdXN0IHRo
aXMuIFRoZSAtRVJFU1RBUlQgaGFuZGxpbmcgaXNuJ3QgYXBwcm9wcmlhdGUgdGhpcyB3YXkNCj4g
ZWl0aGVyLg0KQXJlIHlvdSB0YWxraW5nIGFib3V0IGNwdV9yZWxheCgpPw0KPiAgIEZvciB0aGUg
bW9tZW50IEkgY2FuJ3QgaGVscCB0aGlua2luZyB0aGF0IGRyYWluaW5nIHdvdWxkDQo+IGJlIHBy
ZWZlcmFibGUgb3ZlciBjYW5jZWxpbmcuDQpHaXZlbiB0aGF0IGNhbmNlbGxhdGlvbiBpcyBnb2lu
ZyB0byBoYXBwZW4gb24gZXJyb3IgcGF0aCBvcg0Kb24gZGV2aWNlIGRlLWFzc2lnbi9yZW1vdmUg
SSB0aGluayB0aGlzIGNhbiBiZSBhY2NlcHRhYmxlLg0KQW55IHJlYXNvbiB3aHkgbm90Pw0KPg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

