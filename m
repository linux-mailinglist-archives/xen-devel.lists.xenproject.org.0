Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345686641F5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 14:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474709.736005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFEkv-0001qJ-8b; Tue, 10 Jan 2023 13:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474709.736005; Tue, 10 Jan 2023 13:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFEkv-0001nU-4v; Tue, 10 Jan 2023 13:33:33 +0000
Received: by outflank-mailman (input) for mailman id 474709;
 Tue, 10 Jan 2023 13:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4Du=5H=gmail.com=tushar.goel.dav@srs-se1.protection.inumbo.net>)
 id 1pFEkt-0001nO-As
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 13:33:31 +0000
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [2607:f8b0:4864:20::d35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e910951-90eb-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 14:33:30 +0100 (CET)
Received: by mail-io1-xd35.google.com with SMTP id p9so6044386iod.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 05:33:30 -0800 (PST)
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
X-Inumbo-ID: 5e910951-90eb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V3B/LM8ZUGd4RO9vFOApASAS0OMkoE1zSbESnKwfo80=;
        b=TCfM9fZvFXL8U2n2TDqCunyJLRqPI+LzBxBx7rN4GmAw99Clh+0jHGKDPKg/ATX4Mm
         vYh1nBAXKRvPYKRfZTzWhxu1DbxogJToYli2+DAABy2AMsdKdQv+XiuFLrX8oqIQvi6k
         OayzLCeP+DnUIfT+ihn9/ItOu7YbAUoryvsvz39qjyYl397Y2T3aV08VuYWvCHL04IKH
         pC1TPaTpGnPIFI0+vGGSlHweYo7Qi9o2MNKz+d2l4perteGjlOOWXVanXn7pGMG1nq+J
         HM+uf9evLOroNbpdaeEKW3tfDYpICieOSLWAS5nzrSszenoKgCoUCVzBGUI3RjgH2gQL
         dCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3B/LM8ZUGd4RO9vFOApASAS0OMkoE1zSbESnKwfo80=;
        b=XCQvfBPw8dZ3bDOz6OF9+2p2l474nfCsfYhHrpSwrDzje8363uWJLlHVEVAuP58Krr
         rD/Oie9dwETmxLzvuENsv3W+B8BFXXETu5xmrvX1q2UCR9PATp06uXc2H6hF5t2P+hR9
         gwZWT0KZ35tmXRFgek4kEnK+JDlpAiXGqE+knG7D/DfvmcB9CopolhU/Ia9MNRXO5ckA
         UFlSHGeTbKGHBK9RhAPgaMnqu6W/Cx32POZZj7NFmRL/f3W535Q/brhCFxPpZ4ZmB8aA
         GmrVBdKVqn/B8NpLK9EBTGPXTVyJdKRQC3Heq4HMlo7biq4Gm27DjqRzyTskzJujitKq
         VgBg==
X-Gm-Message-State: AFqh2kqCd28Q0Mwzap3zFDWHkqC/w6X2SsPGPRp/MGMLhvzJ6hTJm2G2
	vcViRPQIF00XbmoMsEMGiY4EA1SA+tMa1wlQMbCabelWO64kRZnC
X-Google-Smtp-Source: AMrXdXvqZlt8jWkcNV1EmfKGs/OFDLp8qvjNoyUc8wXHMbDIhYCX91ej8+/jLFnzebcEoszfKJWR7VIyX2vNomoGDT8=
X-Received: by 2002:a02:ce97:0:b0:38c:886a:2140 with SMTP id
 y23-20020a02ce97000000b0038c886a2140mr7253968jaq.224.1673357608791; Tue, 10
 Jan 2023 05:33:28 -0800 (PST)
MIME-Version: 1.0
From: Tushar Goel <tushar.goel.dav@gmail.com>
Date: Tue, 10 Jan 2023 19:03:17 +0530
Message-ID: <CAFD1rPdT5Tod+qdit50EWBN6WyRuK2ybb2G2HmOAayAV7uyBuA@mail.gmail.com>
Subject: Usage of Xen Security Data in VulnerableCode
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hey,

We would like to integrate the xen security data[1][2] data
in vulnerablecode[3] which is a FOSS db of FOSS vulnerability data.
We were not able to know under which license this security data comes.
We would be grateful to have your acknowledgement over
usage of the xen security data in vulnerablecode and
have some kind of licensing declaration from your side.

[1] - https://xenbits.xen.org/xsa/xsa.json
[2] - https://github.com/nexB/vulnerablecode/pull/1044
[3] - https://github.com/nexB/vulnerablecode

Regards,

